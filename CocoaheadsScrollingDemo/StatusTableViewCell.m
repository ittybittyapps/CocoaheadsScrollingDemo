//
//  StatusTableViewCell.m
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import "StatusTableViewCell.h"

@implementation StatusTableViewCell

- (void)configureWithStatusDictionary:(NSDictionary *)status
{
    if ([status objectForKey:@"user"]) {
        if ([[status objectForKey:@"user"] objectForKey:@"username"]) {
            self.usernameLabel.text = [[status objectForKey:@"user"] objectForKey:@"username"];
        }
    }
    if ([status objectForKey:@"text"]) {
        self.statusLabel.text = [status objectForKey:@"text"];
    }
}

@end
