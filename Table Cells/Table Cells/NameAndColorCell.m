//
//  NameAndColorCell.m
//  Table Cells
//
//  Created by Bruce on 16/6/13.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell ()
    
@property(strong,nonatomic) UILabel *nameLabel;
@property(strong,nonatomic) UILabel *colorLabel;

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

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGRect nameLabelRect = CGRectMake(0,5,70,15);
        UILabel *nameMaker = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameMaker.textAlignment = NSTextAlignmentRight;
        nameMaker.text = @"Name:";
        nameMaker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameMaker];
        
        CGRect colorLabelRect = CGRectMake(0,26,70,15);
        UILabel *colorMaker = [[UILabel alloc] initWithFrame:colorLabelRect];
        colorMaker.textAlignment = NSTextAlignmentRight;
        colorMaker.text = @"Color:";
        colorMaker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:colorMaker];
        
        CGRect nameValueRect = CGRectMake(80,5,200,15);
        self.nameLabel = [[UILabel alloc] initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameLabel];
        
        CGRect colorValueRect = CGRectMake(80,25,200,15);
        self.colorLabel = [[UILabel alloc] initWithFrame:colorValueRect];
        [self.contentView addSubview:_colorLabel];
        
    }
    return self;
}

@end
