//
//  InstaContent.h
//  Qubikal
//
//  Created by Dung Nguyen on 11/24/16.
//  Copyright © 2016 Dung Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InstaContent : NSObject

@property (strong, nonatomic) NSString *caption_img;
@property (strong, nonatomic) NSString *url_img;
@property (strong, nonatomic) UIImage  *content_img;
@property (strong, nonatomic) NSString *title_img;

@end
