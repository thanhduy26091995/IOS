//
//  MainHome.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainHomedelegate;
@interface MainHome : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbl_categories;
@property (nonatomic, strong) id<MainHomedelegate> delegate;
- (id)initWithFrame:(CGRect)frame delegate:(id<MainHomedelegate>)delegate;
@property (assign, nonatomic) int listcategories;

@end

@protocol MainHomedelegate <NSObject>
@optional
@end
