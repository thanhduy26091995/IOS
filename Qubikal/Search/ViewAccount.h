//
//  ViewAccount.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewAccoundelegate;

@interface ViewAccount : UIView <UITableViewDelegate, UITableViewDataSource>{
    
    __weak IBOutlet UITableView *tbl_account;
}

@property (nonatomic, strong) id<ViewAccoundelegate> delegate;
@property (nonatomic, strong) NSMutableArray *user;
- (id)initWithFrame:(CGRect)frame delegate:(id<ViewAccoundelegate>)delegate;
- (void)searchAccount;
@end

@protocol ViewAccoundelegate <NSObject>
@optional
@end
