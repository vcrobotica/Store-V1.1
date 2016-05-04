//
//  CoffeeButton.m
//  Vending V1.0
//
//  Created by V&C on 28/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "CoffeeButton.h"

@implementation CoffeeButton

- (void)executeSelection:   (ViewController*)view :
                            (NSString*)coffename :
                            (NSString*)imgmenu :
                            (NSString*)imgdescription :
                            (NSString*)imgbtn :
                            (int) volbuy
{
    if(view.getCancelar.isHidden){
        
        int salir = 0;
        int i = 0;
        
        NSMutableArray* nombres = view.getNombres;
        
        while (salir == 0 && i < 16){
            
            if ([nombres[i]  isEqual: coffename]) {
                salir = 1;
            }
            else
                i++;
            
        }
        if(salir == 1){
            
            view.menuView.image = [UIImage imageNamed:imgmenu];
            view.descripcionView.image = [UIImage imageNamed:imgdescription];
            view.comprarView.image = [UIImage imageNamed:imgbtn];
            
            
            view.volCompra = [NSNumber numberWithInt: volbuy];
            
            NSMutableArray* precios = view.getPrecios;
            NSString *precio = precios[i];
            NSString *newStr = [precio substringToIndex:[precio length]-1];
            newStr = [newStr stringByReplacingOccurrencesOfString:@"." withString:@""];
            if ([newStr length] < 4) {
                newStr = [NSString stringWithFormat:@"0%@", newStr];
            }
            
            NSString *pos2 = [NSString stringWithFormat:@"%.2d", i];
            
            NSString * strRR = [NSString stringWithFormat:@"C0%@%@", pos2, newStr];
            view.pruebaLb.text = strRR;
            
            view.texto = strRR;

            view.seleccionaLb.hidden = TRUE;
            view.comprar.hidden = FALSE;
            
            view.seleccionaView.hidden = TRUE;
            view.moradoView.hidden = TRUE;
            view.descripcionView.hidden = FALSE;
            view.comprarView.hidden = FALSE;
            view.variedadesView.hidden = TRUE;
            view.menuView.hidden = FALSE;
            view.menuBtn.hidden = FALSE;
            
            view.americanoBtn.alpha = .5;
            view.aromaBtn.alpha = .5;
            view.aromaIntensoBtn.alpha = .5;
            view.cafeAuLaitBtn.alpha = .5;
            view.cappuccinoBtn.alpha = .5;
            view.cappuccinnoIceBtn.alpha = .5;
            view.cappuccinoSkinnyBtn.alpha = .5;
            view.chaiTeaLatteBtn.alpha = .5;
            view.chococaramelBtn.alpha = .5;
            view.chococinoBtn.alpha = .5;
            view.espressoBtn.alpha = .5;
            view.espressoBaristaBtn.alpha = .5;
            view.espressoCortadoBtn.alpha = .5;
            view.espressoDecafBtn.alpha = .5;
            view.espressoIntensoBtn.alpha = .5;
            view.latteCaramelBtn.alpha = .5;
            view.latteMacchiatoBtn.alpha = .5;
            view.latteVanillaBtn.alpha = .5;
            view.lungoBtn.alpha = .5;
            view.lungoDecafBtn.alpha = .5;
            view.lungoIntensoBtn.alpha = .5;
            view.marrakeshBtn.alpha = .5;
            view.ristrettoBtn.alpha = .5;
            
        }
    }
}


@end
