//
//  ViewMainSearch.m
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import "ViewMainSearch.h"
#import "ViewAccount.h"
#import "ViewCategories.h"

@implementation ViewMainSearch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame delegate:(id<ViewSearchdelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (IBAction)click_account:(id)sender {
    _checkform = 1;
    [view_categories setHidden:YES];
    [view_account setHidden:NO];
}

- (IBAction)click_categories:(id)sender {
    _checkform = 2;
    [view_categories setHidden:NO];
    [view_account setHidden:YES];
}

- (void)setUpUI {
    self.search_main.delegate = self;
    _checkform = 1;
    view_account = [[ViewAccount alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, view.frame.size.height ) delegate:self];
    [view_account setHidden:NO];
    [view addSubview:view_account];
    
    view_categories = [[ViewCategories alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, view.frame.size.height ) delegate:self];
    [view_categories setHidden:YES];
    [view addSubview:view_categories];
    
}

#pragma mark - implement search delegate 
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.search_main resignFirstResponder];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    [self.search_main resignFirstResponder];
    [self.search_main setShowsCancelButton:NO animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.search_main resignFirstResponder];
    [self.search_main setShowsCancelButton:NO animated:YES];
    if (_checkform == 1) {
        [view_account searchAccount];
    } else {
        [view_categories searchCategories];
    }
    
}

// called when text starts editing
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // Show cancel button
    [self.search_main setShowsCancelButton:YES animated:YES];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}
@end
