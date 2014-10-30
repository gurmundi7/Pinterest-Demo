//
//  PDViewController.m
//  PinItDemo
//
//  Created by Gurpreet Singh on 30/10/14.
//  Copyright (c) 2014 Pinterest. All rights reserved.
//


/*	Party Cardy!
 Key:
 31c157111df3aa93cb6ea94a396d16c5
 
 Secret:
 cbbee7da6a2dacd1
 
 Edit app details - Edit auth flow for this app - View all Apps by You
 */
#import "PDViewController.h"

#define kMargin             20.0
#define kSampleImageWidth   320.0
#define kSampleImageHeight  200.0

#define kPinItButtonWidth   72.0
#define kPinItButtonHeight  32.0
#define kImageurl @"http://placekitten.com/g/200/300"

@interface PDViewController ()

@end

@implementation PDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    // Setup Title Label
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    CGFloat centerX = CGRectGetMidX(self.view.frame);
    [titleLabel setText:@"Pinterest Pin It Demo"];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel sizeToFit];
    [titleLabel setFrame:CGRectMake(centerX - CGRectGetWidth(titleLabel.frame)/2,
                                    kMargin,
                                    CGRectGetWidth(titleLabel.frame),
                                    CGRectGetHeight(titleLabel.frame))];
    [self.view addSubview:titleLabel];

    // Setup a sample imageview for the image we want to pin
    NSURL* aURL = [NSURL URLWithString:kImageurl];
    NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
    UIImage* sampleImage = [UIImage imageWithData:data];
    UIImageView* sampleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [sampleImageView setImage:sampleImage];
    [sampleImageView setFrame:CGRectMake(centerX - kSampleImageWidth/2,
                                         CGRectGetMaxY(titleLabel.frame) + kMargin,
                                         kSampleImageWidth,
                                         kSampleImageHeight)];
    [self.view addSubview:sampleImageView];

    // Setup PinIt Button
    UIButton* pinItButton = [PI_SHARING_MANAGER pinItButton];
    [pinItButton setFrame:CGRectMake(centerX - kPinItButtonWidth/2,
                                     CGRectGetMaxY(sampleImageView.frame) + kMargin,
                                     kPinItButtonWidth,
                                     kPinItButtonHeight)];
    [pinItButton addTarget:self
                    action:@selector(pinIt:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pinItButton];
    
    [PI_SHARING_MANAGER setDelegate:self];
}

#pragma mark -
#pragma mark PinIt Method

- (void)pinIt:(id)sender
{
    [PI_SHARING_MANAGER pinItWithImageURL:[NSURL URLWithString:kImageurl]
                            sourceURL:[NSURL URLWithString:@"http://placekitten.com"]
                          description:@"Pinning from Pin It Demo"];
}

#pragma mark - PinIt Delegate
-(void)Pinterest:(PinterestSharingManager *)manager sharingFinished:(BOOL)isSuccess
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:(isSuccess)?@"Pinned image successfully.":@"Unable to pin image." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alertView show];
}
@end
