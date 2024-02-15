//
//  Liapp.h
//  Liapp
//
//  Created by lockin on 2016. 4. 26..
//  Copyright © 2016년 lockin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Liapp : NSObject
{
    NSString *strNotify;
}

@property (readwrite, assign) NSString *strNotify;

//ver 1
- (NSString*)GetErrorString;
- (instancetype)initWithInfo:(NSString *)serverip serverport:(int)serverport id:(NSString *)id;
- (instancetype)initWithInfo:(NSString *)serverip serverport:(int)serverport;
- (int)SecurityVerification;
- (int)HackToolsVerification;
- (NSString*)RequestAuthKey;
-(NSString*)RequestAuthKey : (NSString*)strData;
- (void)SetKeychain:(NSString*)keyname keyvalue:(NSString *)keyvalue;
- (NSString*)GetKeychain:(NSString*)keyname;

//ver 2
+ (int)LA1;
+ (int)LA2;
+ (NSString*)GA;
+ (NSString*)GA: (NSString*)strData;
+ (NSString*)GetMessage;
+ (void)SUID: (NSString*)strData;
+ (NSString*)GI;

//LiappSecureVariable

+ (bool)SVUI1;
+ (bool)SVUG1: (int[])c_array;
+ (bool)SVUG2: (long[])c_array;

typedef enum
{
    LIAPP_EXCEPTION = -1,
    LIAPP_SUCCESS = 0,
    LIAPP_DETECTED = 1,
    LIAPP_DETECTED_VM = 3,
    LIAPP_DETECTED_ROOTING = 7,
    LIAPP_DETECTED_HACKING_TOOL = 8,
	
}LIAPP_RET_CODE;

@end
