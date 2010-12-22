//
//  MecabSampleAppDelegate.h
//  MecabSample
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MecabSampleViewController;

@interface MecabSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MecabSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MecabSampleViewController *viewController;

@end

