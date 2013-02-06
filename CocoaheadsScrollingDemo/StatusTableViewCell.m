//
//  StatusTableViewCell.m
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import "StatusTableViewCell.h"
#import "UIImageView+WebCache.h"

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

@end
