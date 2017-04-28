//
//  AsunCell.m
//  Asun-SD异步加载网络图片
//
//  Created by Asun on 2017/4/28.
//  Copyright © 2017年 asun. All rights reserved.
//

#import "AsunCell.h"
#import  "AsunModel.h"
#import  "UIImageView+WebCache.h"
@interface AsunCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@end

@implementation AsunCell


- (void)setModel:(AsunModel *)model
{
    _model=model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
    
    self.nameLabel.text=model.name;
    
    self.downloadLabel.text=model.download;
    
    
}


@end
