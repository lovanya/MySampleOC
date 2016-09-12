//
//  FavoritesList.h
//  Fonts
//
//  Created by Bruce on 16/8/13.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+(instancetype)sharedFavoritesList;
-(NSArray *)favorites;
-(void)addFavorite:(id)item;
-(void)removeFavorite:(id)item;

@end
