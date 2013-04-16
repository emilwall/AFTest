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
        _sharedClient = [[EWLastMinuteApi alloc] initWithBaseURL:[NSURL URLWithString:@""]];
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
    
    // By default, the example ships with SSL pinning enabled for the app.net API pinned against the public key of adn.cer file included with the example. In order to make it easier for developers who are new to AFNetworking, SSL pinning is automatically disabled if the base URL has been changed. This will allow developers to hack around with the example, without getting tripped up by SSL pinning.
    if ([[url scheme] isEqualToString:@"https"] && [[url host] isEqualToString:@"alpha-api.app.net"]) {
        [self setDefaultSSLPinningMode:AFSSLPinningModePublicKey];
    }
    
    return self;
}


@end
