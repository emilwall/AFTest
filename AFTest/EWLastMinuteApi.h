//
//  EWLastMinuteApi.h
//  AFTest
//
//  Created by Emil Wall on 4/16/13.
//  Copyright (c) 2013 Emil Wall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface EWLastMinuteApi : AFHTTPClient

+ (EWLastMinuteApi *)sharedClient;

@end
