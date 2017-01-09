//
//  SubCategoryTableViewCell.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCategoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_sub2;
@property (weak, nonatomic) IBOutlet UILabel *lbl_2;

@property (weak, nonatomic) IBOutlet UIButton *btn_sub1;
@property (weak, nonatomic) IBOutlet UILabel *lbl_1;

@property (weak, nonatomic) IBOutlet UIImageView *img_sub1;
@property (weak, nonatomic) IBOutlet UIImageView *img_sub2;
@end
