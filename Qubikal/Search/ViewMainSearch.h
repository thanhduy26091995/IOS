//
//  ViewMainSearch.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewAccount.h"
#import "ViewCategories.h"

@protocol ViewSearchdelegate;
@interface ViewMainSearch : UIView <ViewCategoriesdelegate,ViewAccoundelegate,UISearchBarDelegate>
{
    ViewCategories *view_categories;
    ViewAccount    *view_account;
    __weak IBOutlet UIView *view;
}

@property (nonatomic, strong) id<ViewSearchdelegate> delegate;
@property (weak, nonatomic) IBOutlet UISearchBar *search_main;
@property (assign, nonatomic) int checkform;
- (id)initWithFrame:(CGRect)frame delegate:(id<ViewSearchdelegate>)delegate;

- (IBAction)click_account:(id)sender;
- (IBAction)click_categories:(id)sender;
- (void)setUpUI;
@end
@protocol ViewSearchdelegate <NSObject>
@optional
@end
