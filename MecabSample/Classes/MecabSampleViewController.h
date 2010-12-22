//
//  MecabSampleViewController.h
//  MecabSample
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NodeCell.h"

@interface MecabSampleViewController : UIViewController {

	UITextField *textField;
	UITableView *tableView_;
	NodeCell *nodeCell;

	NSArray *nodes;

}

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UITableView *tableView_;
@property (nonatomic, retain) IBOutlet NodeCell *nodeCell;
@property (nonatomic, retain) NSArray *nodes;

- (IBAction)parse:(id)sender;

@end

