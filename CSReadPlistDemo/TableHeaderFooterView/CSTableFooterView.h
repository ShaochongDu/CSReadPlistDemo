//
//  BaseTableFooterView.h
//  TXiOSClient
//
//  Created by dsc on 15/5/7.
//  Copyright (c) 2015年 liguohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSTableFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIView *sectionTitleView;  //  承载标题的view
@property (nonatomic, strong) UILabel *titleLabel;   //  标题

@end
