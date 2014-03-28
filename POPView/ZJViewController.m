//
//  ZJViewController.m
//  POPView
//
//  Created by 郭剑聪 on 14-3-27.
//  Copyright (c) 2014年 ZHAO. All rights reserved.
//

#import "ZJViewController.h"
#import "ZJPOPTableView.h"
#import "ZJBaseView.h"
@interface ZJViewController ()

@end

@implementation ZJViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor=[UIColor redColor];
    button.tag=23;
    [button setTitle:@"城市" forState:UIControlStateNormal];

    button.frame=CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(touchdwon) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton * genderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    genderButton.backgroundColor=[UIColor redColor];
    [genderButton setTitle:@"性别" forState:UIControlStateNormal];
    genderButton.tag=23;
    genderButton.frame=CGRectMake(100, 300, 100, 100);
    [genderButton addTarget:self action:@selector(touchdwontow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:genderButton];
	// Do any additional setup after loading the view.
}
-(void)touchdwontow
{
    NSArray * tableviewArray=@[@"男",@"女",@"人妖"];
    [self addpopViewValue:tableviewArray];

}
-(void)touchdwon
{
    
    NSArray * tableviewArray=@[@"河南",@"河北",@"秦皇岛",@"天津",@"上海",@"西安",@"河北",@"秦皇岛",@"天津",@"上海",@"西安",@"河北",@"秦皇岛",@"天津",@"上海",@"西安",@"河北",@"秦皇岛",@"天津",@"上海",@"西安",@"河北",@"秦皇岛",@"天津",@"上海",@"西安",@"河北",@"秦皇岛",@"天津",@"上海",@"西安"];
    [self addpopViewValue:tableviewArray];
   
    
}
-(void)addpopViewValue:(NSArray *)array
{
    ZJPOPTableView * ppoe =[ZJPOPTableView defaultCenter:self.view.bounds];
    [ppoe addpopviewTarget:self action:@selector(addpopData:) tableArray:array];
    [self.view addSubview:ppoe];
    [ppoe showFromPoint];
}
- (void)addpopData:(id)obj
{
    NSLog(@"%@",obj);
 
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
