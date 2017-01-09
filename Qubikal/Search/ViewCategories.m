//
//  ViewCategories.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "ViewCategories.h"
#import "CategoriesTableViewCell.h"
#import "AccountTableViewCell.h"
#import "ImageDetailViewController.h"
#import "KGModal.h"

@implementation ViewCategories

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame delegate:(id<ViewCategoriesdelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *loadView = [[[NSBundle mainBundle] loadNibNamed:@"ViewCategories" owner:self options:nil] objectAtIndex:0];
        loadView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height + 67);
        [self addSubview:loadView];
        self.listSearchImage = [[NSMutableArray alloc] init];
        _listimage = 11;
    }
    return self;
}

#pragma mark - implement tableview categories
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([self.listSearchImage count] != 0){
        if ([self.listSearchImage count]%3 == 0) {
            return [self.listSearchImage count]/3;
        } else {
            return [self.listSearchImage count]/3 + 1;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *accountCellIdentifier = @"CategoriesTableViewCellIdentifier";
    
    CategoriesTableViewCell *accountCell = (CategoriesTableViewCell *)[tableView dequeueReusableCellWithIdentifier: accountCellIdentifier];
    
    if (accountCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CategoriesTableViewCell" owner:self options:nil];
        accountCell = [nibs objectAtIndex:0];
    }
    
    
    accountCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ((indexPath.row + 1)*3 <= _listimage) {
        
        
        [accountCell.btn_item1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_item1 setTag:(indexPath.row*3)];
        
       
        [accountCell.btn_item2 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_item2 setTag:(indexPath.row*3 + 1)];
        
        
        [accountCell.btn_item3 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_item3 setTag:(indexPath.row*3 + 2)];
        
        [accountCell.btn_item1 setHidden:NO];
        [accountCell.btn_item2 setHidden:NO];
        [accountCell.btn_item3 setHidden:NO];
        
    } else if ((indexPath.row + 1)*3 > _listimage)
    {
        if ((indexPath.row + 1)*3 - _listimage == 1) {
            
            [accountCell.btn_item1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
            [accountCell.btn_item1 setTag:(indexPath.row*3)];
            
    
            [accountCell.btn_item2 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
            [accountCell.btn_item2 setTag:(indexPath.row*3 + 1)];
            
            [accountCell.btn_item1 setHidden:NO];
            [accountCell.btn_item2 setHidden:NO];
            [accountCell.btn_item3 setHidden:YES];
        }
        else if ((indexPath.row + 1)*3 - _listimage == 2) {
            
            [accountCell.btn_item1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
            [accountCell.btn_item1 setTag:(indexPath.row*3)];
            
            [accountCell.btn_item1 setHidden:NO];
            [accountCell.btn_item2 setHidden:YES];
            [accountCell.btn_item3 setHidden:YES];
        }
    }
    
    return accountCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - search categories 
- (void) searchCategories {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thong Bao" message:@"search categories" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - click detail
- (void)singleTapping:(UIButton*) sender {
    NSLog(@"button %ld",(long)[sender tag]);
    ImageDetailViewController *detailController = [[ImageDetailViewController alloc] initWithNibName:@"ImageDetailViewController" bundle:nil];
    [[KGModal sharedInstance] showWithContentViewController:detailController];
}

@end
