//
//  KMVAPI.h
//  KMVKeypad
//
//  Created by ses on 2017. 11. 7..
//  Copyright © 2017년 ses. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface KMVAPI : NSObject



#define KMV_STATUS_SUCCESS              0x00000000
#define KMV_STATUS_MODULE_NOT_FOUND     0x00000001
#define KMV_STATUS_BUNDLE_NOT_FOUND     0x00000002
#define KMV_STATUS_LICENSE_EXPIRE       0x00000003
#define KMV_STATUS_UNKNOWN              0xffffffff
#define KMV_STATUS_DB_FAILED            0x00000004
#define KMV_STATUS_DB_SUCCESS           0x00000005
#define KMV_STATUS_NULL_URL             0x00000006

#define CALLBACK_DONE              1004
#define CALLBACK_SWITCH_TO_QWERTY  1301
#define CALLBACK_SWITCH_TO_NUM     1302
#define CALLBACK_CLOSE             1901
#define CALLBACK_CHK_NUM_SAME           1005
#define CALLBACK_CHK_NUM_CONN_FORWARD   1006
#define CALLBACK_CHK_NUM_CONN_BACKWARD  1007

typedef void (*CallBack)(int index);

/*

-(unsigned long)_setKMVKeyPad:(UIView *)view : (int)maxCount : (CallBack)callbackMethod : (NSString*)URL : (int)isFix:(int)design;
-(unsigned long)_endKMVKeyPad:(UIView *)view;
-(unsigned long)_clearKMVKeyPad;

-(unsigned long)_setKMVNumPad:(UIView *)view : (int)maxCount : (CallBack)callbackMethod : (NSString*)URL : (int)isFix :(int)design;
-(unsigned long)_endKMVNumPad:(UIView *)view;
-(unsigned long)_clearKMVNumPad;

-(unsigned long)_getKMVKeypadE2EString:(unsigned char*)E2EString;
-(unsigned long)_getKMVNumpadE2EString:(unsigned char*)E2EString;

-(unsigned long)_getKMVKeypadPlainString:(char*)E2EString:(char*)plainString;
-(unsigned long)_getKMVKeypadDataArray:(char *)E2EString :(NSData*)plainString;
-(unsigned long)_getKMVNumpadPlainString:(char*)E2EString:(char*)plainString;
-(unsigned long)_getKMVNumpadDataArray:(char *)E2EString :(NSData*)plainString;
*/
-(unsigned long)setDatabase;
-(unsigned long)db_Insert :(char*)id :(char*)passwd;
-(unsigned long)db_Check :(char*)id;
-(unsigned long)db_Compare :(char*)id :(char*)encData;
-(unsigned long)db_Delete :(char*)id;
-(unsigned long)db_Update :(char*)id :(char*)targetData;






//Wrapper

-(unsigned long)setKMVKeyPad:(UIView *)view : (NSInteger)maxCount : (CallBack)callbackMethod : (NSString*)URL : (NSInteger)isFix:(NSInteger)design;
-(unsigned long)endKMVKeyPad:(UIView *)view;
-(unsigned long)clearKMVKeyPad;

-(unsigned long)setKMVNumPad:(UIView *)view : (NSInteger)maxCount : (CallBack)callbackMethod : (NSString*)URL : (NSInteger)isFix:(NSInteger)design;
-(unsigned long)endKMVNumPad:(UIView *)view;
-(unsigned long)clearKMVNumPad;

-(unsigned long)getKMVKeypadE2EString:(NSString**)E2EString;
-(unsigned long)getKMVNumpadE2EString:(NSString**)E2EString;

//-(NSString*)getKMVKeypadPlainString:(NSString*)E2EString; // return @""
//-(Byte*)getKMVKeypadByteString:(NSString*)E2EString;
-(NSData*)getKMVKeypadDataArr:(NSString*)E2EString;
-(NSString*)getKMVKeypadEncString:(NSString *)plainStr;

//-(NSString*)getKMVNumpadPlainString:(NSString*)E2EString; // return @""
//-(Byte*)getKMVNumpadByteString:(NSString*)E2EString;
-(NSData*)getKMVNumpadDataArr:(NSString*)E2EString;
-(NSString*)getKMVNumpadEncString:(NSString *)plainStr;


-(NSString*)KMVGetEncData:(NSString *)plainStr;
-(NSData*)KMVGetDecData:(NSString*)E2EString;



-(unsigned long)KMVNumpadRearray;
-(unsigned long)KMVkeypadRearray;

-(NSString*)submitKeyData;
-(NSString*)submitNumData;

-(void)showPopup : (BOOL) bShow;        // qwerty keypad 클릭시 팝업여부
-(void)setActionButton : (NSString *)action1 : (NSString *)action2; // numpad 기능키 사용 (shuffle, done, delete)  default : delete, done
-(void)setInputBar : (BOOL)isShow :(BOOL)isSwitchKey  :(NSString *)title : (NSString *)hint;
-(float)getKeypadHeight;
-(float)getNumpadHeight;
-(void)setFontName : (NSString*) fontName;



@end
