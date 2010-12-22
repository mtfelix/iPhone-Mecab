//
//  Mecab.m
//
//  Created by Watanabe Toshinori on 10/12/22.
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#include <mecab.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iconv.h>
#import "Mecab.h"
#import "Node.h"


@implementation Mecab


char *iconv_convert_helper(iconv_t ic, const char *input, size_t ilen, size_t *length) {
	size_t olen = ilen * 4;
	char *result = (char *)malloc(olen);
	char *ibuf = (char *)input;
	char *obuf_org = result;
	char *obuf = result;
	size_t olen_org = olen;
	memset(result, 0, olen);
	if (ic == (iconv_t)(-1)) {
		exit(-1);
	}
	while (ilen != 0) {
		if (iconv(ic, (char **)(&ibuf), &ilen, &obuf, &olen) == (size_t)(-1)) {
			fprintf(stderr, "error in iconv\n");
			free(result);
			return NULL;
		}
	}
	*length = olen_org - olen;
	obuf_org[*length] = '\0';
	iconv_close(ic);
	return result;
}

char *utf8_to_utf16(const char *input, size_t ilen, size_t *olen) {
	iconv_t ic = iconv_open("UTF-16LE", "UTF-8"); 
	return iconv_convert_helper(ic, input, ilen, olen);
}

char *utf16_to_utf8(const char *input, size_t ilen, size_t *olen) {
	iconv_t ic = iconv_open("UTF-8", "UTF-16LE");
	return iconv_convert_helper(ic, input, ilen, olen);
}


- (NSArray *)parseToNodeWithString:(NSString *)string {
	
	mecab_t *mecab;
	const mecab_node_t *node;
	char *buf = (char *)[string UTF8String];
	char *buf2;

	mecab = mecab_new2("-d /usr/lib/dic/ja/im");
	if (mecab == NULL) {
		fprintf(stderr, "error in mecab_new2: %s\n", mecab_strerror(NULL));

		return nil;
	}
	
	size_t olen = 0;
	buf2 = utf8_to_utf16(buf, strlen(buf), &olen);
	node = mecab_sparse_tonode2(mecab, buf2, olen);
	if (node == NULL) {
		fprintf(stderr, "error\n");

		return nil;
	}
	
	NSMutableArray *newNodes = [NSMutableArray array];
	node = node->next;
	for (; node->next != NULL; node = node->next) {
		Node *newNode = [Node new];
		newNode.surface = [NSString stringWithCString:utf16_to_utf8(node->surface, node->length, &olen) encoding:NSUTF8StringEncoding];
		newNode.feature = [NSString stringWithCString:utf16_to_utf8(node->feature, sizeof(node->feature), &olen) encoding:NSUTF8StringEncoding];
		newNode.posid = [NSNumber numberWithInt:node->posid];
		[newNodes addObject:newNode];
		[newNode release];
	}
	free(buf2);
	
	mecab_destroy(mecab);
	
	return [NSArray arrayWithArray:newNodes];
}

@end
