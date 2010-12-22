//
//  Node.h
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Node : NSObject {
	
	NSString *feature;
	NSString *surface;
	NSNumber *posid;

}

@property (nonatomic, retain) NSString *feature;
@property (nonatomic, retain) NSString *surface;
@property (nonatomic, retain) NSNumber *posid;

@end
