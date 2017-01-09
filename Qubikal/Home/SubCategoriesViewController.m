//
//  SubCategoriesViewController.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "SubCategoriesViewController.h"
#import "SubCategoryTableViewCell.h"
#import "ListImageViewController.h"
#import "AppDelegate.h"

@interface SubCategoriesViewController ()

@end

@implementation SubCategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listsubcategories = 1;
    self.lbl_title.text = @"None Category";
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)click_back:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - load uitable view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_listsubcategories != 0){
        return (_listsubcategories/2 + _listsubcategories%2);
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *accountCellIdentifier = @"SubCategoryTableViewCellIdentifier";
    
    SubCategoryTableViewCell *accountCell = (SubCategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier: accountCellIdentifier];
    
    if (accountCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"SubCategoryTableViewCell" owner:self options:nil];
        accountCell = [nibs objectAtIndex:0];
    }
    accountCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ((indexPath.row + 1)*2 < self.listsubcategories ) {
        
        [accountCell.btn_sub1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_sub1 setTag:(indexPath.row*2)];
        [accountCell.lbl_1 setHidden:NO];
        [accountCell.btn_sub1 setHidden:NO];
        [accountCell.img_sub1 setHidden:NO];
        
        [accountCell.btn_sub2 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_sub2 setTag:(indexPath.row*2 +1)];
        [accountCell.lbl_2 setHidden:NO];
        [accountCell.btn_sub2 setHidden:NO];
        [accountCell.img_sub2 setHidden:NO];
        
    }
    else {
        [accountCell.btn_sub1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_sub1 setTag:(indexPath.row*2)];
        [accountCell.lbl_1 setHidden:NO];
        [accountCell.btn_sub1 setHidden:NO];
        [accountCell.lbl_1 setText:@"None SubCategory"];
        
        [accountCell.lbl_2 setHidden:YES];
        [accountCell.btn_sub2 setHidden:YES];
        [accountCell.img_sub2 setHidden:YES];
        
    }
    return accountCell;

}

- (void)singleTapping:(UIButton*) sender {
    NSLog(@"button %ld",(long)[sender tag]);
    ListImageViewController *listImage = [[ListImageViewController alloc] initWithNibName:@"ListImageViewController" bundle:nil];
    [self.navigationController pushViewController:listImage animated:YES];
}


- (void) createCategories {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thong Bao" message:@"Test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}
@end
