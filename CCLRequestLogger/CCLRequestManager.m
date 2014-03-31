//
//  CCLRequestManager.m
//  CCLRequestReplay
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import <CCLRequestReplay/CCLRequestRecordProtocol.h>
#import "CCLRequestManager.h"


NSString * const CCLRequestManagerDidAddRecordingNotification = @"CCLRequestManagerDidAddRecordingNotification";
NSString * const CCLRequestManagerRecordingKey = @"CCLRequestManagerRecordingKey";

CCLRequestManager *_manager;

__attribute__((constructor)) static void CCLRequestManagerStart(void) {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        _manager = [[CCLRequestManager alloc] init];
        [_manager record];

        [[NSNotificationCenter defaultCenter] removeObserver:note];
    }];
}

@implementation CCLRequestManager

+ (instancetype)standardManager {
    return _manager;
}

#pragma mark -

- (void)addRecording:(id<CCLRequestRecordingProtocol>)recording {
    [super addRecording:recording];

    [[NSNotificationCenter defaultCenter] postNotificationName:CCLRequestManagerDidAddRecordingNotification object:self userInfo:@{
        CCLRequestManagerRecordingKey: recording,
    }];
}

@end
