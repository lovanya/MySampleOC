//
//  ViewController.h
//  StudentManagement
//
//  Created by Bruce on 16/4/17.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

//这里需要实现一个协议，就是我们说的接口，原因后续再研究
//delegate是为了数据更新时刷新视图
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

//存储学生的集合
@property (nonatomic, strong) NSMutableArray *students;

//属性简单创建的语法糖，后续需要详细了解其用法
@property (nonatomic, strong) IBOutlet UITextField *stuName;

@property (nonatomic, strong) IBOutlet UITextField *stuSex;

@property (nonatomic, strong) IBOutlet UITextField *stuAge;

@property (nonatomic, strong) IBOutlet UITextField *stuChinese;

@property (nonatomic, strong) IBOutlet UITextField *stuMath;

@property (nonatomic, strong) IBOutlet UITableView *stuList;

//点击按钮后的事件回调
-(IBAction)onAdd:(UIButton *)btn;

//点击按钮后的事件回调
-(IBAction)onRead:(UIButton *)btn;
@end

