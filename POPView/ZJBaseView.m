//
//  ZJBaseView.m
//  POPView
//
//  Created by 郭剑聪 on 14-3-27.
//  Copyright (c) 2014年 ZHAO. All rights reserved.
//

#import "ZJBaseView.h"
#import <QuartzCore/QuartzCore.h>
@implementation ZJBaseView
@synthesize contentView,roundedRect,closeButton,contentContainer,onclosedown,BASEtableviewArray;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        roundedRect=nil;
        contentView=nil;
        contentContainer=nil;
        closeButton=nil;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
		self.autoresizesSubviews = YES;
        	[self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]]; // Fixed value, the bacground mask.

        contentContainer=[[UIView alloc]initWithFrame:self.bounds];
        contentContainer.autoresizesSubviews=YES;
        contentContainer.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:contentContainer];
        
        [self.contentView setBackgroundColor:[UIColor clearColor]];

        
        
        // Initialization code
    }
    return self;
}
-(UIView *)roundedRect
{
    if(!roundedRect)
    {
    
        
        roundedRect=[[UIView alloc]initWithFrame:CGRectZero];
        roundedRect.layer.masksToBounds=YES;
        roundedRect.backgroundColor=[UIColor blackColor];
        roundedRect.layer.borderColor=[[UIColor whiteColor] CGColor];
        roundedRect.layer.borderWidth=1.5;
        roundedRect.layer.cornerRadius=4.0;
        [self.contentContainer insertSubview:roundedRect atIndex:0];

        
    }

    return roundedRect;
}
- (void)showFromPoint{
	[self show];
}
- (void)show {
	
	
	self.alpha = 0.0;
	self.contentContainer.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
	void (^animationBlock)(BOOL) = ^(BOOL finished) {
		// Wait one second and then fade in the view
		[UIView animateWithDuration:0.1
						 animations:^{
							 self.contentContainer.transform = CGAffineTransformMakeScale(0.95, 0.95);
						 }
						 completion:^(BOOL finished){
							 
							 // Wait one second and then fade in the view
							 [UIView animateWithDuration:0.1
											  animations:^{
												  self.contentContainer.transform = CGAffineTransformMakeScale(1.02, 1.02);
											  }
											  completion:^(BOOL finished){
												  
												  // Wait one second and then fade in the view
												  [UIView animateWithDuration:0.1
																   animations:^{
																	   self.contentContainer.transform = CGAffineTransformIdentity;
																   }
																   completion:^(BOOL finished){
																
																	
																   }];
											  }];
						 }];
	};
	
	// Show the view right away
    [UIView animateWithDuration:0.3
						  delay:0.0
						options:1
					 animations:^{
						 self.alpha = 1.0;
						 self.contentContainer.center = self.center;
						 self.contentContainer.transform = CGAffineTransformMakeScale((YES ? 1.05 : 1.0), (YES ? 1.05 : 1.0));
					 }
					 completion:(YES ? animationBlock : ^(BOOL finished) {
       
    })];
	
    
}
-(UIButton *)closeButton
{

    if(!closeButton )
    {
    
        closeButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        closeButton.frame=CGRectMake(0, 0, 44, 44);
        closeButton.layer.shadowColor=[[UIColor blackColor] CGColor];
        closeButton.layer.shadowOffset=CGSizeMake(0, 4);
        closeButton.layer.shadowOpacity=0.3;
        
        [closeButton addTarget:self action:@selector(closePressed:) forControlEvents:UIControlEventTouchUpInside];
        [contentContainer insertSubview:closeButton aboveSubview:self.roundedRect];
        
    }

    return closeButton;
}
- (void)hide {
	// Hide the view right away

	
    [UIView animateWithDuration:0.3
					 animations:^{
						 self.alpha = 0;

						 self.contentContainer.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
					 }
					 completion:^(BOOL finished){
						 
						 [self removeFromSuperview];
					 }];
}
- (void)closePressed:(id)sender {


    [self hide];
    
}


-(UIView *)contentView
{

    if(!contentView)
    {
    
        contentView=[[UIView alloc]initWithFrame:CGRectZero];
        contentView.autoresizingMask= UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        contentView.autoresizesSubviews=YES;
        [contentContainer addSubview:contentView];
       

        
    }
    return contentView;

}

- (CGRect)roundedRectFrame {
    
    
    NSInteger  popcount = 12-BASEtableviewArray.count;
    NSInteger  popsizeY = 40*(popcount/2);
    NSInteger  popheight= popcount * 44;
    if(popsizeY <40)
    {
    
        popsizeY=40;
    }
    if(popheight < (2*44))
    {
    
        popheight =2*44;
    }
    
	return CGRectMake(20 + self.frame.origin.x,
					  popsizeY + self.frame.origin.y,
					  self.frame.size.width - 2*20,
					  self.frame.size.height - popheight);
}

- (CGRect)closeButtonFrame {
	CGRect f = [self roundedRectFrame];
	return CGRectMake(f.origin.x - floor(closeButton.frame.size.width*0.5),
					  f.origin.y - floor(closeButton.frame.size.height*0.5),
					  closeButton.frame.size.width,
					  closeButton.frame.size.height);
}

- (CGRect)contentViewFrame {
	CGRect rect = CGRectInset([self roundedRectFrame], 20, 20);
	return rect;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.roundedRect.frame = [self roundedRectFrame];
	self.closeButton.frame = [self closeButtonFrame];
	self.contentView.frame = [self contentViewFrame];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
