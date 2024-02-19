//
//  Log.h
//  LockinOTP
//
//  Created by LIAPP TEAM on 2016. 7. 20..
//  Copyright © 2016년 LIAPP TEAM. All rights reserved.
//

#ifndef Log_h
#define Log_h


@interface LiappOrder : NSObject
{
    NSString *temp1;
}

@property (nonatomic, retain) NSString *temp1;

- (id)initWithIdentifier;

@end

void debug2(const char *message, ...) __attribute__((format(printf, 1, 2)));

void Run();

#endif /* Log_h */
