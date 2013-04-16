//
//  EWLastMinuteApi.m
//  AFTest
//
//  Created by Emil Wall on 4/16/13.
//  Copyright (c) 2013 Emil Wall. All rights reserved.
//

#import "EWLastMinuteApi.h"

@implementation EWLastMinuteApi

+ (EWLastMinuteApi *)sharedClient {
    static EWLastMinuteApi *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[EWLastMinuteApi alloc] initWithBaseURL:[NSURL URLWithString:@"http://travel-offers-api.apphb.com/"]];
    });

    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }

    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];

    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];

    return self;
}

@end
