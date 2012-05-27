//
//  ListViewVC.m
//  EvernoteAPIViewer
//
//  Created by Koichi Fukuda on 12/05/27.
//  Copyright (c) 2012 freruProductive. All rights reserved.
//

#import "ListViewVC.h"
#import "DocViewerVC.h"


@implementation ListViewVC
@synthesize groups;
@synthesize api;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

	NSString *path = [[NSBundle mainBundle] pathForResource:@"EvernoteAPI" ofType:@"plist"];
	NSData *data = [NSData dataWithContentsOfFile:path];
	NSString *errStr;
	api = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:nil errorDescription:&errStr];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	if (groups) {
		return groups.count;
	} else {
		return 0;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	NSString *funcName = [groups objectAtIndex:indexPath.row];
	cell.textLabel.text = funcName;
	cell.detailTextLabel.text = [[api objectForKey:funcName] objectForKey:@"description"];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	NSString *dest = NSStringFromClass([segue.destinationViewController class]);
	if ([dest isEqualToString:@"DocViewerVC"]) {
		DocViewerVC *vc = segue.destinationViewController;
		UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.tableView.indexPathForSelectedRow];
		NSString *funcName = cell.textLabel.text;
		NSString *className = [[api objectForKey:funcName] objectForKey:@"classname"];

		vc.url = [NSString stringWithFormat:@"http://dev.evernote.com/documentation/reference/%@.html#Fn_%@_%@", className, className, funcName];
	}
}

@end
