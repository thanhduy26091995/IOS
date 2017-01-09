//
//  ListImageViewController.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ListImageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tbl_listimagedetail;
@property (strong, nonatomic) NSMutableArray *listcontent;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aiv_loading;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
- (IBAction)click_back:(id)sender;
@end
