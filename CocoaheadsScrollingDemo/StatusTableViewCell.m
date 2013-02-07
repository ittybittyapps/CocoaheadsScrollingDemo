//
//  StatusTableViewCell.m
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import "StatusTableViewCell.h"
#import "UIImageView+WebCache.h"

#import <QuartzCore/QuartzCore.h>

@implementation StatusTableViewCell

- (void)configureWithStatusDictionary:(NSDictionary *)status
{
    if ([status objectForKey:@"user"]) {
        NSDictionary *userDict = [status objectForKey:@"user"];
        
        if ([userDict objectForKey:@"username"]) {
            self.usernameLabel.text = [userDict objectForKey:@"username"];
        }
        
        if ([userDict objectForKey:@"avatar_image"]){
            NSDictionary *avatarDict = [userDict objectForKey:@"avatar_image"];
            
            if ([avatarDict objectForKey:@"url"]) {
                [self.userImageView setImageWithURL:[NSURL URLWithString:[avatarDict objectForKey:@"url"]]];
            }
            
        }
    }
    if ([status objectForKey:@"text"]) {
        self.statusLabel.text = [status objectForKey:@"text"];
    }
}

- (void)applyCornerRadiusToImageView
{
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 5.f;
}

- (void)applyShadowToImageView
{
    self.shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.shadowView.layer.shadowOffset = CGSizeMake(0.f, 5.f);
    self.shadowView.layer.shadowRadius = 5.f;
    self.shadowView.layer.shadowOpacity = 0.5f;
    self.shadowView.layer.shouldRasterize = YES;
}

- (void)applyShadowPathToShadow
{
    self.shadowView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.shadowView.bounds].CGPath;
}

@end
