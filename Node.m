//
//  Node.m
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import "Node.h"


@implementation Node

@synthesize feature;
@synthesize surface;
@synthesize posid;


- (void)dealloc {
	self.feature = nil;
	self.surface = nil;
	self.posid = nil;

	[super dealloc];
}

@end
