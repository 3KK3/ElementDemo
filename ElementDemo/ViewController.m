//
//  ViewController.m
//  ElementDemo
//
//  Created by User_YZY on 16/5/10.
//  Copyright © 2016年 User_YZY. All rights reserved.
//

#import "ViewController.h"
#import "Utility.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray * textArray = @[@"23421",@"2342342342fasdf3",@"234234fads",@"2 wer",@"sadfsadfsadf",@"fsdf",@"asdfasdf",@"fasdfas",@"sdafsadf",@"sadfsdf",@"asdf",@"asdfa",@"sdfasdas sad f",@"asdf",@"sadfsadf",@"sadfsadfsadf",@"sadf",@"sadfsa",@"sadfsafd",];

    NSArray * infoArray = [Utility autoArrangeDataArrayWithElemDataArray: textArray
                                                          elemHeight: 10
                                                         elemLeading: 10
                                                        elemTrailing: 10
                                                   elemHorizInterval: 5
                                               elemtVerticalInterval: 8
                                                      limitElemWidth: 120
                                                     limitTotalWidth: 200
                                                    limitTotalHeight: 300
                                                              frontX: 10
                                                             latterX: 10
                                                                topY: 12
                                                             bottomY: 13
                                                     elementTextFont: [UIFont systemFontOfSize: 11]
                                                   isVerticalArrange: YES];
    
    UIView * bgView = [[UIView alloc] initWithFrame: CGRectMake( 100, 10, 200, 300)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview: bgView];
    
    for (NSDictionary * infoDic in infoArray) {
        
        UILabel * label = [[UILabel alloc] initWithFrame: [infoDic[@"rectValue"] CGRectValue]];
        label.text = infoDic[@"text"];
        [bgView addSubview: label];
        label.font = [UIFont systemFontOfSize: 11];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor yellowColor];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
