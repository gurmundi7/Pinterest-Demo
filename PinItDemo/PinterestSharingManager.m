//
//  PinterestSharingManager.m
//  PinItDemo
//
//  Created by Gurpreet Singh on 30/10/14.
//  Copyright (c) 2014 Pinterest. All rights reserved.
//

#import "PinterestSharingManager.h"
#import <Pinterest/Pinterest.h>

#define PI_pinSuccess @"//?pin_success=1"
#define PI_pinFailed  @"//?pin_success=0"
#define PI_urlScheme  [NSString stringWithFormat:@"pin%@%@",PI_clientID,PI_urlSchemeSuffix]
#define isContains(_STR_, _SUB_) [_STR_ rangeOfString:_SUB_].length

@interface PinterestSharingManager ()

@property (nonatomic, retain) Pinterest* pinterest;

@end

@implementation PinterestSharingManager

PinterestSharingManager* manager = nil;

+(id)defaultManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PinterestSharingManager alloc] init];
    });
    return manager;
}

-(Pinterest *)pinterest{
    if (!_pinterest) {
        NSAssert(PI_clientID.length, @"PI_clientID cannot be blank.");
        _pinterest = [[Pinterest alloc] initWithClientId:PI_clientID urlSchemeSuffix:PI_urlSchemeSuffix];
    }
    return _pinterest;
}

-(void)pinItWithImageURL:(NSURL*)ImageUrl sourceURL:(NSURL*)sourceURL description:(NSString*)descriptionText{
    NSAssert(ImageUrl, @"ImageUrl cannot be nil.");
    [self.pinterest createPinWithImageURL:ImageUrl sourceURL:sourceURL description:descriptionText];
}

-(void)handleOpenURL:(NSURL *)url{
    if (!url) return;
    
    NSString* urlStr = [url absoluteString];
    
    if (!urlStr.length) return;
    
    if (!isContains(urlStr, PI_urlScheme) || !self.delegate || ![self.delegate respondsToSelector:@selector(Pinterest:sharingFinished:)]) {
        return;
    }
    
    [self.delegate Pinterest:self sharingFinished:isContains(urlStr, PI_pinSuccess)];
}

-(UIButton*)pinItButton{
   return [Pinterest pinItButton];
}

@end
