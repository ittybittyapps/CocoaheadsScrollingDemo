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
    
    if ([status objectForKey:@"created_at"]) {
        self.dateLabel.text = [status objectForKey:@"created_at"];
    }
}

#pragma mark - Performance--

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

- (void)applyColorWithPatternImageToBackground
{
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper_fibers"]];
}

- (void)doSomeCPUIntensiveThings
{
    for (int i = 0; i < 50; i++) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter numberFromString:@"This string contains the number 100"];
    }
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSinceNow:1];
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:2];
    [date1 compare:date2];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", date1];
}

#pragma mark - Performance++

- (void)applyShadowPathToShadow
{
    self.shadowView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.shadowView.bounds].CGPath;
}

- (void)applyBackgroundColorToLabels
{
    self.usernameLabel.backgroundColor = self.backgroundColor;
    self.statusLabel.backgroundColor = self.backgroundColor;
    self.dateLabel.backgroundColor = self.backgroundColor;
}


@end
