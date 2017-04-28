//
//  ViewController.m
//  Asun-SD异步加载网络图片
//
//  Created by Asun on 2017/4/28.
//  Copyright © 2017年 asun. All rights reserved.
//

#import "ViewController.h"
#import "AsunModel.h"
#import "AsunCell.h"
#import "YYModel.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (strong,nonatomic)NSArray* dataArray;
@end
static NSString* id_cell=@"appCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self  setupThread];

    
    self.tableView.rowHeight=120;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AsunCell" bundle:nil] forCellReuseIdentifier:id_cell];

}


- (void)setupThread
{

#pragma mark - 获取网络管理者
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    
    NSString* urlStr=@"https://raw.githubusercontent.com/CholeA/Asun/master/apps.json";
    
    [manager GET:urlStr parameters:self progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.dataArray=[NSArray yy_modelArrayWithClass:[AsunModel class]json:responseObject];
  
        
        //刷新数据
        [self.tableView reloadData];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"报错了=%@",error);
    }];



}


#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{



    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AsunCell* cell=[self.tableView dequeueReusableCellWithIdentifier:id_cell forIndexPath:indexPath];
    
    
    AsunModel* model=self.dataArray[indexPath.row];
    cell.model=model;
    
    
    return cell;




}

@end
