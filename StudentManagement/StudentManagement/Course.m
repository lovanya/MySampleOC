//
//  Course.m
//  StudentManagement
//
//  Created by Bruce on 16/4/17.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@implementation Course

//init
-(Course*) initWithName: (NSString*) name andScore: (float) score{
    self = [super init];
    
    if(self){
        [self setName:name andScore:score];
    }
    return self;
}
//getter
-(NSString*) _name{
    return _name;
}

-(float) _score{
    return _score;
}

//setter

-(void) setName: (NSString*) name{
    _name = name;
}

-(void) setScore:(float) score{
    _score = score;
}

-(void) setName:(NSString*) name andScore: (float) score{
    _name = name ;
    _score = score;
}

//mehtod
-(void) showData
{
    NSLog(@"课程名：%@", _name);
    NSLog(@"课程得分：%.1f",_score);
}

@end