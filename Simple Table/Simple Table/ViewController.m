//
//  ViewController.m
//  Simple Table
//
//  Created by Bruce on 16/6/6.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(copy,nonatomic) NSArray *dwarves;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dwarves = @[@"Sleepy",@"Sneezy",@"Bashful",@"Happy",@"Doc",@"Grumpy",@"Dopey",@"Thorin",@"Dorin",@"Nori",@"Ori",@"Balin",@"Dwalin",@"Fili",@"Kili",@"Oin",@"Gloin",@"Bifur",@"Bombur"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//阻止第一行被选中（选中行高亮前调用）
-(NSIndexPath *) tableView: (UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return nil;
    }else{
        return indexPath;
    }
}
//设置行缩进
-(NSInteger)tableView:(UITableView*)tableView indentationLevelForRowAtIndexPath:(NSIndexPath*)indexPath{
    return indexPath.row % 4;
}

//每个区间的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dwarves count];
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return indexPath.row == 0 ? 100:70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleTableIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    
    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;
    UIImage *highlightedImage =[UIImage imageNamed:@"star2"];
    cell.imageView.highlightedImage = highlightedImage;
    
//    cell.backgroundColor = [UIColor blackColor];
//    
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
    if(indexPath.row < 7){
        cell.detailTextLabel.text = @"Mr.Disney";
    } else {
        cell.detailTextLabel.text = @"Mr.Tolkien";
    }
    return cell;
}

//行的选中事件(选中之后调用)
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@",rowValue];
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Row Selected!" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction  *cancelAction = [UIAlertAction actionWithTitle:@"Yes I Did" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:cancelAction];
    [self presentViewController: controller animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
