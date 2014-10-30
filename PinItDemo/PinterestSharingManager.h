//
//  PinterestSharingManager.h
//  PinItDemo
//
//  Created by Gurpreet Singh on 30/10/14.
//  Copyright (c) 2014 Pinterest. All rights reserved.
//


/**---------------------------------------------------------------------------------------
 * @name HOW TO USE
 *  ---------------------------------------------------------------------------------------
 
 ***
 Add pinterest.embeddedframework and PinterestSharingManager.h/.m files to your project.
 
 ***
 #import "PinterestSharingManager.h" in your app delegate and the .h file where you want to use this.
 
 **
 Crate your client id on http://developers.pinterest.com and update PI_clientID above.
 
 **
 PI_urlSchemeSuffix is optional for you but you are free to change this. Remember it is used in urlScheme.
 
 **
 Add urlScheme in the plist like this pin1441048prod (pin+PI_clientID+PI_urlSchemeSuffix). here 1441048 is your client id and prob is urlSchemeSuffix.
 
 **
 add this in your AppDelegate inside the AppDelegate:handleOpenURl method [PI_SHARING_MANAGER handleOpenURL:url];.
 Note it is necessory to add if you want to get notified after completion if sharing.
 
 **
 Use [PI_SHARING_MANAGER pinItButton] to get default buttin of pinIt. But you can also use your own.
 
 **
 Use following method to share image url in your project whereever you want.
 
 [PI_SHARING_MANAGER pinItWithImageURL:[NSURL URLWithString:kImageurl] sourceURL:[NSURL URLWithString:@"http://placekitten.com"] description:@"Pinning from Pin It Demo"];
 
 **
 Don't forget to add following delegate method to get notified after completing sharing
 
 -(void)Pinterest:(PinterestSharingManager*)manager sharingFinished:(BOOL)isSuccess;
 
 */



#import <Foundation/Foundation.h>

/**Please set this id of your application*/
#define PI_clientID         @"1441048"

/**This is optional But you are free to change this*/
#define PI_urlSchemeSuffix  @"prod"

/** Macro to quickly access defaultmanager.*/
#define PI_SHARING_MANAGER [PinterestSharingManager defaultManager]

@protocol PinterestSharingManagerDelegate ;

@interface PinterestSharingManager : NSObject

/** default(Shared) instance of PinterestSharingManager.*/
+(instancetype)defaultManager;

/** to get default pinIt Button
 @return UIButton instance with default pinIt image.
 */
- (UIButton*)pinItButton;

/** Creates a pin with specified image URL.
 
 @warning An undefined imageURL will raise a NSInvalidArgumentException.
 
 @param imageURL URL of the image to pin.
 @param sourceURL The source page of the image.
 @param descriptionText The pin's description.
 */
- (void)pinItWithImageURL:(NSURL*)ImageUrl sourceURL:(NSURL*)sourceURL description:(NSString*)descriptionText;

/** Use this method in Appdelegate.m in AppDelegate:handleOpenURL to handle pin sharing completion..
 
 @param url return URL after sharing.
 */
- (void)handleOpenURL:(NSURL *)url;

/**Delegate to get informed when sharing has been completed.*/
@property (nonatomic, retain) id<PinterestSharingManagerDelegate> delegate;

@end

/*Delegate methods implemention.*/
@protocol PinterestSharingManagerDelegate <NSObject>

-(void)Pinterest:(PinterestSharingManager*)manager sharingFinished:(BOOL)isSuccess;

@end

