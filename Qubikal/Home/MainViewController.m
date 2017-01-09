//
//  MainViewController.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "MainViewController.h"
#import "ViewMainSearch.h"
#import "MainHome.h"
#import "KGModal.h"
#import "NewCategoryViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGSize check = [[UIScreen mainScreen] bounds].size;
    mainSearch = [[[NSBundle mainBundle] loadNibNamed:@"ViewMainSearch" owner:self options:nil] objectAtIndex:0];
    mainSearch.frame = CGRectMake(0, 0, _view_content.frame.size.width, check.height - 202);
    [mainSearch setHidden:NO];
    mainSearch.delegate = self;
    [mainSearch setUpUI];
    [self.view_content addSubview:mainSearch];
    
    
    mainHome = [[MainHome alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, check.height - 141 ) delegate:self];
    [mainHome setHidden:YES];
    mainHome.delegate = self;
    [self.view_content addSubview:mainHome];
    [_btn_add setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - action button search and home
- (IBAction)click_search:(id)sender {
    [mainSearch setHidden:NO];
    [mainHome setHidden:YES];
    [_btn_add setHidden:YES];
}

- (IBAction)click_home:(id)sender {
    [mainSearch setHidden:YES];
    [mainHome setHidden:NO];
    [_btn_add setHidden:NO];
}

- (IBAction)click_addcategory:(id)sender {
    _delegate = [[MainViewController alloc] init];
    NewCategoryViewController *filterController = [[NewCategoryViewController alloc] initWithNibName:@"NewCategoryViewController" bundle:nil];
    [[KGModal sharedInstance] showWithContentViewController:filterController];
}

#pragma mark - add subcategories
- (void) addSubcategories {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thong Bao" message:@"Test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}
@end
