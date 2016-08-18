//
//  BaseTableFooterView.m
//  TXiOSClient
//
//  Created by dsc on 15/5/7.
//  Copyright (c) 2015年 liguohui. All rights reserved.
//

#import "CSTableFooterView.h"
@implementation CSTableFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _sectionTitleView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_sectionTitleView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize sectionSize = [_titleLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(self.contentView.width - 10 *2, 200) lineBreakMode:NSLineBreakByWordWrapping];
    _sectionTitleView.frame = self.contentView.frame;
    
    _titleLabel.left = 10;
    _titleLabel.width = self.contentView.width - 10*2;
    _titleLabel.height = sectionSize.height;
    _titleLabel.centerY = self.contentView.centerY;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
