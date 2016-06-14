//
//  ViewController.m
//  Table Cells 2
//
//  Created by Bruce on 16/6/14.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"
static NSString *CellTableIdentifier  = @"CellTableIdentifier";

@interface ViewController ()
@property (copy, nonatomic) NSArray *computers;
@property (weak,nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.computers = @[@{@"Name" : @"MacBook Air",@"Color" : @"Silver"},
                       @{@"Name" : @"MacBook Pro",@"Color" : @"Silver"},
                       @{@"Name" : @"iMac",@"Color" : @"Silver"},
                       @{@"Name" : @"Mac min",@"Color" : @"Silver"},
                       @{@"Name" : @"Mac Pro",@"Color" : @"Black"}];
    UINib *nib = [UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CellTableIdentifier"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.computers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier forIndexPath:indexPath];
    
    NSDictionary *rowData = self.computers[indexPath.row];
    cell.name  = rowData[@"Name"];
    cell.color  = rowData[@"Color"];
    return cell;
}
@end
