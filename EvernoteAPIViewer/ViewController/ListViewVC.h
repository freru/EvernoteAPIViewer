//
//  ListViewVC.h
//  EvernoteAPIViewer
//
//  Created by Koichi Fukuda on 12/05/27.
//  Copyright (c) 2012 freruProductive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewVC : UITableViewController
@property (strong, nonatomic) NSArray *groups;
@property (strong, nonatomic) NSDictionary *api;

@end
