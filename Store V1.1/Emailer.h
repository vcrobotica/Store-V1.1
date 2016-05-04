//
//  Emailer.h
//  Vending V1.0
//
//  Created by V&C on 29/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKPSMTPMessage.h"

@interface Emailer : NSObject <SKPSMTPMessageDelegate>

@property NSString* correo;
@property NSString* emailSender;
@property NSString* emailRelyHost;
@property NSString* emailCC;
@property NSString* emailBCC;
@property NSString* login;
@property NSString* pass;
@property NSMutableArray *coffeeNameBuyedArray;
@property NSMutableArray *coffeePriceBuyedArray;
@property NSMutableArray *dateBuyedArray;
@property NSMutableArray *lotesArray;
@property NSMutableArray *fechasArray;

-(id) init;
-(SKPSMTPMessage*) prepareEmail : (int) emailType : (NSMutableString*) faltantesArray;
-(void) setArrays : (NSMutableArray*) names : (NSMutableArray*) prices : (NSMutableArray*) dates : (NSMutableArray*) lotes : (NSMutableArray*) fechas;
-(NSString *) createFile;
@end
