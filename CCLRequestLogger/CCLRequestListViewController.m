//
//  CCLRequestListViewController.h
//  CCLRequestLogger
//
//  Created by Kyle Fuller on 22/01/2014.
//  Copyright (c) 2014 Cocode LTD. All rights reserved.
//

#import "CCLRequestManager.h"
#import "CCLRequestListViewController.h"
#import "CCLRequestDetailViewController.h"

@interface CCLRequestListInternalViewController : UITableViewController

@property (nonatomic, strong) CCLRequestManager *manager;

@end

@implementation CCLRequestListViewController

- (instancetype)init {
    CCLRequestListInternalViewController *viewController = [[CCLRequestListInternalViewController alloc] init];

    if (self = [super initWithRootViewController:viewController]) {

    }

    return self;
}

@end

@implementation CCLRequestListInternalViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"Requests";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close)];
        self.manager = [CCLRequestManager standardManager];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddRecordingNotification:) name:CCLRequestManagerDidAddRecordingNotification object:self.manager];
    }

    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CCLRequestManagerDidAddRecordingNotification object:self.manager];
}

- (void)close {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didAddRecordingNotification:(NSNotification *)notification {
    CCLRequestRecording *recording = [[notification userInfo] objectForKey:CCLRequestManagerRecordingKey];
    NSInteger row = [self.manager.recordings indexOfObject:recording];

    [self.tableView insertRowsAtIndexPaths:@[
        [NSIndexPath indexPathForRow:row inSection:0]
    ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.rowHeight = 60;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[CCLRequestManager standardManager].recordings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];

    CCLRequestRecording *recording = [[CCLRequestManager standardManager].recordings objectAtIndex:indexPath.row];
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)[recording response];
    NSString *method = [recording.request HTTPMethod];
    NSURL *URL = [recording.request URL];

    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ %@", method, @(response.statusCode), [URL path]];
    cell.detailTextLabel.text = URL.host;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CCLRequestDetailViewController *viewController = [[CCLRequestDetailViewController alloc] init];
    viewController.recording = [[CCLRequestManager standardManager].recordings objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
