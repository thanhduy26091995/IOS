//
//  CategoriesTableViewCell.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "CategoriesTableViewCell.h"

@implementation CategoriesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    self.btn_item1.layer.cornerRadius = self.btn_item1.frame.size.width / 25;
    self.btn_item1.clipsToBounds = YES;
    self.btn_item1.layer.borderWidth = 1.0f;
    self.btn_item1.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.btn_item2.layer.cornerRadius = self.btn_item2.frame.size.width / 25;
    self.btn_item2.clipsToBounds = YES;
    self.btn_item2.layer.borderWidth = 1.0f;
    self.btn_item2.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.btn_item3.layer.cornerRadius = self.btn_item3.frame.size.width / 25;
    self.btn_item3.clipsToBounds = YES;
    self.btn_item3.layer.borderWidth = 1.0f;
    self.btn_item3.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
