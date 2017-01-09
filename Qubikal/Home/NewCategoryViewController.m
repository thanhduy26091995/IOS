//
//  NewCategoryViewController.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/21/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "NewCategoryViewController.h"
#import "KGModal.h"

@interface NewCategoryViewController ()

@end

@implementation NewCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.img_bkg.layer.cornerRadius = self.img_bkg.frame.size.width / 50;
    self.img_bkg.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_create:(id)sender {
    [[KGModal sharedInstance] hide];
    mainController.delegate = self;
    [mainController addSubcategories];
}


@end
