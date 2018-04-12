//
//  ViewController.m
//  NSDictionary-implementation
//
//  Created by Yuan on 2018/4/12.
//  Copyright © 2018年 Yuan. All rights reserved.
//

#import "ViewController.h"
#import "MYDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

#define MaxArrayLength          1014

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    MYDictionary * tempDict = [MYDictionary dictionary];
    [tempDict setObject:@"xiaoming" forKey:@"ace"];
    [tempDict setObject:@23 forKey:@"bbe"];
    [tempDict setObject:@"no234" forKey:@"ace"];
    [tempDict setObject:@"dfdfd" forKey:@"这里是可以啊"];
    [tempDict setObject:@"93943.908" forKey:@"9089"];
    [tempDict setObject:@"小红花" forKey:@"平"];
    NSLog(@"%@",tempDict);
    
    NSLog(@"object====%@",[tempDict objectForKey:@"dfdf"]);
    
    [tempDict removeObjectForKey:@"平"];
    [tempDict removeObjectForKey:@"ace"];
    NSLog(@"%@",tempDict);
}



//测试OC数组插入数据
- (void)testCreateOCLanguageListFunc
{
    /*会发生数组越界
     NSMutableArray * array = [NSMutableArray array];
     array[3] = @10;
     NSLog(@"%@",array);
     */
}

//测试C数组插入数据
- (void)testCreateCLanguageListFunc
{
    int list[999];
    for (int i = 0; i < 998; i++) {
        NSLog(@"%d",list[i]);
    }
    
    NSArray * array[999];
    array[2] = @[@1,@2];
    NSLog(@"%@",array[2]);
    
    float floatList[MaxArrayLength];
    floatList[1012] = 1.2f;
    floatList[1013] = 0.9f;
    NSLog(@"%f",floatList[1012]);
    NSLog(@"%f",floatList[1013]);
}

@end
