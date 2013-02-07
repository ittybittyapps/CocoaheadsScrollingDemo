//
//  UserImageView.m
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import "UserImageView.h"
#import "UIImageView+WebCache.h"

@interface UserImageView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *userImage;
@end

@implementation UserImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return self;
}

- (void)setURL:(NSURL *)url
{
    __weak UserImageView *weakSelf = self;
    [self.imageView setImageWithURL:url
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                              
                              weakSelf.userImage = image;
                              if (weakSelf.shouldDrawImage) {
                                  [weakSelf setNeedsDisplay];
                              } else {
                                  [weakSelf addSubview:weakSelf.imageView];
                              }
                              
                          }];
}

- (void)drawRect:(CGRect)rect
{
    if (self.shouldDrawImage && self.userImage) {
        [self.userImage drawInRect:self.bounds];
    }
}

@end
