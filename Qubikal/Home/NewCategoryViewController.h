//
//  NewCategoryViewController.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/21/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface NewCategoryViewController : UIViewController <MainControllerDelegate> {
    MainViewController *mainController;
}
@property (weak, nonatomic) IBOutlet UIImageView *img_bkg;

- (IBAction)btn_create:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txt_caption;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;

@end

