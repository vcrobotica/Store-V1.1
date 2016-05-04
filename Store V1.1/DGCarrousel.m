//
//  DGCarrousel.m
//  Vending V1.0
//
//  Created by V&C on 30/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "DGCarrousel.h"

@implementation DGCarrousel

/*
 - (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
 {
 //customize carousel display
 switch (option)
 {
 case iCarouselOptionWrap:
 {
 //normally you would hard-code this to YES or NO
 return YES;
 }
 case iCarouselOptionSpacing:
 {
 //add a bit of spacing between the item views
 return value * 1.05f;
 }
 case iCarouselOptionFadeMax:
 {
 if (carousel.type == iCarouselTypeCustom)
 {
 //set opacity based on distance from camera
 return 1.0f;
 }
 return value;
 }
 default:
 {
 return value;
 }
 }
 }


- (void)carouselDidEndScrollingAnimation:carousel{
//UIButton *button = (UIButton *)view;
contadorTimer = 0;
NSInteger indice = self.carousel.currentItemIndex;
//NSInteger indice = [self.carousel indexOfItemViewOrSubview:button];
indiceAct = indice;

if (self.cancelar.hidden) {
self.pruebaLb.text = posiciones[indice];
[manager writeString:posiciones[indice]];
}

if (self.cancelar.isHidden && _moviePlayer.view.isHidden) {
self.op1.image = [UIImage imageNamed:imagenes[indice]];

NSString *doble= slots[indice];
NSString *posicion= posiciones[indice];
NSString *precio = precios[indice];
NSString *pos2 = [posicion stringByReplacingOccurrencesOfString:@"P" withString:@""];

volCompra = volumen[indice];

NSString *newStr = [precio substringToIndex:[precio length]-1];
newStr = [newStr stringByReplacingOccurrencesOfString:@"." withString:@""];
if ([newStr length] < 4) {
newStr = [NSString stringWithFormat:@"0%@", newStr];
}

NSString * strRR = [NSString stringWithFormat:@"C%@%@%@", doble, pos2, newStr];
self.pruebaLb.text = strRR;


texto = strRR;
//self.tipoLb.text = nombres[indice];
//self.precioListaLb.text = precios[indice];
//self.op1.hidden = FALSE;
//self.seleccionaLb.hidden = TRUE;
//self.tipoLb.hidden = FALSE;
//self.precioListaLb.hidden = FALSE;
//self.comprar.hidden = FALSE;

}
//return button;

}

 
 - (void)buttonTapped:(UIButton *)sender
 {
 [self.view endEditing:YES];
 //get item index for button
 NSInteger index = [self.carousel indexOfItemViewOrSubview:sender];
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 /*
 [[[[UIAlertView alloc] initWithTitle:@"Button Tapped"
 message:[NSString stringWithFormat:@"You tapped button number %i", index]
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil] autorelease] show];
 
 NSNumber *ind = [NSNumber numberWithInteger: index];
 
 contadorTimer = 0;
 
 [defaults setValue: ind forKey:@"slotD"];
 [defaults synchronize];
 /*
 if (self.cancelar.isHidden && _moviePlayer.view.isHidden) {
 self.op1.image = [UIImage imageNamed:imagenes[index]];
 
 NSString *doble= slots[index];
 NSString *posicion= posiciones[index];
 NSString *precio = precios[index];
 NSString *pos2 = [posicion stringByReplacingOccurrencesOfString:@"P" withString:@""];
 NSString *newStr = [precio substringToIndex:[precio length]-1];
 newStr = [newStr stringByReplacingOccurrencesOfString:@"." withString:@""];
 if ([newStr length] < 4) {
 newStr = [NSString stringWithFormat:@"0%@", newStr];
 }
 
 NSString * strRR = [NSString stringWithFormat:@"C%@%@%@", doble, pos2, newStr];
 self.pruebaLb.text = strRR;
 
 
 texto = strRR;
 self.tipoLb.text = nombres[index];
 self.precioListaLb.text = precios[index];
 self.op1.hidden = FALSE;
 self.seleccionaLb.hidden = TRUE;
 self.tipoLb.hidden = FALSE;
 self.precioListaLb.hidden = FALSE;
 self.comprar.hidden = FALSE;
 
 }
 
 
 
 
 }

 
 - (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
 {
 UIButton *button = (UIButton *)view;
 if (button == nil)
 {
 //no button available to recycle, so create new one
 //UIImage *image = [UIImage imageNamed:@"lungo.png"];
 button = [UIButton buttonWithType:UIButtonTypeCustom];
 //button.frame = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
 button.frame = CGRectMake(0.0f, 0.0f, 300, 300);
 [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 //[button setBackgroundImage:image forState:UIControlStateNormal];
 button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
 [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
 //[button addTarget:self action:@selector(vistaBoton:) forControlEvents:UIControlEventAllEvents];
 //[NSNotificationCenter defaultCenter] addObserver:self forKeyPath:@selector(vistaBoton:) options:NS context:<#(void *)#>]
 //[button addSubview:<#(UIView *)#>]
 /*
 [[NSNotificationCenter defaultCenter]
 addObserver:self
 selector:@selector(vistaBoton:)
 name:UIControlStateNormal
 object: button];
 
 }
 else
 {
 //get a reference to the label in the recycled view
 //label = (UILabel *)[view viewWithTag:1];
 //[manager writeString:@"P00"];
 
 }
 
 [button setImage:[UIImage imageNamed:imagenes[index]] forState:UIControlStateNormal];
 
 
 
 return button;
 }
 
 
 
 
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
//generate 100 buttons
//normally we'd use a backing array
//as shown in the basic iOS example
//but for this example we haven't bothered
return elementos;
}
*/


@end
