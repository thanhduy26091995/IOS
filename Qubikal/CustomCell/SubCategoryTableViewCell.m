//
//  SubCategoryTableViewCell.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "SubCategoryTableViewCell.h"

@implementation SubCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    self.img_sub1.layer.cornerRadius = self.img_sub1.frame.size.width / 30;
    self.img_sub1.clipsToBounds = YES;
    
    self.img_sub2.layer.cornerRadius = self.img_sub2.frame.size.width / 30;
    self.img_sub2.clipsToBounds = YES;
    
    self.btn_sub2.layer.cornerRadius = self.btn_sub2.frame.size.width / 25;
    self.btn_sub2.clipsToBounds = YES;
    self.btn_sub2.layer.borderWidth = 1.0f;
    self.btn_sub2.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.btn_sub1.layer.cornerRadius = self.btn_sub1.frame.size.width / 25;
    self.btn_sub1.clipsToBounds = YES;
    self.btn_sub1.layer.borderWidth = 1.0f;
    self.btn_sub1.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
