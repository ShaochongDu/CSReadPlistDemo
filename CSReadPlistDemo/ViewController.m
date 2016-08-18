//
//  ViewController.m
//  CSReadPlistDemo
//
//  Created by Shaochong Du on 16/5/12.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "ViewController.h"
#import "CSPlistTool.h"
#import "CSPlistModel.h"
#import "CSPlistItemModel.h"

#import "CSTableHeaderView.h"
#import "CSTableFooterView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSourceArray = [CSPlistTool loadGroupPlistFile:@"GroupItem.plist"];
    NSLog(@"%@",self.dataSourceArray);
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CSPlistModel *model = self.dataSourceArray[section];
    return model.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    CSPlistModel *model = self.dataSourceArray[indexPath.section];
    CSPlistItemModel *itemModel = model.itemArray[indexPath.row];
    cell.textLabel.text = itemModel.itemTitle;
    cell.imageView.image = [UIImage imageNamed:itemModel.itemIcon];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CSPlistModel *model = self.dataSourceArray[section];
    NSString *footerSectionStr = model.headerDes;
    if (footerSectionStr.length > 0) {
        CGSize sectionSize = [footerSectionStr sizeWithFont:[UIFont systemFontOfSize:14.0] constrainedToSize:CGSizeMake(self.view.width - 10 *2, 200) lineBreakMode:NSLineBreakByWordWrapping];
        return sectionSize.height + 5*2;
    }
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerFooterViewIdentify = @"CSTableHeaderView";
    CSTableHeaderView *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewIdentify];
    if (!headerFooterView) {
        headerFooterView = [[CSTableHeaderView alloc] initWithReuseIdentifier:headerFooterViewIdentify];
    }
    headerFooterView.sectionTitleView.backgroundColor = [UIColor randomColor];
    CSPlistModel *model = self.dataSourceArray[section];
    headerFooterView.titleLabel.text = model.headerDes;
    return headerFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CSPlistModel *model = self.dataSourceArray[section];
    NSString *footerSectionStr = model.footerDes;
    if (footerSectionStr.length > 0) {
        CGSize sectionSize = [footerSectionStr sizeWithFont:[UIFont systemFontOfSize:14.0] constrainedToSize:CGSizeMake(self.view.width - 10 *2, 200) lineBreakMode:NSLineBreakByWordWrapping];
        return sectionSize.height + 5*2;
    }
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    static NSString *headerFooterViewIdentify = @"CSTableFooterView";
    CSTableFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterViewIdentify];
    if (!footerView) {
        footerView = [[CSTableFooterView alloc] initWithReuseIdentifier:headerFooterViewIdentify];
    }
    footerView.sectionTitleView.backgroundColor = [UIColor randomColor];
    CSPlistModel *model = self.dataSourceArray[section];
    footerView.titleLabel.text = model.footerDes;
    return footerView;
}




@end
