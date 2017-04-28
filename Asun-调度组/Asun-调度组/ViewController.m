//
//  ViewController.m
//  Asun-调度组
//
//  Created by Asun on 2017/4/28.
//  Copyright © 2017年 asun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  loadGroup];
    
}

- (void)loadGroup

{
    //创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    //创建对列
    
    dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
    
    //为异步任务在调度组中添加标记
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1=%@",[NSThread currentThread]);
        
        //移除队列
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        
        NSLog(@"2=%@",[NSThread currentThread]);
        dispatch_group_leave(group);
        
    });
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:0.5];
        NSLog(@"3=%@",[NSThread currentThread]);
        
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"图片下载完了");
    });
    
    
    
    
    
}
@end
