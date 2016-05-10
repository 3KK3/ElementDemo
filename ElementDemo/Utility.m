//
//  Utility.m
//  ElementDemo
//
//  Created by User_YZY on 16/5/10.
//  Copyright © 2016年 User_YZY. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSArray *) autoArrangeDataArrayWithElemDataArray:(NSArray *) dataArray elemHeight:(CGFloat)height elemLeading:(CGFloat)leading elemTrailing:(CGFloat)trailing elemHorizInterval:(CGFloat)hInterval elemtVerticalInterval:(CGFloat)vInterval limitElemWidth:(CGFloat)limitW limitTotalWidth:(CGFloat)totalW limitTotalHeight:(CGFloat)totalH frontX:(CGFloat)frontX latterX:(CGFloat)latterX topY:(CGFloat)topY bottomY:(CGFloat)bottomY elementTextFont:(UIFont *)font isVerticalArrange:(BOOL)isVerticalArrange
{
    NSMutableArray * rectArray = [NSMutableArray array];
    NSMutableDictionary * lineElementRectDic = [NSMutableDictionary dictionary];
    
    NSInteger line = 0; //列
    NSInteger row = 0; //行
    
    CGFloat currentElementX = frontX;
    CGFloat currentElementY = topY;
    CGFloat currentElementWidth = 0;
    
    for (NSString * text in dataArray)
    {
        
        if (text.length > 0)
        {
            currentElementWidth = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX,height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil].size.width;
            
            currentElementWidth += leading + trailing;
        }
        else
        {
            currentElementWidth = leading + trailing;
        }
        
        if (limitW > 0 && currentElementWidth > limitW)
        {
            currentElementWidth = limitW;
        }
        
        
        if (isVerticalArrange)//纵向排列
        {
            
            if (currentElementY + height + bottomY > totalH)//换列条件
            {
                line ++;
                
                currentElementY = topY;
                
                row = 0;
            }
            
            if (line == 0)
            {
                currentElementX = frontX;
            }
            else
            {
                currentElementX = ([[lineElementRectDic objectForKey: [NSString  stringWithFormat:@"%ld", (long)row]] CGRectValue].size.width + hInterval + [[lineElementRectDic objectForKey: [NSString  stringWithFormat:@"%ld", (long)row]] CGRectValue].origin.x);
            }
            
            if (currentElementX + currentElementWidth + latterX <= totalW) //检测
            {
                
                CGRect viewRect = CGRectMake( currentElementX , currentElementY , currentElementWidth, height);
                
                NSDictionary * tempDic = [NSDictionary dictionaryWithObjects:@[text,[NSValue valueWithCGRect: viewRect]] forKeys:@[@"text",@"rectValue"]];
                
                [rectArray addObject: tempDic];
                
                [lineElementRectDic setObject:[NSValue valueWithCGRect:viewRect] forKey:[NSString  stringWithFormat:@"%ld", (long)row]];
                
                currentElementY += height + vInterval;
                
                row ++;
                
            }
            else //超出限制高度  退出循环  返回限制范围内的rect
            {
                break ;
            }
            
        }
        else//横向排列
        {
            
            if ( currentElementX + currentElementWidth +  latterX > totalW)//换行条件
            {
                row ++;
                
                line = 0;
                
                currentElementX = frontX;
                
                currentElementY += height + vInterval;
            }
            
            if ( currentElementY + height + bottomY <= totalH) // 检测
            {
                
                CGRect viewRect = CGRectMake( currentElementX , currentElementY , currentElementWidth, height);
                
                NSDictionary * tempDic = [NSDictionary dictionaryWithObjects:@[text,[NSValue valueWithCGRect: viewRect]] forKeys:@[@"text",@"rectValue"]];
                
                [rectArray addObject: tempDic];
                
                currentElementX += currentElementWidth + hInterval;
                
                line ++;
            }
            
            else //超出限制高度  退出循环  返回限制范围内的rect
            {
                break;
            }
        }
        
    }
    
    return rectArray;
}



@end
