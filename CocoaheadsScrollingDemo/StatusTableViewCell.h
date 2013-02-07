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
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

- (void)configureWithStatusDictionary:(NSDictionary *)status;

#pragma mark - Performance--

- (void)applyCornerRadiusToImageView;
- (void)applyShadowToImageView;
- (void)applyColorWithPatternImageToBackground;
- (void)doSomeCPUIntensiveThings;

#pragma mark - Performance++

- (void)applyShadowPathToShadow;
- (void)applyBackgroundColorToLabels;

@end
