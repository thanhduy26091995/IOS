//
//  SubCategoriesViewController.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubcategoriesDelegate;
@interface SubCategoriesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
- (IBAction)click_back:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tbl_subcategories;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (assign, nonatomic) int listsubcategories;
@property(nonatomic, strong) id<SubcategoriesDelegate> delegate;
- (void) createCategories;
@end

@protocol SubcategoriesDelegate <NSObject>
@optional
@end
