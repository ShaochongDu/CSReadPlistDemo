//
//  BaseTableHeaderFooterView.m
//  TXiOSClient
//
//  Created by dsc on 15/5/7.
//  Copyright (c) 2015年 liguohui. All rights reserved.
//

#import "CSTableHeaderView.h"

@implementation CSTableHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _sectionTitleView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_sectionTitleView];

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
        
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize sectionSize = [_titleLabel.text sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(self.contentView.width - 10 *2, 200) lineBreakMode:NSLineBreakByWordWrapping];
    
    _sectionTitleView.frame = self.contentView.frame;
    
    _titleLabel.left = 10;
    _titleLabel.width = self.contentView.width - 10*2;
    _titleLabel.height = sectionSize.height;
    _titleLabel.centerY = self.contentView.centerY;
}



@end
