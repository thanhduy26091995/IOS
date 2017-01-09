//
//  ListImageViewController.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/18/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "ListImageViewController.h"
#import "CategoriesTableViewCell.h"
#import "KGModal.h"
#import "ImageDetailViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "InstaContent.h"
#import "UIImageView+AFNetworking.h"

@interface ListImageViewController ()

@end

@implementation ListImageViewController

#pragma mark - implement appdelegate
- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _listcontent = [[NSMutableArray alloc] init];
    [self requesAllImageOnInstagram];
    self.lbl_title.text = @"None Category";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - implement table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([_listcontent count] != 0){
        if ([_listcontent  count]%3 == 0) {
            return [_listcontent  count]/3;
        } else {
            return [_listcontent  count]/3 + 1;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *accountCellIdentifier = @"CategoriesTableViewCellIdentifier";
    
    CategoriesTableViewCell *accountCell = (CategoriesTableViewCell *)[tableView dequeueReusableCellWithIdentifier: accountCellIdentifier];
    
    if (accountCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CategoriesTableViewCell" owner:self options:nil];
        accountCell = [nibs objectAtIndex:0];
    }
    
    InstaContent *entity = [[InstaContent alloc] init];
    
    accountCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ((indexPath.row + 1)*3 <= [_listcontent count]) {
        
        entity = [_listcontent objectAtIndex:(indexPath.row*3)];
        if (entity.content_img == nil) {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
            entity.content_img = [UIImage imageWithData:imageData];
        }
        [accountCell.btn_item1 setBackgroundImage:entity.content_img forState:UIControlStateNormal];
        [accountCell.btn_item1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_item1 setTag:(indexPath.row*3)];
        
        entity = [_listcontent objectAtIndex:(indexPath.row*3 + 1)];
        if (entity.content_img == nil) {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
            entity.content_img = [UIImage imageWithData:imageData];
        }
        [accountCell.btn_item2 setBackgroundImage:entity.content_img forState:UIControlStateNormal];
        [accountCell.btn_item2 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_item2 setTag:(indexPath.row*3 + 1)];
        
        entity = [_listcontent objectAtIndex:(indexPath.row*3 + 2)];
        if (entity.content_img == nil) {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
            entity.content_img = [UIImage imageWithData:imageData];
        }
        [accountCell.btn_item3 setBackgroundImage:entity.content_img forState:UIControlStateNormal];
        [accountCell.btn_item3 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
        [accountCell.btn_item3 setTag:(indexPath.row*3 + 2)];
        
        [accountCell.btn_item1 setHidden:NO];
        [accountCell.btn_item2 setHidden:NO];
        [accountCell.btn_item3 setHidden:NO];
        
    } else if ((indexPath.row + 1)*3 > [_listcontent count])
    {
        if ((indexPath.row + 1)*3 - [_listcontent count] == 1) {
            
            entity = [_listcontent objectAtIndex:(indexPath.row*3)];
            if (entity.content_img == nil) {
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
                entity.content_img = [UIImage imageWithData:imageData];
            }
            [accountCell.btn_item1 setBackgroundImage:entity.content_img forState:UIControlStateNormal];
            [accountCell.btn_item1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
            [accountCell.btn_item1 setTag:(indexPath.row*3)];
            
            entity = [_listcontent objectAtIndex:(indexPath.row*3 + 1)];
            if (entity.content_img == nil) {
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
                entity.content_img = [UIImage imageWithData:imageData];
            }
            [accountCell.btn_item2 setBackgroundImage:entity.content_img forState:UIControlStateNormal];
            [accountCell.btn_item2 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
            [accountCell.btn_item2 setTag:(indexPath.row*3 + 1)];
            
            [accountCell.btn_item1 setHidden:NO];
            [accountCell.btn_item2 setHidden:NO];
            [accountCell.btn_item3 setHidden:YES];
        }
        else if ((indexPath.row + 1)*3 - [_listcontent count] == 2) {
            
            entity = [_listcontent objectAtIndex:(indexPath.row*3)];
            if (entity.content_img == nil) {
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
                entity.content_img = [UIImage imageWithData:imageData];
            }
            [accountCell.btn_item1 setBackgroundImage:entity.content_img forState:UIControlStateNormal];
            [accountCell.btn_item1 addTarget:self action:@selector(singleTapping:) forControlEvents:UIControlEventTouchUpInside];
            [accountCell.btn_item1 setTag:(indexPath.row*3)];
            
            [accountCell.btn_item1 setHidden:NO];
            [accountCell.btn_item2 setHidden:YES];
            [accountCell.btn_item3 setHidden:YES];
        }
    }
    [_aiv_loading stopAnimating];
    
    return accountCell;
}


- (void)singleTapping:(UIButton*) sender {
    NSLog(@"button %ld",(long)[sender tag]);
    ImageDetailViewController *detailController = [[ImageDetailViewController alloc] initWithNibName:@"ImageDetailViewController" bundle:nil];
    InstaContent *entity = [[InstaContent alloc] init];
    entity = [_listcontent objectAtIndex:(long)[sender tag]];
    detailController.img_data = entity.content_img;
    detailController.img_caption = entity.caption_img;
    [[KGModal sharedInstance] showWithContentViewController:detailController];
}

#pragma mark - request all image on instagram 
- (void)requesAllImageOnInstagram {
    [_aiv_loading startAnimating];
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setSecurityPolicy:securityPolicy];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/media/recent?count=200&min_timestamp=0&max_timestamp=1407278400,1407278460,1407278520&access_token=%@",[self appDelegate].accesstoken] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString);
        [self parseJsonContent:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

#pragma mark - parse json
- (void)parseJsonContent:(NSData *)jsonString {
    NSDictionary *route = [NSJSONSerialization JSONObjectWithData:jsonString options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *arrayString = [route objectForKey:@"data"];

    for (int i = 0; i < [arrayString count]; i++) {
        InstaContent *entity = [[InstaContent alloc] init];
        NSDictionary *content = [arrayString objectAtIndex:i];
        NSDictionary *caption = [content objectForKey:@"caption"];
        if (caption != (NSDictionary*) [NSNull null]) {
            entity.caption_img = [caption objectForKey:@"text"];
        }
        NSDictionary *image = [content objectForKey:@"images"];
        NSDictionary *lowresolution = [image objectForKey:@"low_resolution"];
        entity.url_img = [lowresolution objectForKey:@"url"];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:entity.url_img]];
        entity.content_img = [UIImage imageWithData:imageData];
        [_listcontent addObject:entity];
    }
    [_tbl_listimagedetail reloadData];
}
#pragma mark - action back
- (IBAction)click_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
