//
//  CCLRequestManager.h
//  CCLRequestReplay
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import <CCLRequestReplay/CCLRequestReplayManager.h>


NSString * const CCLRequestManagerDidAddRecordingNotification;
NSString * const CCLRequestManagerRecordingKey;

@interface CCLRequestManager : CCLRequestReplayManager

+ (instancetype)standardManager;

@end
