//
//  ViewCategories.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewCategoriesdelegate;
@interface ViewCategories : UIView <UITableViewDataSource, UITableViewDelegate> {
    
}

@property(nonatomic, strong) id<ViewCategoriesdelegate> delegate;
- (id)initWithFrame:(CGRect)frame delegate:(id<ViewCategoriesdelegate>)delegate;
@property (weak, nonatomic) IBOutlet UITableView *tbl_categories;
@property (nonatomic, strong) NSMutableArray *listSearchImage;
@property (assign, nonatomic) int listimage;
- (void) searchCategories;

@end
@protocol ViewCategoriesdelegate <NSObject>
@optional
@end
