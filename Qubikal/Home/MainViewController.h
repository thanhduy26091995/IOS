//
//  MainViewController.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewMainSearch.h"
#import "MainHome.h"
#import "SubCategoriesViewController.h"
@protocol MainControllerDelegate;
@interface MainViewController : UIViewController <ViewSearchdelegate, MainHomedelegate, SubcategoriesDelegate> {
    CGSize               contentSize;
    ViewMainSearch *mainSearch;
    MainHome       *mainHome;
    SubCategoriesViewController *subCategories;
}

@property (nonatomic, strong) id<MainControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *view_content;
@property (weak, nonatomic) IBOutlet UIButton *btn_search;
@property (weak, nonatomic) IBOutlet UIButton *btn_home;
- (IBAction)click_search:(id)sender;
- (IBAction)click_home:(id)sender;
- (IBAction)click_addcategory:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn_add;
- (void) addSubcategories;
@end

@protocol MainControllerDelegate <NSObject>
@optional
@end
