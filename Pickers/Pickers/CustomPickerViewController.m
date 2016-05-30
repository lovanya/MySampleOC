//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Bruce on 16/5/22.
//  Copyright © 2016年 Apress. All rights reserved.
//
#import <AudioToolbox/AudioToolbox.h>
#import "CustomPickerViewController.h"

@interface CustomPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *spinButton;
@property (strong,nonatomic) NSMutableArray *images;
@property (assign,nonatomic) SystemSoundID winSoundID;
@property (assign,nonatomic) SystemSoundID crunchSoundID;

@property (strong,nonatomic) NSTimer *paintingTimer;

@property (strong,nonatomic) NSMutableArray *numInRow;

@property (readwrite,nonatomic) int num;


@end

@implementation CustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.images = @[[UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]
                    ];
    self.winLabel.text = @" ";//注意引号之间的空格
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//按钮点击事件
- (IBAction)spin:(id)sender {
    self.spinButton.hidden = YES;
    self.num = 1;
    self.numInRow = [[NSMutableArray alloc] initWithObjects:self.images[0],self.images[0],self.images[0],self.images[0],self.images[0],nil];
    [self startPainting];//开始定时器
    
    if(_crunchSoundID==0){//播放声音
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"win" ofType:@"wav"];
//        NSURL *soundURL = [NSURL fileURLWithPath:path];
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"crunch" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_crunchSoundID);
    }
    AudioServicesPlaySystemSound(_crunchSoundID);
    
    [self performSelector:@selector(stopPainting) withObject:nil afterDelay:3.5];//停止
    
    
}

//轮盘轮转方法
-(void) run {
    
    for(int i = 0; i < 5 ; i ++){
        int newValue = arc4random_uniform((uint)[self.images count]);

        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.numInRow replaceObjectAtIndex:i withObject:self.images[newValue]];
        [self.picker reloadComponent:i];
        
    }
}
//显示按钮
-(void) showButton{
    self.spinButton.hidden = NO;
    //self.winLabel.text = [[NSString alloc] initWithFormat:@"%d",self.num];
}
//播放获胜的声音
-(void) playWinSound{
    if(_winSoundID==0){
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_winSoundID);
    }
    AudioServicesPlaySystemSound(_winSoundID);
    self.winLabel.text=@"WINNER!";
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1];
}
// 定时器执行的方法
- (void)paint:(NSTimer *)paramTimer{
    [self run];
}

// 开始定时器
- (void) startPainting{
    // 定义一个NSTimer
    self.paintingTimer = [NSTimer scheduledTimerWithTimeInterval:0.5                   target:self selector:@selector(paint:)  userInfo:nil repeats:YES];
}

// 停止定时器
- (void) stopPainting{
    if (self.paintingTimer != nil){
        // 定时器调用invalidate后，就会自动执行release方法。不需要在显示的调用release方法
        [self.paintingTimer invalidate];
    }
    
    UIImage *lastValue;
    for(UIImage *dic in self.numInRow){
        
        if(lastValue == dic){
            self.num++;
        }else if(self.num >=3){
            
        }else{
            self.num = 1;
        }
        lastValue = dic;
    }
    if(self.num >=3){
        [self performSelector:@selector(playWinSound) withObject:nil afterDelay:.5];
    }else{
        [self performSelector:@selector(showButton) withObject:nil afterDelay:1];
    }
    self.spinButton.enabled = YES;
}

#pragma mark Picker Delegate Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 5;
}
// rows of picker
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.images count];
}

-(UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

-(CGFloat)pickerView:(UIPickerView*)pickerView rowHeightForComponent:(NSInteger)component{
    return 64;
}

@end
