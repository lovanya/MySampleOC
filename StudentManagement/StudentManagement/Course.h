//
//  Course.h
//  StudentManagement
//
//  Created by Bruce on 16/4/17.
//  Copyright © 2016年 Apress. All rights reserved.
//

#ifndef Course_h
#define Course_h


#endif /* Course_h */
#import <Foundation/Foundation.h>

@interface Course : NSObject
{
    NSString *_name;
    float _score;
}

//init
-(Course*) initWithName: (NSString*) name andScore: (float) score;

//getter
-(NSString*) _name;

-(float) _score;

//setter

-(void) setName: (NSString*) name;

-(void) setScore:(float) score;

-(void) setName:(NSString*) name andScore: (float) score;

//method
-(void) showData;
@end