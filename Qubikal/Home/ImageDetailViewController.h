//
//  ImageDetailViewController.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UIViewController
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int width;

@property (weak, nonatomic) IBOutlet UIImageView *img_bkg;
@property (weak, nonatomic) IBOutlet UIImageView *img_title;
@property (weak, nonatomic) IBOutlet UIImageView *img_content;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UITextView *txt_desc;
@property (strong, nonatomic) UIImage *img_data;
@property (weak, nonatomic) NSString *img_caption;
@end
