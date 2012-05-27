//
//  DocViewerVC.h
//  EvernoteAPIViewer
//
//  Created by Koichi Fukuda on 12/05/27.
//  Copyright (c) 2012 freruProductive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocViewerVC : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (strong, nonatomic) NSString *url;

@end
