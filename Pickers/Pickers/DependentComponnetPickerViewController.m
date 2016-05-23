//
//  DependentComponnetPickerViewController.m
//  Pickers
//
//  Created by Bruce on 16/5/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "DependentComponnetPickerViewController.h"

#define kStateComponent 0
#define kZipComponent 1

@interface DependentComponnetPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;
@property (strong,nonatomic) NSDictionary *stateZips;
@property (strong,nonatomic) NSArray *states;
@property (strong,nonatomic) NSArray *zips;


@end

@implementation DependentComponnetPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    self.stateZips = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *allStates = [self.stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states =sortedStates;
    NSString *selectedSate = self.states[0];
    self.zips = self.stateZips[selectedSate];
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
- (IBAction)buttonPressed:(id)sender {
    NSInteger stateRow = [self.dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.dependentPicker selectedRowInComponent:kZipComponent];
    NSString *state = self.states[stateRow];
    NSString *zip = self.zips[zipRow];
    NSString *title = [[NSString alloc] initWithFormat:@"You selectd zip code %@",zip];
    NSString *message = [[NSString alloc] initWithFormat: @"%@ is in %@",zip,state];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 2;
}
// rows of picker
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == kStateComponent){
        return [self.stateZips count];
    }else{
        return [self.zips count];
    }
}
#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == kStateComponent){
        return self.states[row];
    }else{
        return self.zips[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == kStateComponent){
        NSString *selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComponent];
        [self.dependentPicker selectRow:0 inComponent:kZipComponent animated:YES];
    
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat pickerWidth = pickerView.bounds.size.width;
    if(component == kZipComponent){
        return pickerWidth / 3;
    }else{
        return 2 * pickerWidth /3;
    }
}

@end
