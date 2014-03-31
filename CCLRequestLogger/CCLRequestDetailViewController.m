//
//  CCLRequestListViewController.h
//  CCLRequestLogger
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import <CCLRequestReplay/CCLRequestRecording.h>
#import "CCLRequestDetailViewController.h"


@interface CCLRequestDetailViewController ()

@end

@implementation CCLRequestDetailViewController

- (void)setRecording:(CCLRequestRecording *)recording {
    _recording = recording;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Request", @"Response"]];
    self.navigationItem.titleView = segmentedControl;
    [segmentedControl addTarget:self action:@selector(changedSegment:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
}

- (void)changedSegment:(UISegmentedControl *)segmentedControl {

}

@end
