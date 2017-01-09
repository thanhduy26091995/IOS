//
//  ViewAccount.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "ViewAccount.h"
#import "AccountTableViewCell.h"

@implementation ViewAccount

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame delegate:(id<ViewAccoundelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *loadView = [[[NSBundle mainBundle] loadNibNamed:@"ViewAccount" owner:self options:nil] objectAtIndex:0];
        loadView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height + 67);
        [self addSubview:loadView];
        self.user = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - implement table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.user count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *accountCellIdentifier = @"AccountTableViewCellIdentifier";
    
    AccountTableViewCell *accountCell = (AccountTableViewCell *)[tableView dequeueReusableCellWithIdentifier: accountCellIdentifier];
    
    if (accountCell == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"AccountTableViewCell" owner:self options:nil];
        accountCell = [nibs objectAtIndex:0];
    }
    switch (indexPath.row) {
        case 0:
            [accountCell.lbl_user setText:@"User 1"];
            break;
        case 1:
            [accountCell.lbl_user setText:@"User 2"];
            break;
        case 2:
            [accountCell.lbl_user setText:@"User 3"];
            break;
        case 3:
            [accountCell.lbl_user setText:@"User 4"];
            break;
        case 4:
            [accountCell.lbl_user setText:@"User 5"];
            break;
        case 5:
            [accountCell.lbl_user setText:@"User 6"];
            break;
        case 6:
            [accountCell.lbl_user setText:@"User 7"];
            break;
        case 7:
            [accountCell.lbl_user setText:@"User 8"];
            break;
        case 8:
            [accountCell.lbl_user setText:@"User 9"];
            break;
        case 9:
            [accountCell.lbl_user setText:@"User 10"];
            break;
        case 10:
            [accountCell.lbl_user setText:@"User 11"];
            break;
        default:
            break;
    }
    return accountCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - search account 
- (void)searchAccount {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thong bao" message:@"ok" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}


@end
