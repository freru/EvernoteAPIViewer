//
//  ViewController.m
//  EvernoteAPIViewer
//
//  Created by Koichi Fukuda on 12/05/28.
//  Copyright (c) 2012 freruProductive. All rights reserved.
//

#import "ViewController.h"
#import "ListViewVC.h"
#import "GroupViewVC.h"


@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (void)setAPIList:(ListViewVC *)vc with:(NSString *)list
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
	NSData *data = [NSData dataWithContentsOfFile:path];
	id plist;
	NSString *errStr;
	plist = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:nil errorDescription:&errStr];
	NSArray *groups = [plist objectForKey:list];
	vc.groups = groups;
}

- (void)setGroup:(GroupViewVC *)vc with:(NSString *)group
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
	NSData *data = [NSData dataWithContentsOfFile:path];
	id plist;
	NSString *errStr;
	plist = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:nil errorDescription:&errStr];
	NSArray *groups = [plist objectForKey:group];
	vc.groups = groups;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	id vc = segue.destinationViewController;
	
	switch (self.tableView.indexPathForSelectedRow.section) {
		case 0:
		{
			[self setAPIList:vc with:@"importance"];
		}
			break;
		case 1:
		{
			[self setAPIList:vc with:@"UserStoreAlphabet"];
		}
			break;
		case 2:
		{
			switch (self.tableView.indexPathForSelectedRow.row) {
				case 0:
				{
					[self setAPIList:vc with:@"NoteStoreAlphabet"];
				}
					break;
				case 1:
				{
					[self setGroup:vc with:@"NoteStoreCategory"];
				}
					break;
				case 2:
				{
					[self setGroup:vc with:@"NoteStoreFunction"];
				}
					break;
			}
		}
			break;
	}
}

@end
