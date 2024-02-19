//
//  Log.m
//  LockinOTP
//
//  Created by LIAPP TEAM on 2016. 7. 20..
//  Copyright © 2016년 LIAPP TEAM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiappOrder.h"
#import "Liapp.h"

@implementation LiappOrder

- (id)initWithIdentifier;
{
    return self;
}

@end

void debug2(const char *message,...)
{
    [Liapp LA1];
    va_list args;
    va_start(args, message);
    NSLog(@"%@",[[NSString alloc] initWithFormat:[NSString stringWithUTF8String:message] arguments:args]);
    va_end(args);
}




