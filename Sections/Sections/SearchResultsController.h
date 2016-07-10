//
//  SearchResultsControllerTableViewController.h
//  Sections
//
//  Created by Bruce on 16/7/6.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsController : UITableViewController <UISearchResultsUpdating>

-(instancetype)initWithNames:(NSDictionary*)names keys:(NSArray *)keys;
@end
