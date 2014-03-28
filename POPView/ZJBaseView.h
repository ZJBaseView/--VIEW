//
//  ZJBaseView.h
//  POPView
//
//  Created by 郭剑聪 on 14-3-27.
//  Copyright (c) 2014年 ZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJBaseView;
 typedef void (^chlose)(ZJBaseView * base);
@interface ZJBaseView : UIView
@property(strong,nonatomic)UIView * contentView;
@property(strong,nonatomic)UIButton * closeButton;
@property (strong,nonatomic)UIView *roundedRect;
@property (strong,nonatomic)UIView * contentContainer;
@property(copy,nonatomic)chlose  onclosedown;
- (void)showFromPoint;
-(void)hide;
@property(strong,nonatomic)NSArray * BASEtableviewArray;

@end
