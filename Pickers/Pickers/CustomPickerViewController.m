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
@property (strong,nonatomic) NSArray *images;

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
    BOOL win = NO;
    int loopNum = 0;
    NSString *dd = [[NSString alloc] init];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:dd selector:@selector(run:) userInfo:nil repeats:YES];
    
//    if([dd retainCount] == 6){
//        [timer invalidate];
//    }
    if([self run] >= 3){
        win = YES;
    }
    
    if(win){
        self.winLabel.text = @"WINNER!";
    }else{
        self.winLabel.text = @" ";//注意引号之间的空格
    }
}

-(int) run {
    int numInRow = 1;
    int lastVal = -1;
    
    for(int i = 0; i < 5 ; i ++){
        int newValue = arc4random_uniform((uint)[self.images count]);
        
        if(newValue == lastVal){
            numInRow++;
        }else{
            numInRow = 1;
        }
        
        lastVal = newValue;
        
        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.picker reloadComponent:i];
        
    }
    return numInRow;
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
