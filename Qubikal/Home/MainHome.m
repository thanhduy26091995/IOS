//
//  MainHome.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "MainHome.h"
#import "AppDelegate.h"
#import "SubCategoriesViewController.h"
#import "SubCategoryTableViewCell.h"

@implementation MainHome

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame delegate:(id<MainHomedelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *loadView = [[[NSBundle mainBundle] loadNibNamed:@"MainHome" owner:self options:nil] objectAtIndex:0];
        loadView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height );
        [self addSubview:loadView];
        self.listcategories = 1;
    }
    return self;
}

#pragma mark - implement tableview categories
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_listcategories != 0){
        return (_listcategories/2 + _listcategories%2);
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *accountCellIdentifier = @"SubCategoryTableViewCellIdentifier";
    
    SubCategoryTableViewCell *accountCell = (SubCategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier: accountCellIdentifier];
    
    if (accountCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"SubCategoryTableViewCell" owner:self options:nil];
        accountCell = [nibs objectAtIndex:0];
    }
    accountCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ((indexPath.row + 1)*2 < self.listcategories ) {
        
        [accountCell.btn_sub1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_sub1 setTag:(indexPath.row*2)];
        [accountCell.lbl_1 setHidden:NO];
        [accountCell.btn_sub1 setHidden:NO];
        [accountCell.img_sub1 setHidden:NO];
        
        [accountCell.btn_sub2 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_sub2 setTag:(indexPath.row*2 +1)];
        [accountCell.lbl_2 setHidden:NO];
        [accountCell.btn_sub2 setHidden:NO];
        [accountCell.img_sub2 setHidden:NO];
        
    }
    else {
        [accountCell.btn_sub1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_sub1 setTag:(indexPath.row*2)];
        [accountCell.lbl_1 setText:@"None Category"];
        [accountCell.lbl_1 setHidden:NO];
        [accountCell.btn_sub1 setHidden:NO];
        
        [accountCell.lbl_2 setHidden:YES];
        [accountCell.btn_sub2 setHidden:YES];
        [accountCell.img_sub2 setHidden:YES];
        
    }
    return accountCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)singleTapping:(UIButton*) sender {
    NSLog(@"button %ld",(long)[sender tag]);
    SubCategoriesViewController *subController = [[SubCategoriesViewController alloc] initWithNibName:@"SubCategoriesViewController" bundle:nil];
    [AppDelegate pushViewController:subController];
}
@end
