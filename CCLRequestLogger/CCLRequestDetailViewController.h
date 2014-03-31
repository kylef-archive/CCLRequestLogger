//
//  CCLRequestDetailViewController.h
//  CCLRequestLogger
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CCLRequestRecording;

@interface CCLRequestDetailViewController : UITableViewController

@property (nonatomic, strong) CCLRequestRecording *recording;

@end
