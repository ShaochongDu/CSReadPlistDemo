//
//  CSPlistTool.m
//  CSReadPlistDemo
//
//  Created by Shaochong Du on 16/5/12.
//  Copyright © 2016年 Shaochong Du. All rights reserved.
//

#import "CSPlistTool.h"
#import "CSPlistModel.h"
#import "CSPlistItemModel.h"

#define kIsUse @"isUsed"
#define kHeaderDes @"headerDes"
#define kFooterDes @"footerDes"
#define kDataArray @"itemArray"

#define kItemId @"itemId"
#define kItemTitle @"itemTitle"
#define kItemIcon @"itemIcon"


@implementation CSPlistTool

+ (NSMutableArray *)loadGroupPlistFile:(NSString *)plistName
{
    NSString *str = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:[NSString stringWithFormat:@"/%@",plistName]];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:str];
    
    NSMutableArray *outArray = [NSMutableArray array];
    for (NSDictionary *sectionDic in plistArray) {
        NSMutableArray *inArray = [NSMutableArray array];
        BOOL sectionIsUse = [sectionDic[kIsUse] boolValue];
        if (sectionIsUse) {
            CSPlistModel *plistModel = [[CSPlistModel alloc] init];
            plistModel.itemArray = [NSMutableArray array];
            
            plistModel.isUsed = sectionIsUse;
            plistModel.headerDes = sectionDic[kHeaderDes];
            plistModel.footerDes = sectionDic[kFooterDes];
            
            NSArray *dataArray = sectionDic[kDataArray];
            for (NSDictionary *itemDic in dataArray) {
                BOOL isUse = [itemDic[kIsUse] boolValue];
                if (isUse) {
                    CSPlistItemModel *itemModel = [[CSPlistItemModel alloc] init];
                    itemModel.isUsed = isUse;
                    itemModel.itemId = itemDic[kItemId];
                    itemModel.itemTitle = itemDic[kItemTitle];
                    itemModel.itemIcon = itemDic[kItemIcon];
                    [inArray addObject:itemModel];
                }
            }
            plistModel.itemArray = inArray;
            [outArray addObject:plistModel];
        }
    }
    return outArray;
}

+ (NSMutableArray *)loadItemPlistFile:(NSString *)plistName
{
    NSString *str = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:[NSString stringWithFormat:@"/%@",plistName]];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:str];
    
    NSMutableArray *outArray = [NSMutableArray array];
    for (NSDictionary *itemDic in plistArray) {
        BOOL sectionIsUse = [itemDic[kIsUse] boolValue];
        if (sectionIsUse) {
            CSPlistItemModel *itemModel = [[CSPlistItemModel alloc] init];
            itemModel.isUsed = sectionIsUse;
            itemModel.itemId = itemDic[kItemId];
            itemModel.itemTitle = itemDic[kItemTitle];
            itemModel.itemIcon = itemDic[kItemIcon];
            [outArray addObject:itemModel];
        }
    }
    return outArray;
}

@end
