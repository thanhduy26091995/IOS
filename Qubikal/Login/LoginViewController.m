//
//  LoginViewController.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "InstagramViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - app delegate
- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    if([self appDelegate].accesstoken.length != 0) {
        MainViewController *mainController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        [self.navigationController pushViewController:mainController animated:YES];
    }
    [super viewWillAppear:animated];
}

#pragma mark - action login
- (IBAction)click_login:(id)sender {
    InstagramViewController *instagramController = [[InstagramViewController alloc] initWithNibName:@"InstagramViewController" bundle:nil];
    [self.navigationController presentViewController:instagramController animated:YES completion:nil];
}

@end
