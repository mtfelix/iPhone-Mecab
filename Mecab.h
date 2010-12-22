//
//  Mecab.h
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//
//  謝辞:
//  このソースコードを作成するにあたり、以下のサイトを参考にさせて頂きました。
//  http://mecab.sourceforge.net/libmecab.html
//  http://chasen.org/~taku/blog/archives/2008/07/mac_os_x_leropa.html
//  http://pokosho.com/b/archives/1012
//  http://pokosho.com/b/archives/1045
//  http://pokosho.com/b/archives/1057


#include <mecab.h>
#import <UIKit/UIKit.h>


@interface Mecab : NSObject {
	mecab_t *mecab;
}

+ (NSArray *)parseToNodeWithString:(NSString *)string;
- (NSArray *)parseToNodeWithString:(NSString *)string;

@end
