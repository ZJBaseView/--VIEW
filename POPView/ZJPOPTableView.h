//
//  ZJPOPTableView.h
//  POPView
//
//  Created by 郭剑聪 on 14-3-27.
//  Copyright (c) 2014年 ZHAO. All rights reserved.
//

#import "ZJBaseView.h"

@interface ZJPOPTableView : ZJBaseView<UITableViewDataSource,UITableViewDelegate>
{


    UITableView * tv;
}
@property(strong,nonatomic)NSArray * tableviewArray;
@property (nonatomic, strong) NSMutableArray *loaderStates;

+(id)defaultCenter:(CGRect)frame;
-(void)addpopviewTarget:(id)target action:(SEL)action tableArray:(NSArray *)array;
@end
