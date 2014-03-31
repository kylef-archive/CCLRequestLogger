//
//  CCLRequestServer
//  CCLRequestReplay
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import "CCLRequestServer.h"


CCLRequestServer *_server;

__attribute__((constructor)) static void CCLRequestServerLaunch(void) {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        _server = [[CCLRequestServer alloc] init];

        [[NSNotificationCenter defaultCenter] removeObserver:note];
    }];
}

@implementation CCLRequestServer

@end
