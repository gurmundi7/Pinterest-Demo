Pinterest-Demo
==============

An demo app with easy way to add pins from you app.

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
