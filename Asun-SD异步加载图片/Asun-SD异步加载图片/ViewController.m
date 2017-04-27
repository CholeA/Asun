//
//  ViewController.m
//  Asun-SD异步加载图片
//
//  Created by Asun on 2017/4/27.
//  Copyright © 2017年 asun. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "YYModel.h"
#import "AppModel.h"
#import "AppCell.h"

@interface ViewController ()

@property (strong,nonatomic)NSArray* dataArray;


@end
/// https://raw.githubusercontent.com/CholeA/Asun/master/apps.json
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

_dataArray=[NSArray new];

    
    [self  loadImage];


    
}

- (void)loadImage
{
    //网址
    NSString* strUrl=@"https://raw.githubusercontent.com/CholeA/Asun/master/apps.json";
    
    
[[AFHTTPSessionManager manager]GET:strUrl parameters:self progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    _dataArray=[NSArray yy_modelArrayWithClass:[AppModel class] json:responseObject];
    
    [self.tableView reloadData];
    
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    NSLog(@"错误=%@",error);
}];

}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    AppCell* cell=[tableView dequeueReusableCellWithIdentifier:@"AppCell" forIndexPath:indexPath];
    
    AppModel* model=self.dataArray[indexPath.row];
    
    cell.model=model;


    return  cell;
}


@end
