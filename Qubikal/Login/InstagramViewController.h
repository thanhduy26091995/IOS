//
//  InstagramViewController.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/24/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *wb_login;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aiv_loading;
@property (strong,nonatomic)NSString *typeOfAuthentication;
@end
