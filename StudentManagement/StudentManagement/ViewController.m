//
//  ViewController.m
//  StudentManagement
//
//  Created by Bruce on 16/4/17.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"
#import "Student.h"

@interface ViewController ()
@end

@implementation ViewController

////重写初始化方法，控制器对象创建结束后会执行
//
//-(id) initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil{
//
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//
//    if(self) {
//        self.students= [NSMutableArray alloc];
//    }
//
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在页面准备前对数组进行初始化
    _students =   [[NSMutableArray alloc] init];
    
    //    _students = [NSMutableArray arrayWithObjects:@"武汉",@"上海",@"北京",@"深圳",@"广州",@"重庆",@"香港",@"台海",@"天津", nil];
    //
    _stuList = [[UITableView alloc] initWithFrame:CGRectMake(0, 300,[[UIScreen mainScreen] bounds].size.width-20 , 340)];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _stuList.dataSource = self;
    
    //动态添加
    [self.view addSubview:_stuList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) onAdd:(UIButton *)btn{
    //这里实例化一个Student对象试试
    //这里如果数字输入错误会导致解析出问题，可能会报错，不知道OC生产项目应该如何处理
    Student *student = [[Student alloc]
                        initWithName:_stuName.text
                        andAge:[_stuAge.text intValue]
                        andSex:_stuSex.text
                        andChinese:[[Course alloc] initWithName:@"语文" andScore:[_stuChinese.text floatValue]]
                        andMath:[[Course alloc] initWithName:@"数学" andScore:[_stuMath.text floatValue]]];
    
    //这里每次点击，皆将结果存于全局数组中
    [_students addObject:student];
    
    //每次数据更新便将对应数据显示在UITableView中
    [_stuList performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    
}

-(void) onRead:(UIButton *)btn{
    for(id item in _students){
        [item showData];
    }
}

//必须实现
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [[_students objectAtIndex:row] _outstr];
    return cell;
}

//每个section下cell的个数（必须实现）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _students.count;
}

//划动cell是否出现del按钮
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//设定横向滑动时是否出现删除按扭,（阻止第一行出现）
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return UITableViewCellEditingStyleNone;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleDelete;
}
@end
