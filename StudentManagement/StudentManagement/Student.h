//
//  Student.h
//  StudentManagement
//
//  Created by Bruce on 16/4/17.
//  Copyright © 2016年 Apress. All rights reserved.
//

#ifndef Student_h
#define Student_h

typedef NSMutableArray new;

#endif /* Student_h */

#import <Foundation/Foundation.h>
#import "Course.h"

@interface Student : NSObject
{
@private
    NSString *_name;
    int _age;
    NSString *_sex;
    Course *_chinese;
    Course *_math;
    NSDate *_dateCreate;    //录入时间
    NSString *_outstr;
}

//init

-(Student*) initWithName:(NSString*) name andAge: (int) age andSex:(NSString*) sex andChinese:(Course*) chinese andMath:(Course*) math;
//getter
-(NSString*) _name;

-(int) _age;

-(Course*) _chinese;

-(Course*) _math;

-(NSDate*) _dateCreate;

-(NSString*) _outstr;
//setter
-(void) setName:(NSString*) name;

-(void) setAge:(int) age;

-(void) setChinese:(Course*) chinese;

-(void) setMath:(Course*) math ;

-(void) setName: (NSString*) name andAge: (int) age andSex:(NSString*) sex andChinese:(Course*) chinese andMath:(Course*) math;
-(void) setOutStr:(NSString*) name andAge: (int) age andSex:(NSString*) sex andChinese:(Course*) chinese andMath:(Course*) math;
//method

-(void) showData;

@end