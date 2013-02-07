//
//  ViewController.m
//  Copyright (c) 2013 Itty Bitty Apps. All rights reserved.
//

#import "ViewController.h"
#import "StatusTableViewCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *feedArray;
@end

static NSString *kStatusTableViewCellIdentifier = @"kStatusTableViewCellIdentifier";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *feedPath = [[NSBundle mainBundle] pathForResource:@"feed" ofType:@"plist"];
    self.feedArray = [NSArray arrayWithContentsOfFile:feedPath];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"StatusTableViewCell" bundle:nil] forCellReuseIdentifier:kStatusTableViewCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.feedArray.count;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kStatusTableViewCellIdentifier];
    [cell configureWithStatusDictionary:[self.feedArray objectAtIndex:indexPath.row]];
    
    [cell applyShadowToImageView];
    [cell applyCornerRadiusToImageView];
    [cell applyColorWithPatternImageToBackground];
    [cell doSomeCPUIntensiveThings];
    
//    [cell applyShadowPathToShadow];
//    [cell applyBackgroundColorToLabels];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

@end
