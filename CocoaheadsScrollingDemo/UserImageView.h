//
//  UserImageView.h
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserImageView : UIView

- (void)setURL:(NSURL *)url;

@property (nonatomic, assign) BOOL shouldDrawImage;

@end
