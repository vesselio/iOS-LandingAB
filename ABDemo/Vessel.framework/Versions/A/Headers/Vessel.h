//
//  Vessel.h
//  Vessel
//
//  Copyright (c) 2013 Vessel. All rights reserved.
//

#import <Vessel/VesselAB.h>

/** The Vessel class is used to initialize the Vessel SDK for AB Testing. 
 */

@interface Vessel : NSObject

/** Returns the App Secret used to initialize Vessel SDK.
 */
@property (nonatomic, readonly) NSString *appSecret;

/** The timeout interval, in seconds. If during a connection attempt the request remains idle for longer
 than the timeout interval, the request is considered to have timed out.
 The default timeout interval is 10 seconds.
 */
@property (nonatomic) NSInteger timeoutInterval;


/** Returns a singleton that is an instance of Vessel SDK.
 @return Singleton instance of class Vessel.
*/
+ (Vessel*) sharedInstance;


/** Initializes Vessel SDK. This method should be called before calling any other Vessel SDK method.
 
 @param appSecret An app secret used to initialize the app.
 
 @return Returns a BOOL value that indicates whether the initialization was successful.
*/
+ (BOOL) initializeWithAppSecret:(NSString*)appSecret;


/** The timeout interval, in seconds. If during a connection attempt the request remains idle for longer
 than the timeout interval, the request is considered to have timed out. 
 The default timeout interval is 10 seconds.
*/
+ (void) setTimeoutInterval:(NSInteger)seconds;

@end
