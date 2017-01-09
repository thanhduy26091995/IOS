//
//  ImageDetailViewController.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Set border for item
    self.img_bkg.layer.cornerRadius = self.img_bkg.frame.size.width / 50;
    self.img_bkg.clipsToBounds = YES;
    
    self.img_title.layer.cornerRadius = self.img_title.frame.size.width / 50;
    self.img_title.clipsToBounds = YES;
    self.img_title.layer.borderWidth = 1.0f;
    self.img_title.layer.borderColor = [UIColor grayColor].CGColor;
    
    [self.img_content setImage:_img_data];
    self.img_content.layer.cornerRadius = self.img_content.frame.size.width / 50;
    self.img_content.clipsToBounds = YES;
    
    self.txt_desc.layer.cornerRadius = self.txt_desc.frame.size.width / 50;
    self.txt_desc.text = _img_caption;
    self.txt_desc.clipsToBounds = YES;
    self.txt_desc.layer.borderWidth = 1.0f;
    self.txt_desc.layer.borderColor = [UIColor grayColor].CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
