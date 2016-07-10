//
//  SearchResultsControllerTableViewController.m
//  Sections
//
//  Created by Bruce on 16/7/6.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "SearchResultsController.h"

static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";

@interface SearchResultsController ()

@property (strong,nonatomic) NSDictionary *names;
@property (strong,nonatomic) NSArray *keys;
@property (strong,nonatomic) NSMutableArray *filteredNames;

@end

@implementation SearchResultsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype) initWithNames:(NSDictionary*)names keys:(NSArray*)keys{
    if(self=[super initWithStyle:(UITableViewStylePlain)]){
        self.names = names;
        self.keys = keys;
        self.filteredNames = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark -UISearchResultsUpdating Conformance
static const NSUInteger longNameSize = 6;
static const NSInteger shortNamesButtonIndex = 1;
static const NSInteger longNamesButtonIndex = 2;

-(void)updateSearchResultsForSearchController:(UISearchController*)controller{
    NSString *searchString = controller.searchBar.text;
    NSInteger buttonIndex = controller.searchBar.selectedScopeButtonIndex;
    [self.filteredNames removeAllObjects];
    if(searchString.length > 0){
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL (NSString *name , NSDictionary *b) {
            //根据所选择的范围按钮可以筛选名称的长度
            NSInteger nameLength  = name.length;
            if((buttonIndex == shortNamesButtonIndex && nameLength >= longNameSize) || (buttonIndex == longNamesButtonIndex && nameLength < longNameSize)){
                return NO;
            }
               NSRange range = [name rangeOfString:searchString options:NSCaseInsensitiveSearch];
               return range.location != NSNotFound;
            
        }];
        for(NSString *key in self.keys){
            NSArray *matches = [self.names[key] filteredArrayUsingPredicate:predicate];
            [self.filteredNames addObjectsFromArray:matches];
        }
       [self.tableView reloadData];
    }
}
#pragma mark - Table view data source


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.filteredNames count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.filteredNames[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
