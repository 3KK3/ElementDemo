//
//  Utility.h
//  ElementDemo
//
//  Created by User_YZY on 16/5/10.
//  Copyright © 2016年 User_YZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

/**
 *  根据要布局的文字内容以及布局样式  返回布局数信息数组
 *
 *  @param dataArray         要布局的内容            - 须全是字符串
 *  @param height            要布局的每个元素的高度
 *  @param leading           要布局的每个元素内       - 前padding
 *  @param trailing          要布局的每个元素内       - 后padding
 *  @param hInterval         要布局的每个元素间       - 横向间隔
 *  @param vInterval         要布局的每个元素间       - 纵向间隔
 *  @param limitWidth        布局横向范围
 *  @param limitHeight       布局纵向范围
 *  @param frontX            每行第一个元素          - 距离边框的距离
 *  @param latterX           每行最后一个元素        - 距离边框的距离
 *  @param topY              每列第一个元素          - 距离边框的距离
 *  @param bottomY           每列最后一个元素         - 距离边框的距离
 *  @param font              元素字体
 *  @param isVerticalArrange 是否纵向排列            - 纵向排列会根据limitWidth截断
 - 横向排列会根据limitHeight截断
 *
 *  @return 返回结构：数组中是一个个字典  每个字典内容:@"rectValue" :[NSValue valueWithCGRect:] ; @"text" : NSString
 */
+ (NSArray *)autoArrangeDataArrayWithElemDataArray:(NSArray *) dataArray elemHeight:(CGFloat)height elemLeading:(CGFloat)leading elemTrailing:(CGFloat)trailing elemHorizInterval:(CGFloat)hInterval elemtVerticalInterval:(CGFloat)vInterval limitElemWidth:(CGFloat)limitW limitTotalWidth:(CGFloat)totalW limitTotalHeight:(CGFloat)totalH frontX:(CGFloat)frontX latterX:(CGFloat)latterX topY:(CGFloat)topY bottomY:(CGFloat)bottomY elementTextFont:(UIFont *)font isVerticalArrange:(BOOL)isVerticalArrange;

@end
