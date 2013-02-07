//
//  StatusTableViewCell.h
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet UIView *shadowView;

- (void)configureWithStatusDictionary:(NSDictionary *)status;

// Performance killers
- (void)applyCornerRadiusToImageView;
- (void)applyShadowToImageView;

// Performance revivers
- (void)applyShadowPathToShadow;

@end
