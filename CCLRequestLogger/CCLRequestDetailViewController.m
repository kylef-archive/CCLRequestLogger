//
//  CCLRequestListViewController.h
//  CCLRequestLogger
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import <CCLRequestReplay/CCLRequestRecording.h>
#import "CCLRequestDetailViewController.h"


typedef NS_ENUM(NSInteger, CCLRequestDetailSegments) {
    CCLRequestDetailRequestSegments,
    CCLRequestDetailResponseSegments
};


@interface CCLRequestDetailViewController ()

@property (nonatomic, strong) NSDictionary *request;
@property (nonatomic, strong) NSDictionary *headers;

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
    segmentedControl.selectedSegmentIndex = CCLRequestDetailRequestSegments;
}

- (void)changedSegment:(UISegmentedControl *)segmentedControl {
    [self.tableView reloadData];
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)self.navigationItem.titleView;

    NSDictionary *headers;
    switch ((CCLRequestDetailSegments)segmentedControl.selectedSegmentIndex) {
        case CCLRequestDetailRequestSegments:
            headers = self.recording.request.allHTTPHeaderFields;
            break;
        case CCLRequestDetailResponseSegments: {
            NSHTTPURLResponse *response = self.recording.response;
            headers = response.allHeaderFields;
            break;
        }
    }

    return [headers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];

    UISegmentedControl *segmentedControl = (UISegmentedControl *)self.navigationItem.titleView;
    NSDictionary *headers;
    switch ((CCLRequestDetailSegments)segmentedControl.selectedSegmentIndex) {
        case CCLRequestDetailRequestSegments:
            headers = self.recording.request.allHTTPHeaderFields;
            break;
        case CCLRequestDetailResponseSegments: {
            NSHTTPURLResponse *response = self.recording.response;
            headers = response.allHeaderFields;
            break;
        }
    }

    NSString *key = headers.allKeys[indexPath.row];
    NSString *value = headers[key];

    cell.textLabel.text = key;
    cell.detailTextLabel.text = value;

    return cell;
}

@end
