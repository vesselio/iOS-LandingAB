//
//  VesselAB.h
//  Vessel Framework Version 1.2
// 
//  Copyright (c) 2014 Vessel. All rights reserved.
//


/** The variation returned by the Vessel server is one of the values from VesselABTestVariation enumeration.
 */
typedef NS_ENUM(NSInteger, VesselABTestVariation) {
    /** Unknown variation */
    VesselABTestVariationUnknown = 0,
    /** Variation A */
    VesselABTestVariationA,
    /** Variation B */
    VesselABTestVariationB,
    /** Variation C */
    VesselABTestVariationC,
    /** Variation D */
    VesselABTestVariationD,
    /** Variation E */
    VesselABTestVariationE,
};


/** The Vessel AB test status has one of the values from VesselABTestStatus enumeration.
 */
typedef NS_ENUM(NSInteger, VesselABTestStatus) {
    /** Test not loaded yet */
    VesselABTestNotActive = 0,
    /** Test is in the process of loading */
    VesselABTestActive = 1,
};


/** VesselABTestChangedNotification is posted when a test parameters change on the server side.
 */
extern NSString *const VesselABTestChangedNotification;


/** The VesselAB class is used to access variation variables, report checkpoints and sessions.
 */
@interface VesselAB : NSObject

/** Returns a singleton that is an instance of VesselAB SDK.
 @return Singleton instance of class VesselAB.
 */
+ (VesselAB*) sharedInstance;

/** Returns a variation returned by the Vessel server.
 
 @param testName - Look up and load variation for given test.
 @param success This block is called when the test is retrieved successfully from the Vessel server.
 @param failure This block is called when the test fails to load.
 */
+ (void) getVariationForTest:(NSString *)testName WithSuccessBlock:(void (^)(NSString *testName, VesselABTestVariation variation))success failureBlock:(void (^)())failure;

/** Returns YES if test is active, else No
 
@params testName - Check if test with given name is active
**/
+ (BOOL) isTestActive:(NSString *)testName;


/** Returns YES if test is available, else No
 
 @params testName - Check if test with given name is available to run
 **/
+ (BOOL) isTestAvailable:(NSString *)testName;


/**
 From Framework v1.2 Vessel  handles test activation automatically
 @param testName - Look and activate test with given name
*/
+ (void) activateTest:(NSString *)testName __deprecated;


/** Returns the variation for a particular test name. If the test assigned to the device doesn't match testName then VesselABTestVariationUnknown is returned.
 @param testName variation assigned to the test
 */
+ (VesselABTestVariation) variationForTestName:(NSString*)testName;


/** Returns the value associated with a given test variation variable. If there is none associated or the test failed to load then the defaultValue is returned.
 
 @param testName The test name from which variation variable needs to be retrieved.
 @param variableKey The variableKey whose value is to the retrieved.
 @param defaultValue In case there is no variation variable named variationVariable or if the test failed to load then the defaultValue is returned.
 */
+ (NSString*) fromTest:(NSString*)testName getVariableValueFor:(NSString*)variableKey defaultValue:(NSString *)defaultValue;


/** Returns the boolean value associated with a given test variation variable. If there is none associated or the test failed to load then the defaultValue is returned.
 
 @param testName The test name from which variation variable needs to be retrieved.
 @param variableKey The variableKey whose value is to the retrieved.

 */
+ (BOOL) fromTest:(NSString*)testName getBooleanFor:(NSString*)variableKey;

/** Returns the assetUrl associated with a given test asset variation variable. If there is none associated or the test failed to load then the defaultValue is returned.
 
 @param testName The test name from which variation variable needs to be retrieved.
 @param variableKey The variableKey whose value is to the retrieved.
 @param defaultValue In case there is no variation variable named variationVariable or if the test failed to load then the defaultValue is returned.
 */
+ (NSString*) fromTest:(NSString*)testName getAssetUrl:(NSString*)variableKey defaultValue:(NSString *)defaultValue;


/**
 Get the image associated with a given test variation variable. If there is none associated or the test failed to load then the will execute failure block.
*/
+(void) fromTest:(NSString*)testName getImageFor:(NSString*)variableKey success:(void (^)(UIImage *variationImage)) success failureBlock:(void (^)())failure;

/** Reports a checkpoint to the Vessel server for given active test.
 
 @param checkpointName The checkpoint to be reported.
 @param testName The name of the test for which checkpoint will be reported.
 */
+ (void) reportCheckPoint:(NSString*)checkpointName forTest:(NSString*)testName;

/** Reports a checkpoint to the Vessel server
 
 @param checkpointName The checkpoint to be reported.
 */
+ (void) reportCheckPoint:(NSString*)checkpointName;


/** Reports a checkpoint to the Vessel server for given active test with metaData.
 
 @param checkpointName The checkpoint to be reported.
 @param testName The name of the test for which checkpoint will be reported.
 @param metaData Extra meta data will be reported at this checkpoint
 */
+ (void) reportCheckPoint:(NSString*)checkpointName forTest:(NSString*)testName with:(NSDictionary *) metaData;

/** Reports a checkpoint to the Vessel server
 
 @param checkpointName The checkpoint to be reported.
 @param metaData Extra meta data will be reported at this checkpoint

 */
+ (void) reportCheckPoint:(NSString*)checkpointName with:(NSDictionary *) metaData;

/** Starts a new session.
 
 @param sessionName The session that is to be started.
 */
+ (void) startSession:(NSString*)sessionName;

/** Ends a started session.
 
 @param sessionName The session to be ended. Note that the session has to be started to end it.
 */
+ (void) endSession:(NSString*)sessionName;

/** Ends all sessions that have been started but haven't been ended yet.
 */
+ (void) endAllSessions;

/** Discards all sessions that have been started but haven't been ended yet.
 */
+ (void) discardAllSessions;

/** Returns the user identifier set for the sessions and checkpoints.
 */
+ (NSString*) userId;

/** Sets a user identifier for the sessions and checkpoints.
 
@param userId A string to be associated with sessions and checkpoints.
 */
+ (void) setUserId:(NSString*)userId;

@end
