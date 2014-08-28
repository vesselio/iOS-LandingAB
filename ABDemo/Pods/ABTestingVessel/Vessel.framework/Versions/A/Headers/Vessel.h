//
//  Vessel.h
//  Vessel Framework Version 1.2
//
//  Copyright (c) 2014 Vessel. All rights reserved.
//

#import <Vessel/VesselAB.h>

/** The Vessel class is used to initialize the Vessel SDK for AB Testing. 
 */

@interface Vessel : NSObject

/** Returns the App Secret used to initialize Vessel SDK.
 */
@property (nonatomic, readonly) NSString *appSecret;


/** Returns a singleton that is an instance of Vessel SDK.
 @return Singleton instance of class Vessel.
*/
+ (Vessel*) sharedInstance;


/** Initializes Vessel SDK. This method should be called before calling any other Vessel SDK method.
 
 @param appSecret An app secret used to initialize the app.
*/
- (void) initializeWithAppSecret:(NSString*)appSecret;


/** The timeout interval, in seconds. If during a connection attempt the request remains idle for longer
 than the timeout interval, the request is considered to have timed out. 
 The default timeout interval is 10 seconds.
*/
- (void) setTimeoutInterval:(NSInteger)seconds;


/** The method allows you to set custom filter key and values. It will show A/B test to users who will given
 set of filters.
 
 @param filters - Valid NSDictionary containly filter and its values.

*/
- (void) setFilters:(NSDictionary *) filters;

@end
