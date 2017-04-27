//
//  AppCell.m
//  Asun-SD异步加载图片
//
//  Created by Asun on 2017/4/27.
//  Copyright © 2017年 asun. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"
#import "UIImageView+WebCache.h"

@interface AppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@end

@implementation AppCell

- (void)setModel:(AppModel *)model
{



    _model=model;
    
    
    self.nameLabel.text=model.name;
    
    self.downloadLabel.text=model.download;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];

}

@end
