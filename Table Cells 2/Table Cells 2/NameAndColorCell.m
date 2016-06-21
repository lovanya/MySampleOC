//
//  NameAndColorCell.m
//  Table Cells 2
//
//  Created by Bruce on 16/6/14.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell()
@property (strong,nonatomic) IBOutlet UILabel *nameLabel;
@property (strong,nonatomic) IBOutlet UILabel *colorLabel;
@end
@implementation NameAndColorCell

-(void)setName:(NSString *) n{
    if(![n isEqualToString:_name]){
        _name = [n copy];
        self.nameLabel.text = _name;
    }
}


-(void)setColor:(NSString *)c{
    if(![c isEqualToString:_color]){
        _color = [c copy];
        self.colorLabel.text = _color;
    }
}


@end
