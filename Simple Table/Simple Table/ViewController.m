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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return [self.dwarves count];
    }else{
        return [self.dwarves count];
    }
    
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
    
    if(indexPath.row < 7){
        cell.detailTextLabel.text = @"Mr.Disney";
    } else {
        cell.detailTextLabel.text = @"Mr.Tolkien";
    }
    return cell;
}



@end
