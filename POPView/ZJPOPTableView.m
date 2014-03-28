//
//  ZJPOPTableView.m
//  POPView
//
//  Created by 郭剑聪 on 14-3-27.
//  Copyright (c) 2014年 ZHAO. All rights reserved.
//

#import "ZJPOPTableView.h"
static ZJPOPTableView * poptavleview=nil;
@implementation ZJPOPTableView
@synthesize tableviewArray;
@synthesize loaderStates;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.loaderStates = [NSMutableArray arrayWithCapacity:10];

       tv = [[UITableView alloc] initWithFrame:CGRectZero];
        tv.dataSource=self;
        tv .delegate=self;
      
		[self.contentView addSubview:tv];

    }
    return self;
}
-(void)addpopviewTarget:(id)target action:(SEL)action tableArray:(NSArray *)array{

    poptavleview.tableviewArray=array;
    @synchronized(self)
    {
        if (target == nil || action == nil) {
            return;
        }
        
        NSDictionary *actionDict = [NSDictionary dictionaryWithObjectsAndKeys:target, @"target",
                                    [NSValue valueWithPointer:action], @"action",  nil];
        NSLog(@"%@",actionDict);
        [self.loaderStates addObject:actionDict];
    }
    [tv reloadData];

  
}
-(void)pushDataSuperView:(NSString *)str

{
    
    for (NSDictionary *actionDict in self.loaderStates) {
    id target = [actionDict objectForKey:@"target"];
    SEL action = (SEL)[[actionDict objectForKey:@"action"] pointerValue];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [target performSelector:action withObject:str];
#pragma clang diagnostic pop
}
    
}

+(id)defaultCenter:(CGRect)frame
{
    
    @synchronized(self)
    {
    
    if(poptavleview ==nil){
    poptavleview = [[ZJPOPTableView alloc]initWithFrame:frame];


        return poptavleview;}
    return poptavleview;
    
    }
    
}
- (void)layoutSubviews {
    self.BASEtableviewArray=tableviewArray;
	[super layoutSubviews];

	[tv setFrame:self.contentView.bounds];
}
#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return tableviewArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSString *cellIdentifier = @"UAModalPanelCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	[cell.textLabel setText:[tableviewArray objectAtIndex:indexPath.row]];
	
	return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"当前选择-------%@",[tableviewArray objectAtIndex:indexPath.row]);
    
    [self pushDataSuperView:[tableviewArray objectAtIndex:indexPath.row]];
    [self hide];
    

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
