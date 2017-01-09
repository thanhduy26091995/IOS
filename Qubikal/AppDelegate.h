//
//  AppDelegate.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/17/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define INSTAGRAM_AUTHURL                               @"https://api.instagram.com/oauth/authorize/"
#define INSTAGRAM_APIURl                                @"https://api.instagram.com/v1/users/"
#define INSTAGRAM_CLIENT_ID                             @"21dcc596b3da473ab107c1cfb4eaaaee"
#define INSTAGRAM_CLIENTSERCRET                         @"919f17eb14dd43029e6007fdc56e0826"
#define INSTAGRAM_REDIRECT_URI                          @"http://qubikal.com/"
#define INSTAGRAM_ACCESS_TOKEN                          @"access_token"
#define INSTAGRAM_SCOPE                                 @"likes+comments+relationships"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *mainNavViewController;
@property (strong, nonatomic) NSString *accesstoken;
+ (void)pushViewController:(UIViewController *)vc;
@end

