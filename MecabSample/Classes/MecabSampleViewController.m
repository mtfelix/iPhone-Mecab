//
//  MecabSampleViewController.m
//  MecabSample
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import "MecabSampleViewController.h"
#import "Mecab.h"
#import "Node.h"

@implementation MecabSampleViewController

@synthesize textField;
@synthesize tableView_;
@synthesize nodeCell;
@synthesize nodes;


- (IBAction)parse:(id)sender {
	[textField resignFirstResponder];
	
	NSString *string = textField.text;
	
	Mecab *mecab = [Mecab new];
	self.nodes = [mecab parseToNodeWithString:string];
	[mecab release];

	[tableView_ reloadData];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (nodes) {
		return [nodes count];
	}
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NodeCell";
    
    NodeCell *cell = (NodeCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"NodeCell" owner:self options:nil];
		cell = nodeCell;
		self.nodeCell = nil;
    }
    
	Node *node = [nodes objectAtIndex:indexPath.row];
	cell.featureLabel.text = node.feature;
	cell.surfaceLabel.text = node.surface;
    
    return cell;
}

- (void)dealloc {
	self.nodes = nil;
	
	self.textField = nil;
	self.tableView_ = nil;
	self.nodeCell = nil;
    [super dealloc];
}

@end
