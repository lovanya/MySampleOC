//
//  RootViewControllerTableViewController.m
//  Fonts
//
//  Created by Bruce on 16/9/13.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "RootViewControllerTableViewController.h"
#import "FavoritesList.h"

@interface RootViewControllerTableViewController ()

@property (copy, nonatomic) NSArray *familyNames;
@property (assign, nonatomic) CGFloat cellPointSize;
@property (strong, nonatomic) FavoritesList *favoritesList;
 
@end

@implementation RootViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
    UIFont *preferredTableViewFont = [UIFont preferredFontForTextStyle: UIFontTextStyleHeadline];
    self.cellPointSize = preferredTableViewFont.pointSize;
    self.favoritesList = [FavoritesList sharedFavoritesList];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath*)indexPath{
    if (indexPath.section == 0){
        NSString *familyName = self.familyNames[indexPath.row];
        NSString *fontName = [[UIFont fontNamesForFamilyName:familyName] firstObject];
        return [UIFont fontWithName: fontName size: self.cellPointSize];
    } else {
        return nil;
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.favoritesList.favorites count] > 0){
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.familyNames count];
    } else {
        return 1;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"All Font Families";
    } else{
        return nil;
    }
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *FamilyNameCell = @"FamilyName";
    static NSString *FavoritesCell = @"Favorites";
    UITableViewCell *cell = nil;
    //配置表单元
    if(indexPath.section == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:FamilyNameCell forIndexPath:indexPath];
        cell.textLabel.font = [self fontForDisplayAtIndexPath:indexPath];
        cell.textLabel.text = self.familyNames[indexPath.row];
        cell.detailTextLabel.text = self.familyNames[indexPath.row];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:FavoritesCell forIndexPath:indexPath];
    }
    
    return cell;
}

@end
