//
//  ViewController.m
//  Sections
//
//  Created by Bruce on 16/6/21.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"

static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
@interface ViewController ()
@property (copy , nonatomic) NSDictionary *names;
@property (copy, nonatomic) NSArray *keys;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark Table View Data Source Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.keys count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.keys[section];
    NSArray *nameSection = self.names[key];
    return [nameSection count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.keys[section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier forIndexPath:indexPath];
    
    NSString *key = self.keys[indexPath.section];
    NSArray *nameSection = self.names[key];
    cell.textLabel.text = nameSection[indexPath.row];
    return cell;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.keys;
}
@end
