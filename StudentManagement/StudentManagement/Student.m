//
//  Student.m
//  StudentManagement
//
//  Created by Bruce on 16/4/17.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@implementation Student

//init

-(Student*) initWithName:(NSString*) name andAge: (int) age andSex:(NSString*) sex andChinese:(Course*) chinese andMath:(Course*) math;{
    self =[super init];
    
    if(self){
        [self setName:name andAge:age andSex:sex andChinese:chinese andMath:math];
        [self setOutStr:name andAge:age andSex:sex andChinese:chinese andMath:math];
    }
    
    return self;

}
//getter
-(NSString*) _name{
    return _name;
}

-(int) _age{
    return _age;
}

-(Course*) _chinese{
    return _chinese;
}

-(Course*) _math{
    return _math;
}

-(NSDate*) _dateCreate{  //onlyread
    return  _dateCreate;
}

-(NSString*) _outstr{
    return _outstr;
}
//setter
-(void) setName:(NSString*) name{
    _name = name;
}

-(void) setAge:(int) age{
    _age = age;
}

-(void) setChinese:(Course*) chinese {
    _chinese = chinese;
}

-(void) setMath:(Course*) math {
    _math = math;
}

-(void) setName: (NSString*) name andAge: (int) age andSex:(NSString*) sex andChinese:(Course*) chinese andMath:(Course*) math{
    
    _name = name ;
    _age = age;
    _sex = sex;
    _chinese = chinese;
    _math = math;

}

-(void) setOutStr:(NSString*) name andAge: (int) age andSex:(NSString*) sex andChinese:(Course*) chinese andMath:(Course*) math{
    _outstr = [NSString stringWithFormat:@"姓名:%@ 性别:%@ 年龄:%d 数学:%3.1f 语文:%3.1f",name,sex,age,[chinese _score],[math _score]];
}
//method

-(void) showData
{
    NSLog(@"姓名：%@", _name);
    NSLog(@"性别：%@", _sex);
    NSLog(@"年龄：%d", _age);
    //NSLog(@"入学时间：%@", _dateCreate);
    [_chinese showData];
    [_math showData];
    NSLog(@"考试总分：%.1f", _chinese._score + _math._score);
    NSLog(@"-------------\n");
}

@end