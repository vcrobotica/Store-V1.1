//
//  Emailer.m
//  Vending V1.0
//
//  Created by V&C on 29/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "Emailer.h"

@implementation Emailer

- (id)init {
    self = [super init];
    
    if (self) {
        self.emailSender = @"vending@vcrobotica.com";
        self.login = @"vending@vcrobotica.com";
        self.pass = @"DolceGusto1";
        self.emailRelyHost = @"mail.vcrobotica.com";
        self.emailCC = @"vc.robotica@gmail.com";
        self.emailBCC = @"";
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.correo = [defaults objectForKey:@"mailAct1"];
    }
    
    return self;
}

-(SKPSMTPMessage*)prepareEmail: (int) emailType : (NSMutableString*) faltantesArray {
    
    NSLog(@"Start Sending");
    
    SKPSMTPMessage *emailMessage = [[SKPSMTPMessage alloc] init];
    
    emailMessage.fromEmail = self.emailSender;
    emailMessage.toEmail   = self.correo;
    emailMessage.relayHost = self.emailRelyHost;
    emailMessage.ccEmail   = self.emailCC;
    emailMessage.bccEmail  = self.emailBCC;
    
    emailMessage.requiresAuth = YES;
    emailMessage.login        = self.login;
    emailMessage.pass         = self.pass;
    
    NSString *messageBody = @"";
    
    if (emailType == 0) {
        emailMessage.subject =@"Apertura de Puerta";
        messageBody = @"Se ha detectado la apertura de la puerta en Store 0001";
        
    }
    else if (emailType == 1){
        emailMessage.subject =@"Nivel Bajo de Agua";
        messageBody = @"Se ha detectado nivel bajo de agua en Store 0001";
    }
    else if (emailType == 2){        
        emailMessage.subject =@"Falta Producto";
        messageBody = [NSString stringWithFormat:@"Faltan los siguientes productos %@ en Store 0001",faltantesArray];
    }
    else if (emailType == 3){
        emailMessage.subject = @"Posible robo en Store";
        messageBody = @"Se ha detectado posible robo en Store 0001";
    }
    else if (emailType == 4){
        emailMessage.subject = @"Reporte de Ventas Store 0001";
        messageBody = [self createFile];
    }
    else if(emailType == 5){
        emailMessage.subject = @"iPad Desconectada de Corriente Electrica Store 0001";
        messageBody = @"iPad Desconectada de Corriente Electrica Store 0001";
    }
    else if(emailType == 6){
        emailMessage.subject = @"iPad Conectada a Corriente Electrica Store 0001";
        messageBody = @"iPad Conectada a Corriente Electrica Store 0001";
    }
    else if(emailType == 7){
        emailMessage.subject = @"iPad Estado Bateria Unknown Store 0001";
        messageBody = @"iPad Estado Bateria Unknown Store 0001";
    }
    else if(emailType == 8){
        emailMessage.subject = @"Puerta cerrada Store";
        messageBody = @"La puerta ha sido cerrada en Store 0001";
    }
    else if(emailType == 9){
        emailMessage.subject = @"Controlador iniciado en Store 0001";
        messageBody = @"Se ha iniciado el controlador en Store 0001";
    }
    else{
        emailMessage.subject = @"Correo sin tipo de dato - Store 0001";
        messageBody = @"Se disparo este correo sin reconocer el tipo de dato - Store 0001";

    }
    
    emailMessage.wantsSecure = NO;
    //emailMessage.delegate = self;
    
    NSDictionary *plainMsg = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey, messageBody,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    
    emailMessage.parts = [NSArray arrayWithObjects:plainMsg,nil];

    return emailMessage;
}

-(void) setArrays : (NSMutableArray*) names : (NSMutableArray*) prices : (NSMutableArray*) dates : (NSMutableArray*) lotes : (NSMutableArray*) fechas{
    self.coffeeNameBuyedArray = names;
    self.coffeePriceBuyedArray = prices;
    self.dateBuyedArray = dates;
    self.lotesArray = lotes;
    self.fechasArray = fechas;
}

//To Work
-(NSString *) createFile{

    NSMutableString *csv;
    
    if(self.coffeeNameBuyedArray.count == 0){
        csv = [NSMutableString stringWithString:@"No hubo ventas durante el dia en Store 0001"];
    }
    else{
        csv = [NSMutableString stringWithString:@"Tipo de Cafe,Precio,Fecha Venta,Lote,Fecha Caducidad"];
        for (int i=0; i<self.coffeeNameBuyedArray.count; i++ ) {
        [csv appendFormat:@"\n\"%@\",%@,\"%@\",%@,%@", [self.coffeeNameBuyedArray objectAtIndex:i],[self.coffeePriceBuyedArray objectAtIndex:i],[self.dateBuyedArray objectAtIndex:i], [self.lotesArray objectAtIndex:i], [self.fechasArray objectAtIndex:i]];
        }
    }
    
    return csv;
}
@end
