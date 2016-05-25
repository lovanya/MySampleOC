//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Bruce on 16/5/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "CustomPickerViewController.h"

@interface CustomPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *spinButton;
@property (strong,nonatomic) NSMutableArray *images;

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
- (IBAction)spin:(id)sender {
    self.spinButton.enabled = NO;
    self.num = 1;
    self.numInRow = [[NSMutableArray alloc] initWithObjects:self.images[0],self.images[0],self.images[0],self.images[0],self.images[0],nil];
    [self startPainting];//开始定时器
    [self performSelector:@selector(stopPainting) withObject:nil afterDelay:2.3];
    
}

-(void) run {
    
    for(int i = 0; i < 5 ; i ++){
        int newValue = arc4random_uniform((uint)[self.images count]);

        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.numInRow replaceObjectAtIndex:i withObject:self.images[newValue]];
        [self.picker reloadComponent:i];
        
    }
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
        self.winLabel.text = @"WINNER!";
    }else{
        self.winLabel.text = [[NSString alloc] initWithFormat:@"%d",self.num];
    }
    self.spinButton.enabled = YES;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 5;
}
// rows of picker
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.images count];
}
#pragma mark Picker Delegate Methods
-(UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

-(CGFloat)pickerView:(UIPickerView*)pickerView rowHeightForComponent:(NSInteger)component{
    return 64;
}

@end
