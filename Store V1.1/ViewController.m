//
//  ViewController.m
//  Vending 0.2
//
//  Created by V&C on 20/07/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "ViewController.h"
#import "vista2ViewController.h"
#import "vista3ViewController.h"
#import "vistaAlternaViewController.h"
#import "RscMgr.h"
//#import "CoffeeButton.h"


//#import "PlayVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MessageUI/MessageUI.h>

#import "Emailer.h"
#import "CoffeeType.h"

enum
{
    kSectionCableStatus = 0,
    kNumCableStatus = 1,
    kSectionPortConfig = 1,
    kSectionStats = 2,
    kNumStats = 3,
    
};


#define MODEM_STAT_ON_COLOR [UIColor colorWithRed:0.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]
#define MODEM_STAT_OFF_COLOR [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:1.0]
#define MODEM_STAT_RECT CGRectMake(0.0f,0.0f,42.0f,21.0f)

#define TABLE_DATA_PLIST @"PortconfigStrings"

#define CABLE_CONNECTED_TEXT @"Connected";
#define CABLE_NOT_CONNECTED_TEXT @"Not Connected";
#define CABLE_REQUIRES_PASSCODE_TEXT @"Passcode Required"


@interface ViewController ()


@end

@implementation ViewController

@synthesize tipoLb;
@synthesize priceLB;
@synthesize op1;
@synthesize textoRecib;
@synthesize ingresadoLb;
@synthesize videoBtn;
@synthesize precioListaLb;
@synthesize cancelar;
@synthesize detenerVid;
@synthesize comprar;
@synthesize precioLb;
@synthesize seleccionaLb;
@synthesize carousel;
@synthesize passwordText;
@synthesize pruebaLb;
@synthesize ingresar;
@synthesize variedadesView;
@synthesize moradoView;
@synthesize seleccionaView;
@synthesize descripcionView;
@synthesize comprarView;
@synthesize menuView;
@synthesize menuBtn;
@synthesize americanoBtn;
@synthesize aromaBtn;
@synthesize aromaIntensoBtn;
@synthesize cafeAuLaitBtn;
@synthesize cappuccinoBtn;
@synthesize cappuccinnoIceBtn;
@synthesize cappuccinoSkinnyBtn;
@synthesize chaiTeaLatteBtn;
@synthesize chococaramelBtn;
@synthesize chococinoBtn;
@synthesize espressoBtn;
@synthesize espressoBaristaBtn;
@synthesize espressoCortadoBtn;
@synthesize espressoDecafBtn;
@synthesize espressoIntensoBtn;
@synthesize latteCaramelBtn;
@synthesize latteMacchiatoBtn;
@synthesize latteVanillaBtn;
@synthesize lungoBtn;
@synthesize lungoDecafBtn;
@synthesize lungoIntensoBtn;
@synthesize marrakeshBtn;
@synthesize ristrettoBtn;
//Fase 2
@synthesize plecaView;
@synthesize pasosView;
@synthesize flechaDerBtn;
@synthesize flechaIzqBtn;
@synthesize fondoInitView;
@synthesize inicializaLb;
@synthesize doNothing;
//Fase 3: Store
@synthesize preparaBebidaBtn;
@synthesize preparaPaqueteBtn;
@synthesize storePlecaView;
@synthesize preparaBebidaView;
@synthesize preparaPaqueteView;
@synthesize tablaVariety;
@synthesize regresaBebidaBtn;
@synthesize regresaBebidaView;
@synthesize botonesView;
@synthesize masBtn;
@synthesize menosBtn;
@synthesize vinetasTotalView;
@synthesize totalLb;
@synthesize coffeeTypeSelectedView;
@synthesize comprarPaqueteBtn;
@synthesize comprarPaqueteView;
@synthesize pagadoView;
@synthesize precioPagadoLb;
@synthesize regresaPaqueteBtn;
@synthesize cancelarPaqueteBtn;
@synthesize cancelarPaqueteView;
@synthesize cambioView;
@synthesize pruebaLb2;
@synthesize despachandoLb;
@synthesize vaciarBtn;
@synthesize llenarTanqueBtn;
@synthesize enviarReporteBtn;

//NSArray *recipes;
NSMutableArray *productosActuales;

NSMutableArray *imagenes;
NSMutableArray *nombres;
NSMutableArray *precios;
NSMutableArray *posiciones;
NSMutableArray *slots;
NSMutableArray *volumen;

NSString *fileAtPath;
NSMutableString *faltantes;
NSNumber *volCompra;
NSInteger indiceAct;

int test_for_simulator = 0;                 //0 is no simulator environment;  1 = simulator environment

int elementos;
int doble;
int i2;
int contadorTimer = 0;
int alertaRobo = 0;
double tiempoTimer = 60;       //1 MINUTE TO ASSURE IPAD CAN SLEEP
double tiempoTimerNuevo = 10;

int numeroCapsulasPorPaquete = 32;

//Fase 2
NSString *coffeeSelected = @"";
int currentStep = -1;
NSString *botonBlancoSTR = @"menu_palabra_blanco.png";
NSString *botonGrisSTR = @"menu_palabra_gris.png";
//Sending Report
bool sendReport = FALSE;
bool sendiPadDisconnected = FALSE;
int hourToSendReport = 23;  //23:00. At 0:00 system resets.
NSMutableArray *coffeeNameBuyedArray;
NSMutableArray *coffeePriceBuyedArray;
NSMutableArray *dateBuyedArray;
NSMutableArray *lotesArray;
NSMutableArray *fechasArray;

//Fase 3
NSArray *productosVariety;      //Array with current products in list
NSMutableArray *cantidades;     //Array with quantity of products needed by user
NSInteger fila = 0;
NSInteger total = 0;
bool sendiPadUnknown = TRUE;
int totalPaquetes = 0;
NSMutableArray *existenciasArray;   //Array with quantity of available products in machine
NSMutableArray *existenciasArrayTemp;  //Array with the temp available products before the purchase
NSMutableArray *productosAct;       //Array with name of all available products in machine
NSMutableArray *finalPurchaseArray; //Array with the final purchase to be dispatched
int currentViewFlag = -1;   //0-Prepara BebidaView; 1-Prepara Paquete -- used for receiving prices from MC
int assureCurrentView = -1; //To avoid timer!
NSString *finalStatus;
int currentSlot = 0;

NSString *redparkname = @"com.redpark.hobdb9v";


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    //manager = [[RscMgr alloc] init];
    //[manager setDelegate:self];
    //pruebaLb.text = @"entra did appear";
    //pruebaLb.hidden = FALSE;
    //[manager open];
    //[self cableConnected:redparkname];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //manager = [[RscMgr alloc] init];
    //[manager setDelegate:self];
    //pruebaLb.text = @"entra will appear";
    //pruebaLb.hidden = FALSE;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    manager = [[RscMgr alloc] init];
    [manager setDelegate:self];

    //Fase 3
    preparaBebidaBtn.hidden = FALSE;
    preparaPaqueteBtn.hidden = FALSE;
    storePlecaView.hidden = FALSE;
    preparaBebidaView.hidden = FALSE;
    preparaPaqueteView.hidden = FALSE;
    regresaBebidaView.hidden = TRUE;
    regresaBebidaBtn.hidden = TRUE;
    tablaVariety.hidden = TRUE;
    botonesView.hidden = TRUE;
    masBtn.hidden = TRUE;
    menosBtn.hidden = TRUE;
    vinetasTotalView.hidden = TRUE;
    totalLb.hidden = TRUE;
    coffeeTypeSelectedView.hidden = TRUE;
    comprarPaqueteBtn.hidden = TRUE;
    comprarPaqueteView.hidden = TRUE;
    regresaPaqueteBtn.hidden = TRUE;
    pagadoView.hidden = TRUE;
    cancelarPaqueteBtn.hidden = TRUE;
    cancelarPaqueteView.hidden = TRUE;
    precioPagadoLb.hidden = TRUE;
    cambioView.hidden = TRUE;
    despachandoLb.hidden = TRUE;
    
    //Testing labels
    pruebaLb.hidden = TRUE;        //Cambiar esto
    pruebaLb2.hidden = TRUE;
    
    NSString *pathVariety = [[NSBundle mainBundle] pathForResource:@"productosVariety" ofType:@"plist"];
    NSDictionary *dict1 = [[NSDictionary alloc] initWithContentsOfFile:pathVariety];
    productosVariety = [dict1 objectForKey:@"productosVariety"];
    
    //Initializing arrays
    cantidades = [[NSMutableArray alloc] initWithCapacity:productosVariety.count];
    for (int i = 0; i<productosVariety.count; i++) {
        cantidades[i] = @0;
    }
    
    //Initializing productosAct
    productosActuales = [NSMutableArray arrayWithObjects:@"0", @"1", @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", @"11", @"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19", @"20", @"21", @"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30", @"31", @"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39", nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arreglo = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
    productosAct  =[NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];         //Tiene 41
    
    if ([arreglo count] <40)
        [defaults setObject:productosActuales forKey:@"productosAct"];
    
    arreglo = [NSMutableArray arrayWithArray:[defaults objectForKey:@"lotesAct"]];
    if ([arreglo count] <40)
        [defaults setObject:productosActuales forKey:@"lotesAct"];
    
    arreglo = [NSMutableArray arrayWithArray:[defaults objectForKey:@"fechasAct"]];
    if ([arreglo count] <40)
        [defaults setObject:productosActuales forKey:@"fechasAct"];
    
    arreglo = [NSMutableArray arrayWithArray:[defaults objectForKey:@"existenciasAct"]];
    if ([arreglo count] <40)
        [defaults setObject:productosActuales forKey:@"existenciasAct"];
    
    finalPurchaseArray = [[NSMutableArray alloc] initWithCapacity:productosAct.count];
    existenciasArray   = [[NSMutableArray alloc] initWithCapacity:productosAct.count];
    
    //Filling existenciasArray all to 10 and finalPurchaseArray all to 0
    existenciasArray  = [NSMutableArray arrayWithArray:[defaults objectForKey:@"existenciasAct"]];
    
    for (int i = 0; i<productosAct.count; i++) {
        //existenciasArray[i] = @10;                   //Cambiar a 10 o leer del defaults
        finalPurchaseArray[i] = @0;
    }
    
    //[defaults setObject:existenciasArray forKey:@"existenciasAct"];
    
    
    existenciasArrayTemp   = [[NSMutableArray alloc] initWithCapacity:productosAct.count];
    for(int i=0; i<existenciasArray.count; i++)
        existenciasArrayTemp[i] = existenciasArray[i];
    
    
    currentViewFlag = -1;
    self.seleccionaView.hidden = TRUE;
    self.moradoView.hidden = TRUE;
    self.variedadesView.hidden = TRUE;
    

    //Fase 1
    self.comprar.hidden = TRUE;
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.detenerVid.hidden = TRUE;
    self.seleccionaLb.hidden = TRUE;
    self.textoRecib.hidden = TRUE;
    self.ingresar.hidden = TRUE;
    self.vaciarBtn.hidden = TRUE;
    self.enviarReporteBtn.hidden = TRUE;
    self.llenarTanqueBtn.hidden = TRUE;
    self.op1.hidden = TRUE;
    
    self.variedadesView.hidden = TRUE;
    self.descripcionView.hidden = TRUE;
    self.comprarView.hidden = TRUE;
    self.menuView.hidden = TRUE;
    self.menuBtn.hidden = TRUE;
    
    [self hideAllCoffeeBtns];
    
    //Fase 2
    self.pasosView.hidden = TRUE;
    self.plecaView.hidden = TRUE;
    self.flechaDerBtn.hidden = TRUE;
    self.flechaIzqBtn.hidden = TRUE;
    //Setting Fondo Init View to hidden
    self.fondoInitView.hidden = TRUE;
    self.inicializaLb.hidden = TRUE;
    self.despachandoLb.hidden = TRUE;
    self.doNothing.hidden = TRUE;
    self.doNothing.titleLabel.text = @"";
    //Assure app is always running
    [[UIApplication sharedApplication] setIdleTimerDisabled:TRUE];
    sendiPadDisconnected = FALSE;
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    //pruebaLb.hidden = FALSE;
    
    coffeeNameBuyedArray = [[NSMutableArray alloc] initWithCapacity:0];
    coffeePriceBuyedArray = [[NSMutableArray alloc] initWithCapacity:0];
    dateBuyedArray = [[NSMutableArray alloc] initWithCapacity:0];
    lotesArray = [[NSMutableArray alloc] initWithCapacity:0];
    fechasArray = [[NSMutableArray alloc] initWithCapacity:0];
    //Getting Arrays From Defaults
    [self getArraysFromDefaults];
}

- (IBAction)loadPreparaBebida:(id)sender {
    
    currentViewFlag = 0;
    
    //Fase 3
    [self hidePreparaPaquete];
    NSString *url = [[NSBundle mainBundle] pathForResource:@"NESCAFE" ofType:@"mp4"];
    
    _moviePlayer =
    [[MPMoviePlayerController alloc]
     initWithContentURL:[NSURL fileURLWithPath:url]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelerationData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    
    self.op1 = [[UIImageView alloc] initWithFrame:CGRectMake(60, 600, 240, 240)];
    [self.view addSubview:self.op1];
    
    self.comprar.hidden = TRUE;
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.detenerVid.hidden = TRUE;
    
    self.seleccionaLb.hidden = FALSE;
    self.seleccionaView.hidden = FALSE;
    self.moradoView.hidden = FALSE;
    self.regresaPaqueteBtn.hidden = FALSE;
    
    self.textoRecib.hidden = TRUE;
    self.ingresar.hidden = TRUE;
    self.vaciarBtn.hidden = TRUE;
    self.llenarTanqueBtn.hidden = TRUE;
    self.enviarReporteBtn.hidden = TRUE;
    self.op1.hidden = TRUE;
    
    self.variedadesView.hidden = FALSE;
    self.variedadesView.alpha = 0.25;
    self.descripcionView.hidden = TRUE;
    self.comprarView.hidden = TRUE;
    self.menuView.hidden = TRUE;
    self.menuBtn.hidden = TRUE;
    
    self.americanoBtn.hidden = TRUE;
    self.aromaBtn.hidden = TRUE;
    self.aromaIntensoBtn.hidden = TRUE;
    self.cafeAuLaitBtn.hidden = TRUE;
    self.cappuccinoBtn.hidden = TRUE;
    self.cappuccinnoIceBtn.hidden = TRUE;
    self.cappuccinoSkinnyBtn.hidden = TRUE;
    self.chaiTeaLatteBtn.hidden = TRUE;
    self.chococaramelBtn.hidden = TRUE;
    self.chococinoBtn.hidden = TRUE;
    self.espressoBtn.hidden = TRUE;
    self.espressoBaristaBtn.hidden = TRUE;
    self.espressoCortadoBtn.hidden = TRUE;
    self.espressoDecafBtn.hidden = TRUE;
    self.espressoIntensoBtn.hidden = TRUE;
    self.latteCaramelBtn.hidden = TRUE;
    self.latteMacchiatoBtn.hidden = TRUE;
    self.latteVanillaBtn.hidden = TRUE;
    self.lungoBtn.hidden = TRUE;
    self.lungoDecafBtn.hidden = TRUE;
    self.lungoIntensoBtn.hidden = TRUE;
    self.marrakeshBtn.hidden = TRUE;
    self.ristrettoBtn.hidden = TRUE;
    
    //Fase 2
    self.pasosView.hidden = TRUE;
    self.plecaView.hidden = TRUE;
    self.flechaDerBtn.hidden = TRUE;
    self.flechaIzqBtn.hidden = TRUE;
    //Setting Fondo Init View to hidden
    self.fondoInitView.hidden = TRUE;
    self.inicializaLb.hidden = TRUE;
    self.despachandoLb.hidden = TRUE;
    //coffeeNameBuyedArray = [[NSMutableArray alloc] initWithCapacity:0];
    //coffeePriceBuyedArray = [[NSMutableArray alloc] initWithCapacity:0];
    //dateBuyedArray = [[NSMutableArray alloc] initWithCapacity:0];
    //lotesArray = [[NSMutableArray alloc] initWithCapacity:0];
    //fechasArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.doNothing.hidden = TRUE;
    self.doNothing.titleLabel.text = @"";
    //Assure app is always running
    //[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    sendiPadDisconnected = FALSE;
    //pruebaLb.hidden = FALSE;
    
    
    NSMutableArray *productos = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
    
    imagenes = [[NSMutableArray alloc] initWithCapacity:productos.count];
    nombres = [[NSMutableArray alloc] initWithCapacity:productos.count];
    precios = [[NSMutableArray alloc] initWithCapacity:productos.count];
    posiciones = [[NSMutableArray alloc] initWithCapacity:productos.count];
    slots = [[NSMutableArray alloc] initWithCapacity:productos.count];
    volumen = imagenes = [[NSMutableArray alloc] initWithCapacity:productos.count];
    
    for (int i = 0; i < productos.count; i++) {
        
        NSString *producto = productos[i];
        
        //if(existenciaProducto > 0){
            if ([producto  isEqual: @"Lungo Intenso"]) {
                imagenes[i] = @"lungo intenso 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 132];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.lungoIntensoBtn.hidden = FALSE;
                else
                     self.lungoIntensoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Espresso Intenso"]) {
                imagenes[i] = @"espresso intenso 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 66];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.espressoIntensoBtn.hidden = FALSE;
                else
                    self.espressoIntensoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Latte Macchiato Caramel"]) {
                imagenes[i] = @"latte macchiato caramel 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.latteCaramelBtn.hidden = FALSE;
                else
                    self.latteCaramelBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Lungo"]) {
                imagenes[i] = @"lungo 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 132];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.lungoBtn.hidden = FALSE;
                else
                    self.lungoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Latte Macchiato"]) {
                imagenes[i] = @"latte macchiato 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.latteMacchiatoBtn.hidden = FALSE;
                else
                    self.latteMacchiatoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Cappuccino Skinny"]) {
                imagenes[i] = @"cappuccino skinny 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.cappuccinoSkinnyBtn.hidden = FALSE;
                else
                    self.cappuccinoSkinnyBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Espresso Barista"]) {
                imagenes[i] = @"espresso barista 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 33];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.espressoBaristaBtn.hidden = FALSE;
                else
                    self.espressoBaristaBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Chai Tea Latte"]) {
                imagenes[i] = @"tea latte 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 198];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.chaiTeaLatteBtn.hidden = FALSE;
                else
                    self.chaiTeaLatteBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Marrakesh Style Tea"]) {
                imagenes[i] = @"marrakesh style tea 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 198];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.marrakeshBtn.hidden = FALSE;
                else
                    self.marrakeshBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Latte Macchiato Vanilla"]) {
                imagenes[i] = @"latte macchiato vanilla 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.latteVanillaBtn.hidden = FALSE;
                else
                    self.latteVanillaBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Cappuccino"]) {
                imagenes[i] = @"cappuccino 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.cappuccinoBtn.hidden = FALSE;
                else
                    self.cappuccinoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Lungo Decaffeinato"]) {
                imagenes[i] = @"lungo decaffeinato 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 132];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.lungoDecafBtn.hidden = FALSE;
                else
                    self.lungoDecafBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Espresso Decaffeinato"]) {
                imagenes[i] = @"espresso decaffeinato 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 66];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.espressoDecafBtn.hidden = FALSE;
                else
                    self.espressoDecafBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Chococino"]) {
                imagenes[i] = @"chococino 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 198];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.chococinoBtn.hidden = FALSE;
                else
                    self.chococinoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Espresso"]) {
                imagenes[i] = @"espresso 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 66];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.espressoBtn.hidden = FALSE;
                else
                    self.espressoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Espresso Ristretto"]) {
                imagenes[i] = @"espresso ristretto 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 66];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.ristrettoBtn.hidden = FALSE;
                else
                    self.ristrettoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Choco Caramel"]) {
                imagenes[i] = @"choco caramel 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 198];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.chococaramelBtn.hidden = FALSE;
                else
                    self.chococaramelBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Cortado"]) {
                imagenes[i] = @"cortado 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 99];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.espressoCortadoBtn.hidden = FALSE;
                else
                    self.espressoCortadoBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Cappuccino Ice"]) {
                imagenes[i] = @"mocha 2 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"1";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.cappuccinnoIceBtn.hidden = FALSE;
                else
                    self.cappuccinnoIceBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Grande Aroma"]) {
                imagenes[i] = @"grande aroma 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 99];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.aromaBtn.hidden = FALSE;
                else
                   self.aromaBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Grande Intenso"]) {
                imagenes[i] = @"grande intenso 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 99];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.aromaIntensoBtn.hidden = FALSE;
                else
                     self.aromaIntensoBtn.hidden = TRUE;
                    
            }
            else if ([producto  isEqual: @"Cafe Au Lait"]) {
                imagenes[i] = @"cafe au lait 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 99];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.cafeAuLaitBtn.hidden = FALSE;
                else
                    self.cafeAuLaitBtn.hidden = TRUE;
            }
            else if ([producto  isEqual: @"Americano"]) {
                imagenes[i] = @"americano 1 Erick.png";
                nombres[i] = producto;
                precios[i] = @"20.00";
                posiciones[i] = [NSString stringWithFormat:@"P%.2d", i];
                volumen[i] = [NSNumber numberWithInt: 231];
                slots[i] = @"0";
                if([self isCoffeeAvailableAnywhere : producto])
                    self.americanoBtn.hidden = FALSE;
                else
                    self.americanoBtn.hidden = TRUE;
            }
       // }
    }
    
    NSNumber *slotDefault = [defaults objectForKey:@"slotD"];
    
    //self.carousel.scrollOffset = [slotDefault doubleValue];
}

- (IBAction)loadPreparaPaquete:(id)sender{
    
    currentViewFlag = 1;
    
    self.precioPagadoLb.text = @"";
    
    //Refreshing table
    for (int i = 0; i<productosVariety.count; i++) {
        cantidades[i] = @0;
        finalPurchaseArray[i]= @0;
        [tablaVariety reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
    totalPaquetes = 0;
    totalLb.text = [NSString stringWithFormat:@"%d", totalPaquetes];
    //pruebaLb2.text = @"";
    //pruebaLb2.hidden = FALSE;
    
    //Hide views
    [self hideInitMain];
    [self hideAllCoffeeBtns];
    
    //Hide more views
    regresaPaqueteBtn.hidden = TRUE;
    moradoView.hidden = TRUE;
    seleccionaView.hidden = TRUE;
    variedadesView.hidden = TRUE;
    
    //Loading views
    storePlecaView.hidden = FALSE;
    regresaBebidaView.hidden = FALSE;
    regresaBebidaBtn.hidden = FALSE;
    tablaVariety.hidden = FALSE;
    botonesView.hidden = FALSE;
    masBtn.hidden = FALSE;
    menosBtn.hidden = FALSE;
    vinetasTotalView.hidden = FALSE;
    totalLb.hidden = FALSE;
    coffeeTypeSelectedView.hidden = FALSE;
    comprarPaqueteBtn.hidden = FALSE;
    comprarPaqueteView.hidden = FALSE;
    pagadoView.hidden = TRUE;
    precioPagadoLb.hidden = TRUE;
    cancelarPaqueteBtn.hidden = TRUE;
    cancelarPaqueteView.hidden = TRUE;
    cambioView.hidden = TRUE;
}

- (void) hidePreparaPaquete{
    [self hideInitMain];
    regresaBebidaView.hidden = TRUE;
    regresaBebidaBtn.hidden = TRUE;
    tablaVariety.hidden = TRUE;
    botonesView.hidden = TRUE;
    masBtn.hidden = TRUE;
    menosBtn.hidden = TRUE;
    vinetasTotalView.hidden = TRUE;
    totalLb.hidden = TRUE;
    coffeeTypeSelectedView.hidden = TRUE;
    comprarPaqueteBtn.hidden = TRUE;
    pagadoView.hidden = TRUE;
    precioPagadoLb.hidden = TRUE;
    comprarPaqueteView.hidden = TRUE;
    pruebaLb2.hidden = TRUE;
    cancelarPaqueteBtn.hidden = TRUE;
    cancelarPaqueteView.hidden = TRUE;
    cambioView.hidden = TRUE;
}
-(void) hidePreparaPaqueteView{
    regresaBebidaView.hidden = TRUE;
    regresaBebidaBtn.hidden = TRUE;
    tablaVariety.hidden = TRUE;
    botonesView.hidden = TRUE;
    masBtn.hidden = TRUE;
    menosBtn.hidden = TRUE;
    vinetasTotalView.hidden = TRUE;
    totalLb.hidden = TRUE;
    coffeeTypeSelectedView.hidden = TRUE;
    comprarPaqueteBtn.hidden = TRUE;
    comprarPaqueteView.hidden = TRUE;
    pagadoView.hidden = TRUE;
    precioPagadoLb.hidden = TRUE;
    cancelarPaqueteBtn.hidden = TRUE;
    cancelarPaqueteView.hidden = TRUE;
    cambioView.hidden = TRUE;
}
-(void) hideInitMain{
    preparaBebidaBtn.hidden = TRUE;
    preparaBebidaView.hidden = TRUE;
    preparaPaqueteBtn.hidden = TRUE;
    preparaPaqueteView.hidden = TRUE;
    storePlecaView.hidden = TRUE;
}
-(void) showInitMain {
    preparaBebidaBtn.hidden = FALSE;
    preparaBebidaView.hidden = FALSE;
    preparaPaqueteBtn.hidden = FALSE;
    preparaPaqueteView.hidden = FALSE;
    storePlecaView.hidden = FALSE;
    despachandoLb.hidden = FALSE;
    [self hidePreparaPaqueteView];
    [self hidePreparaBebidaView];    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [productosVariety count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
    }
    
    NSString *pname =[productosVariety objectAtIndex:indexPath.row];
    cell.textLabel.text = [productosVariety objectAtIndex:indexPath.row];
    
    //Check existenciasArray
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ / %d", [cantidades objectAtIndex:indexPath.row],
                                                                       [self getProductQtyAvailable:pname]];
    
    return cell;
}

-(int) getProductQtyAvailable:(NSString *) productName{
    
    int qty = 0;
    
    for(int rowAvailable=0; rowAvailable < productosAct.count; rowAvailable++){
        NSString *productAvailableName = [productosAct objectAtIndex:rowAvailable];
        
        if([productName  isEqual: productAvailableName]){
            qty = qty + [[existenciasArray objectAtIndex:rowAvailable] intValue];
        }
    }
    
    return qty;
}

- (IBAction)masBtn:(id)sender{
    
    //int total = [self getTotal];
    int currentCantidad = [[cantidades objectAtIndex:fila] intValue];
    
    NSString *selecVariety = [productosVariety objectAtIndex:fila];
    int availableCantidad = [self getProductQtyAvailable:selecVariety];
    
    if(totalPaquetes < numeroCapsulasPorPaquete && currentCantidad >= 0 && currentCantidad < availableCantidad){
        
        CoffeeType *coffee = [[CoffeeType alloc] initWithName:selecVariety];
        
        if(coffee.steps == 16){
            currentCantidad++;
            cantidades[fila] = [NSNumber numberWithInt:currentCantidad];
            totalPaquetes++;
        }
        else if(coffee.steps == 26 && totalPaquetes<47){
            currentCantidad++;
            cantidades[fila] = [NSNumber numberWithInt:currentCantidad];
            totalPaquetes+=2;
        }

        //actualizamos la tabla
        [tablaVariety reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:fila inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        //mantenemos seleccionada la celda
        [tablaVariety selectRowAtIndexPath:[NSIndexPath indexPathForRow:fila inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        totalLb.text = [NSString stringWithFormat:@"%d", totalPaquetes];
    }
}
- (IBAction)menosBtn:(id)sender{
    
    //int total = [self getTotal];
    int currentCantidad = [[cantidades objectAtIndex:fila] intValue];
    
    if(totalPaquetes > 0 && currentCantidad > 0 ){
        
        NSString *selecVariety = [productosVariety objectAtIndex:fila];
        CoffeeType *coffee = [[CoffeeType alloc] initWithName:selecVariety];
        
        if(coffee.steps == 16){
            currentCantidad--;
            cantidades[fila] = [NSNumber numberWithInt:currentCantidad];
            totalPaquetes--;
        }
        else if(coffee.steps == 26){
            currentCantidad--;
            cantidades[fila] = [NSNumber numberWithInt:currentCantidad];
            totalPaquetes-=2;
        }
        
        //actualizamos la tabla
        [tablaVariety reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:fila inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        //mantenemos seleccionada la celda
        [tablaVariety selectRowAtIndexPath:[NSIndexPath indexPathForRow:fila inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    
        totalLb.text = [NSString stringWithFormat:@"%d", totalPaquetes];
    }
}

- (IBAction)comprarPaqueteBtnAction:(id)sender{
    
    int productNeededQty = 0;
    int productAvailableQty = 0;
    pruebaLb.text = @"";
    //pruebaLb.hidden = FALSE;
    pruebaLb2.text = @"";
    int productNeededQtyInit = 0;
    
    //existenciasArray tiene el tamaño del numero de carriles y se inicializa con las existenciasArray
    existenciasArrayTemp = [[NSMutableArray alloc] initWithCapacity:productosAct.count];
    for(int i=0; i<existenciasArray.count; i++)
        existenciasArrayTemp[i] = existenciasArray[i];
    
    //Cleaning finalPurchaseArray
    for (int i = 0; i<productosAct.count; i++) {
        finalPurchaseArray[i] = @0;
    }
    
    //Validating 32 or 48 package
    if(totalPaquetes == numeroCapsulasPorPaquete){
        
        if([self canDispatch]){
        
            //Validating Needed Products table (order to dispatch)
            for(int rowNeeded=0; rowNeeded < productosVariety.count; rowNeeded++){
            
                NSString *productNeededName = [productosVariety objectAtIndex:rowNeeded];
                productNeededQty = [[cantidades objectAtIndex:rowNeeded] intValue];
                productNeededQtyInit = productNeededQty;
            
                //If product needed quantity is greater than 0
                if(productNeededQty > 0){
                    
                    //Looking row per row (carril por carril)
                    for(int rowAvailable=0; rowAvailable < productosAct.count; rowAvailable++){
                    
                        NSString *productAvailableName = [productosAct objectAtIndex:rowAvailable];
                        
                        if([productNeededName  isEqual: productAvailableName]){
                            productAvailableQty = [[existenciasArrayTemp objectAtIndex:rowAvailable] intValue];
                        
                            //If current slot can dispatch
                            if(productNeededQty <= productAvailableQty && productNeededQty > 0){
                                finalPurchaseArray[rowAvailable] = [NSNumber numberWithInt:productNeededQty];
                                existenciasArrayTemp[rowAvailable] = [NSNumber numberWithInt:(productAvailableQty - productNeededQty)];
                            
                                productNeededQty = 0;
                                
                                //Updating buy arrays
                                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                                CoffeeType *coffee = [[CoffeeType alloc] initWithName:productAvailableName];
                                CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
                                NSString *now = [NSString stringWithFormat:@"%02d.%02d.%02d %02d:%02d:%02.0f", currentDate.day, currentDate.month, currentDate.year, currentDate.hour, currentDate.minute, currentDate.second];
                                
                                [coffeeNameBuyedArray addObject:coffee.name];
                                
                                //Updating price in report per productNeededQtyInit
                                float finalPrice = productNeededQtyInit*coffee.price;
                                [coffeePriceBuyedArray addObject:[NSNumber numberWithFloat:finalPrice]];
                                
                                [dateBuyedArray addObject:now];
                                 NSMutableArray *lotesAct = [NSMutableArray arrayWithArray:[defaults objectForKey:@"lotesAct"]];
                                 NSMutableArray *fechasCadAct = [NSMutableArray arrayWithArray:[defaults objectForKey:@"fechasAct"]];
                                [lotesArray addObject: [lotesAct objectAtIndex:[self getProductVarietySlotFromName:coffee.name]]];
                                [fechasArray addObject: [fechasCadAct objectAtIndex:[self getProductVarietySlotFromName:coffee.name]]];
                            }
                            //If current slot can not dispatch
                            else{
                                
                                //If need more than available and productAvailableQty > 0 and need more than 0  antes estaba !=
                                if(productAvailableQty > 0 && productNeededQty > 0){
                                    finalPurchaseArray[rowAvailable] = existenciasArrayTemp[rowAvailable];
                                    existenciasArrayTemp[rowAvailable] = [NSNumber numberWithInt:0];
                                    productNeededQty = productNeededQty - productAvailableQty;
                                }
                                else if(productAvailableQty == 0 || productAvailableQty < 0){
                                    finalPurchaseArray[rowAvailable] = [NSNumber numberWithInt:0];
                                }
                            }
                        }
                    }
                }
            }
            
            pruebaLb.text = @"Dispatch:";
            
            NSString *superResult =[self createFinalOrderString:totalPaquetes :finalPurchaseArray];
            
            //Create final string
            pruebaLb.text = [NSString stringWithFormat: @"%@ / FPA = %@", pruebaLb.text, [self printArray:finalPurchaseArray]];
            pruebaLb2.text = [NSString stringWithFormat: @"ex antes :%@ -- %lu", [self printArray:existenciasArray], (unsigned long)existenciasArray.count];
            
            //pruebaLb.hidden = FALSE;
            //pruebaLb2.hidden = FALSE;
            [manager writeString:superResult];
            
            assureCurrentView = 1;
            
            //Setting subview
            precioPagadoLb.hidden = FALSE;
            pagadoView.hidden = FALSE;
            cancelarPaqueteBtn.hidden = FALSE;
            cancelarPaqueteView.hidden = FALSE;
            comprarPaqueteView.hidden = TRUE;
            comprarPaqueteBtn.hidden = TRUE;
            
            //pruebaLb.text = superResult;
        }
        else{
            NSMutableString *alertTitle =  [[NSMutableString alloc] initWithString:@""];
            NSMutableString *alertSubject = [self getCantDispatch];
            [alertTitle appendFormat:@"No hay suficiente disponibilidad de: %@. Intenta de nuevo", alertSubject];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertTitle message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
            pruebaLb.text = @"Can not dispatch";
        }
    }
    else{
        NSMutableString *alertSubject =  [[NSMutableString alloc] initWithString:@""];
        [alertSubject appendFormat:@"Selecciona %d cápsulas Llevas %d cápsulas", numeroCapsulasPorPaquete, totalPaquetes];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertSubject message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        //pruebaLb.text = @"Need 32";
    }

}

-(NSString*) createFinalOrderString : (int) pacType : (NSMutableArray*) finalPurchaseArray{
    NSString *result = @"V";
    NSString *packageType = @"";
    NSString *finalPrecio = @"";
    NSString *finalArray = @"";
    
    //Si es de 32 o 48 mando el 0
    if(pacType == numeroCapsulasPorPaquete){
        packageType = @"0";
        finalPrecio = @"02470";
        //finalPrecio = @"03700";
        
    }
    //Si es de 48
    /*
    else{
        packageType = @"1";
        finalPrecio = @"03700";
    }
    */
    
    
    finalArray = [self printArray:finalPurchaseArray];
    
    result = [NSString stringWithFormat: @"%@%@%@%@", result, packageType, finalPrecio, finalArray];
    
    return result;
}

-(BOOL)canDispatch{
    
    int productNeededQty = 0;
    int productAvailableQty = 0;
    NSMutableArray *canDispatchArray = [[NSMutableArray alloc] initWithCapacity:productosVariety.count];
    
    for(int rowNeeded=0; rowNeeded < productosVariety.count; rowNeeded++){
        NSString *productNeededName = [productosVariety objectAtIndex:rowNeeded];
        productNeededQty = [[cantidades objectAtIndex:rowNeeded] intValue];
        BOOL canRow = FALSE;
        
        if(productNeededQty > 0){
            for(int rowAvailable=0; rowAvailable < productosAct.count; rowAvailable++){
                NSString *productAvailableName = [productosAct objectAtIndex:rowAvailable];
                
                if([productNeededName  isEqual: productAvailableName]){
                    productAvailableQty = [[existenciasArray objectAtIndex:rowAvailable] intValue];
                    
                    //If current slot can dispatch
                    if(productNeededQty <= productAvailableQty && productNeededQty != 0){
                        productNeededQty = 0;
                        canRow = TRUE;
                    }
                    //If current slot can not dispatch
                    else{
                        if(productAvailableQty!=0 && productNeededQty != 0){
                            productNeededQty = productNeededQty - productAvailableQty;
                        }
                    }
                }
            }
        }
        else{
            canRow = TRUE;
        }
        
        canDispatchArray[rowNeeded] = [NSNumber numberWithBool:canRow];
    }
    
    //Reading all booleans
    for(int i=0; i<canDispatchArray.count; i++){
        if([[canDispatchArray objectAtIndex:i] boolValue] == FALSE)
            return FALSE;
    }
    return TRUE;
}
-(NSMutableString*) getCantDispatch{
    int productNeededQty = 0;
    int productAvailableQty = 0;
    NSMutableArray *canDispatchArray = [[NSMutableArray alloc] initWithCapacity:productosVariety.count];
    NSMutableString *cantDispatch = [[NSMutableString alloc] initWithString:@""];
    NSMutableArray *currentCantDispatchArray= [[NSMutableArray alloc] initWithCapacity:productosVariety.count];
    
    for(int rowNeeded=0; rowNeeded < productosVariety.count; rowNeeded++){
        NSString *productNeededName = [productosVariety objectAtIndex:rowNeeded];
        productNeededQty = [[cantidades objectAtIndex:rowNeeded] intValue];
        BOOL canRow = FALSE;
        
        if(productNeededQty > 0){
            for(int rowAvailable=0; rowAvailable < productosAct.count; rowAvailable++){
                NSString *productAvailableName = [productosAct objectAtIndex:rowAvailable];
                
                if([productNeededName  isEqual: productAvailableName]){
                    productAvailableQty = [[existenciasArray objectAtIndex:rowAvailable] intValue];
                    
                    //If current slot can dispatch
                    if(productNeededQty <= productAvailableQty && productNeededQty != 0){
                        productNeededQty = 0;
                        canRow = TRUE;
                    }
                    //If current slot can not dispatch
                    else{
                        if(productAvailableQty!=0 && productNeededQty != 0){
                            productNeededQty = productNeededQty - productAvailableQty;
                        }
                    }
                }
            }
        }
        else{
            canRow = TRUE;
        }
        
        canDispatchArray[rowNeeded] = [NSNumber numberWithBool:canRow];
    }
    
    int rowValue = 0;
    
    //Reading all booleans
    for(int i=0; i<canDispatchArray.count; i++){
        
        if([[canDispatchArray objectAtIndex:i] boolValue] == FALSE){
            
            if(![self isNameInArray:[productosVariety objectAtIndex:i] : currentCantDispatchArray]){
                
                
                if([cantDispatch isEqual: @""]){
                    [cantDispatch appendFormat:@"%@", [productosVariety objectAtIndex:i]];
                }
                else{
                    [cantDispatch appendFormat:@", %@", [productosVariety objectAtIndex:i]];
                }
                
                currentCantDispatchArray[rowValue] = [productosVariety objectAtIndex:i];
                rowValue++;
            }
            
        }
    }
    return cantDispatch;
}

-(BOOL) isNameInArray:(NSString*) name : (NSMutableArray*) array{
    for(int i=0; i<array.count; i++){
        if([name isEqualToString: array[i]])
            return TRUE;
    }
    return FALSE;
        
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    fila = indexPath.row;
    
    NSString *selecVariety = [productosVariety objectAtIndex:fila];
    
    if ([selecVariety  isEqual: @"Lungo Intenso"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"LUNGO INTENSO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Espresso Intenso"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"ESPRESSO-INTENSO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Latte Macchiato Caramel"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"LATTE-MACCHIATO-CARAMEL.png"];
        
    }
    else if ([selecVariety  isEqual: @"Lungo"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"LUNGO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Latte Macchiato"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"LATTE-MACCHIATO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Cappuccino Skinny"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CAPPUCCINO-LIGHT.png"];
        
    }
    else if ([selecVariety  isEqual: @"Espresso Barista"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"ESPRESSO-BARISTA-OK.png"];
        
    }
    else if ([selecVariety  isEqual: @"Chai Tea Latte"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"LATTE-TE-CHAI.png"];
        
    }
    else if ([selecVariety  isEqual: @"Marrakesh Style Tea"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"MARRAKESH-STYLE-TEA-OK.png"];
        
    }
    else if ([selecVariety  isEqual: @"Latte Macchiato Vanilla"]) {
        coffeeTypeSelectedView.image =  [UIImage imageNamed:@"VAINILLA-LATTE-MACHIATTO-CAFE.png"];
        
    }
    else if ([selecVariety  isEqual: @"Cappuccino"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CAPPUCCINO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Lungo Decaffeinato"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"LUNGO DECAFFEINATO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Espresso Decaffeinato"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"ESPRESSO-DECAF.png"];
        
    }
    else if ([selecVariety  isEqual: @"Chococino"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CHOCOCINO.png"];
        
    }
    else if ([selecVariety isEqual: @"Espresso"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"ESPRESSO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Espresso Ristretto"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"RISTRETTO-ARDENZA.png"];
        
    }
    else if ([selecVariety  isEqual: @"Choco Caramel"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CHOCOCARAMEL.png"];
        
    }
    else if ([selecVariety  isEqual: @"Cortado"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CORTADO.png"];
        
    }
    /*else if ([selecVariety  isEqual: @"Mocha"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"mocha 2 Erick.png"];
        
    }*/
    else if ([selecVariety  isEqual: @"Grande Aroma"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"AROMA.png"];
        
    }
    else if ([selecVariety  isEqual: @"Grande Intenso"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"GRANDE_INTENSO.png"];
        
    }
    else if ([selecVariety isEqual: @"Cafe Au Lait"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CAFE-AU-LAIT.png"];
        
    }
    else if ([selecVariety  isEqual: @"Americano"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"AMERICANO.png"];
        
    }
    else if ([selecVariety  isEqual: @"Cappuccino Ice"]) {
        coffeeTypeSelectedView.image = [UIImage imageNamed:@"CAPPUCCINO-ICE.png"];
        
    }
    else{

    }
}

- (IBAction)cancelarPaqueteBtn:(id)sender {
    [manager writeString:@"D"];
    [self loadPreparaPaquete:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (void)dealloc {
    //if (manager) [manager release];
    //[super dealloc];
}

- (void)hola{
    self.priceLB.text = (cableState == kCableConnected) ? @"Connected" : @"Not Connected";
    
}

-(void)enviarMensaje: (int)mensaje{
    Emailer *mailer = [[Emailer alloc] init];
    
    if(mensaje == 4){
        //Refreshing arrays from defaults
        [self getArraysFromDefaults];
        [mailer setArrays: coffeeNameBuyedArray : coffeePriceBuyedArray : dateBuyedArray : lotesArray : fechasArray];
    }
    else if(mensaje == 99){
        //[mailer setData:dataToTest];
    }
    
    SKPSMTPMessage *mail = [mailer prepareEmail: mensaje : faltantes];
    mail.delegate = self;
    self.pruebaLb.text = mail.subject;
    
    if(test_for_simulator == 0)
        [mail send];
    
    if(mensaje == 4){
        [coffeeNameBuyedArray removeAllObjects];
        [coffeePriceBuyedArray removeAllObjects];
        [dateBuyedArray removeAllObjects];
        [lotesArray removeAllObjects];
        [fechasArray removeAllObjects];
        //[self cleanDefaultArrays];
    }
    
}

-(void) writeLogAtHour{
    
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    
    if((currentDate.hour == hourToSendReport) && !sendReport){
        //Send Report Code
        [self enviarMensaje: 4];
        
        //Setting Flag
        sendReport = TRUE;
    }
    else if(currentDate.hour == 0 && sendReport){
        sendReport = FALSE;
        [self cleanDefaultArrays];
    }
}

- (void) cableConnected:(NSString *)protocol
{
    NSLog(@"Cable Connected:%@",protocol);
    
    cableState = kCableConnected;
    
    [manager open];
    self.priceLB.text = (cableState == kCableConnected) ? @"Connected" : @"Not Connected";
    pruebaLb.text = protocol;
}


- (void) cableDisconnected
{
    NSLog(@"Cable Disconnected");
    
    cableState = kCableNotConnected;
    passRequired = NO;
    
    loopbackTestRunning = NO;
    loopContinous = NO;
    rxEcho = NO;
    rxCount = 0;
    txCount = 0;
    errCount = 0;
    
    //[ViewController reset];
    self.priceLB.text = (cableState == kCableConnected) ? @"Connected" : @"Not Connected";
    
}


- (void) portStatusChanged
{
}


- (void) readBytesAvailable:(UInt32)numBytes
{
    int bytesRead;
    
    // Read the data out
    bytesRead = [manager read:(rxLoopBuff) length:numBytes];
    //rxCount += bytesRead;
    
    NSString *s = [[NSString alloc] initWithBytes:rxLoopBuff length:bytesRead encoding: NSUTF8StringEncoding];
    NSMutableString *s1 = [[NSMutableString alloc] initWithString:self.textoRecib.text];
    
    [s1 appendString:s];
    
    //limit to 3000 bytes in the Rx window

    self.textoRecib.text = s1;
    
    NSString *string = s1;
    
    if ([string containsString:@"F"])
    {
        if ([string containsString:@"$"])//dinero acumulado
        {
            if(currentViewFlag == 0){
                NSArray *acumArray = [string componentsSeparatedByString: @"F"];
                NSString *acum = [acumArray objectAtIndex:0];
                self.precioLb.text = acum;
                self.ingresadoLb.text = @"INGRESADO";
            }
            else if(currentViewFlag == 1){
                NSArray *acumArray = [string componentsSeparatedByString: @"F"];
                NSString *acum = [acumArray objectAtIndex:0];
                self.precioPagadoLb.text = acum;
                precioPagadoLb.hidden = FALSE;
                pagadoView.hidden = FALSE;
                cancelarPaqueteBtn.hidden = FALSE;
                cancelarPaqueteView.hidden = FALSE;
                comprarPaqueteView.hidden = TRUE;
                comprarPaqueteBtn.hidden = TRUE;
            }
        }
        else if ([string containsString:@"C"])//cambio
        {
            if(currentViewFlag == 0){
                NSArray *cambioArray = [string componentsSeparatedByString: @"F"];
                NSString *cambio = [cambioArray objectAtIndex:0];
                NSString *cambioN = [cambio stringByReplacingOccurrencesOfString:@"C" withString:@"$"];
            
                self.precioLb.text = cambioN;
                self.ingresadoLb.text = @"CAMBIO";
                self.cancelar.hidden = TRUE;
            }
            else if(currentViewFlag == 1){
                NSArray *cambioArray = [string componentsSeparatedByString: @"F"];
                NSString *cambio = [cambioArray objectAtIndex:0];
                NSString *cambioN = [cambio stringByReplacingOccurrencesOfString:@"C" withString:@"$"];
                self.precioPagadoLb.text = cambioN;
                precioPagadoLb.hidden = FALSE;
                cambioView.hidden = FALSE;
                pagadoView.hidden = TRUE;
                cancelarPaqueteBtn.hidden = TRUE;
                cancelarPaqueteView.hidden = TRUE;
                comprarPaqueteView.hidden = TRUE;
                comprarPaqueteBtn.hidden = TRUE;
                
            }
        
        }
        else if ([string containsString:@"D"])//despachando
        {
            [self hiddenMenu];
            [self hidePreparaPaquete];
            [self hidePreparaBebidaView];
            self.moradoView.hidden = TRUE;
            
            self.fondoInitView.hidden = FALSE;
            self.despachandoLb.hidden = FALSE;
            self.inicializaLb.hidden = TRUE;
        }

        else if ([string containsString:@"P"])//puerta abierta
        {
            [self enviarMensaje:0];
            
            
            //Quitando lo del llenado de la puerta
            /*
            //Filling existenciasArray all to 10 and setting existenciasAct(defaults)
            existenciasArray = [[NSMutableArray alloc] initWithCapacity:productosAct.count];
            
            for (int i = 0; i<productosAct.count; i++) {
                existenciasArray[i] = @10;
            }
            
            //Storing values from current existenciasArray to existenciasAct
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:existenciasArray forKey:@"existenciasAct"];
             */
            
        }
        else if ([string containsString:@"Z"])//puerta cerrada
        {
            [self enviarMensaje:8];
        }
        else if ([string containsString:@"R"])//reset controlador
        {
            [self enviarMensaje:9];
        }
        
        else if ([string containsString:@"S"])//status general de capsulas
        {
            //pruebaLb.hidden = FALSE;
            pruebaLb.text = string;
            NSArray *statusArray = [string componentsSeparatedByString: @"F"];
            NSString *status = [statusArray objectAtIndex:0];
            status = [status stringByReplacingOccurrencesOfString:@"S" withString:@""];
            NSString *statusInd;
            
            pruebaLb.text = status;
            
            for(int i=0; i<existenciasArray.count-1; i++){
                statusInd = [status substringWithRange:NSMakeRange(i, 1)];
                
                if ([statusInd  isEqual: @"0"]){
                    existenciasArray[i] = @0;
                }
                else if([statusInd  isEqual: @"1"]){
                    existenciasArray[i] = @1;
                }
                else if ([statusInd  isEqual: @"2"]){
                    existenciasArray[i] = @2;
                }
                else if([statusInd  isEqual: @"3"]){
                    existenciasArray[i] = @3;
                }
                else if ([statusInd  isEqual: @"4"]){
                    existenciasArray[i] = @4;
                }
                else if([statusInd  isEqual: @"5"]){
                    existenciasArray[i] = @5;
                }
                else if ([statusInd  isEqual: @"6"]){
                    existenciasArray[i] = @6;
                }
                else if([statusInd  isEqual: @"7"]){
                    existenciasArray[i] = @7;
                }
                else if ([statusInd  isEqual: @"8"]){
                    existenciasArray[i] = @8;
                }
                else if([statusInd  isEqual: @"9"]){
                    existenciasArray[i] = @9;
                }
                else if ([statusInd  isEqual: @"A"]){
                    existenciasArray[i] = @10;
                }
                else if([statusInd  isEqual: @"B"]){
                    existenciasArray[i] = @11;
                }
            }
            
            pruebaLb.text = [NSString stringWithFormat:@"%@ er=%@", pruebaLb.text, [self printArray:existenciasArray]];
            
            //Storing values from current existenciasArray to existenciasAct
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:existenciasArray forKey:@"existenciasAct"];
            
            
            /*
            faltantes = [NSMutableString stringWithString:@""];
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSMutableArray *productos = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
            
            
            for (int i = 0; i < productos.count; i++) {
                
                statusInd = [status substringWithRange:NSMakeRange(i, 1)];
                
                if ([statusInd  isEqual: @"0"]){
                    
                    NSString *productBtn = productos[i];
                    UIButton *botonToHide = [self getButtonFromName:productBtn];
                    botonToHide.hidden = TRUE;
                    [faltantes appendFormat: @"%@,", productBtn];
                }
                else if([statusInd  isEqual: @"1"]){
                    
                    if(i != 0){
                        CoffeeType *cafe = [[CoffeeType alloc] initWithName:productos[i-1]];
                        
                        if(cafe.steps == 26){
                            NSString *productBtn = productos[i-1];
                            UIButton *botonToHide = [self getButtonFromName:productBtn];
                            
                            if([productos[i-1] isEqualToString:productos[i]] && botonToHide.hidden){
                                productBtn = productos[i];
                                botonToHide = [self getButtonFromName:productBtn];
                                botonToHide.hidden = TRUE;
                            }
                            else{
                                NSString *productBtn = productos[i];
                                UIButton *botonToHide = [self getButtonFromName:productBtn];
                                botonToHide.hidden = FALSE;
                            }
                        }
                        else{
                            NSString *productBtn = productos[i];
                            UIButton *botonToHide = [self getButtonFromName:productBtn];
                            botonToHide.hidden = FALSE;
                        }
                        
                    }
                    else{
                        NSString *productBtn = productos[i];
                        UIButton *botonToHide = [self getButtonFromName:productBtn];
                        botonToHide.hidden = FALSE;
                    }
                    
                }
            }
            
            finalStatus = status;
            
            if ([faltantes containsString:@","]){
                [self enviarMensaje:2];
            }
            
            self.cancelar.hidden = TRUE;
            self.precioLb.hidden = TRUE;
            self.ingresadoLb.hidden = TRUE;
            self.tipoLb.hidden = TRUE;
            self.precioListaLb.hidden = TRUE;
            self.op1.hidden = TRUE;
            self.seleccionaLb.hidden = FALSE;
            self.ingresadoLb.text = @"INGRESADO";
             */
    
        }
        else if ([string containsString:@"I"]){//inicializando
            [self hiddenMenu];
            [self hidePreparaPaquete];
            [self hidePreparaBebidaView];
            self.moradoView.hidden = TRUE;
            
            self.fondoInitView.hidden = FALSE;
            self.inicializaLb.hidden = FALSE;
            self.despachandoLb.hidden = TRUE;
        }
        else if ([string containsString:@"L"]){//regresando
            self.fondoInitView.hidden = TRUE;
            self.inicializaLb.hidden = TRUE;
            [self showInitMain];
        }
        else if ([string containsString:@"T"]){//transacción completada con éxito
            
            //Getting back views
            self.fondoInitView.hidden = TRUE;
            self.despachandoLb.hidden = TRUE;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
            
            //Esto es para la Vending
            if(currentViewFlag == 0){
                self.cancelar.hidden = TRUE;
                self.precioLb.hidden = TRUE;
                self.ingresadoLb.hidden = TRUE;
                self.ingresadoLb.text = @"INGRESADO";
                self.seleccionaLb.hidden = TRUE;
            
                //Cleaning last view
                self.descripcionView.hidden = TRUE;
            
                //Fase 2 : Code Here
                CoffeeType *coffee = [[CoffeeType alloc] initWithName:coffeeSelected];
                NSString *pasoSTR = [NSString stringWithFormat:@"PASO_1_%d.png", coffee.type];
                NSString *plecaSTR = [NSString stringWithFormat:@"MODO_PREPARACION_%d.png", coffee.type];
            
                self.pasosView.image = [UIImage imageNamed:pasoSTR];
                self.pasosView.hidden = FALSE;
                self.plecaView.image = [UIImage imageNamed:plecaSTR];
                self.plecaView.hidden = FALSE;
                
                //Fase 3 : Updating Existencias
                int existenciaQty = [[existenciasArray objectAtIndex:currentSlot] intValue];
                
                if(assureCurrentView == 0){
                    existenciasArray[currentSlot] = [NSNumber numberWithInt:existenciaQty-1];
                }
                
                //Updating existenciasAct with current existenciasArray
                [defaults setObject:existenciasArray forKey:@"existenciasAct"];
                
                //Setting menu to white
                self.menuBtn.imageView.image = [UIImage imageNamed:botonBlancoSTR];
            
                //Setting pages
                self.flechaDerBtn.hidden = FALSE;
                self.flechaIzqBtn.hidden = TRUE;
                currentStep = 1;
            
            
                //Adding sell to arrays
                NSString *now = [NSString stringWithFormat:@"%02d.%02d.%02d %02d:%02d:%02.0f", currentDate.day, currentDate.month, currentDate.year, currentDate.hour, currentDate.minute, currentDate.second];
                [coffeeNameBuyedArray addObject:coffee.name];
                [coffeePriceBuyedArray addObject:[NSNumber numberWithFloat:coffee.price]];
                [dateBuyedArray addObject:now];
                NSMutableArray *lotesAct = [NSMutableArray arrayWithArray:[defaults objectForKey:@"lotesAct"]];
                NSMutableArray *fechasCadAct = [NSMutableArray arrayWithArray:[defaults objectForKey:@"fechasAct"]];
                [lotesArray addObject: [lotesAct objectAtIndex:[self getProductVarietySlotFromName:coffee.name]]];
                [fechasArray addObject: [fechasCadAct objectAtIndex:[self getProductVarietySlotFromName:coffee.name]]];
            
                [self setDefaultsFromArrays];
            
                NSNumber *nivelAgua = [defaults valueForKey:@"nivelAguaAct"];
                nivelAgua = [NSNumber numberWithDouble:([nivelAgua doubleValue] - [volCompra doubleValue])];
            
                [defaults setValue:nivelAgua forKey:@"nivelAguaAct"];
                [defaults synchronize];
            
                if ([nivelAgua doubleValue] < 1000) {
                    [self enviarMensaje:1];
                }
            }
            
            //Mi cuenta interna ... la vamos a dejar
            else if(currentViewFlag == 1){
                for(int i=0; i<existenciasArray.count; i++){
                    existenciasArray[i] = existenciasArrayTemp[i];
                }
                
                //Updating existenciasAct with current existenciasArray
                [defaults setObject:existenciasArray forKey:@"existenciasAct"];
                [defaults synchronize];
                
                pruebaLb2.text = [NSString stringWithFormat: @"ex despues :%@ -- %lu", [self printArray:existenciasArray], (unsigned long)existenciasArray.count];
                //pruebaLb2.hidden = FALSE;
                
                [self showInitMain];
            }
        }
        self.textoRecib.text = @"";
             
    }
}


- (IBAction)cancelarBtn:(id)sender {
    
    self.preparaBebidaBtn.hidden = FALSE;
    regresaPaqueteBtn.hidden = FALSE;
    
    //[rscMgr open];
    //[manager setBaud:9600];
    [manager writeString:@"D"];
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.op1.hidden = TRUE;
    //self.seleccionaLb.hidden = FALSE;
    //self.videoBtn.hidden = FALSE;
    self.seleccionaView.hidden = FALSE;
    self.moradoView.hidden = FALSE;
    self.descripcionView.hidden = TRUE;
    self.comprarView.hidden = TRUE;
    self.variedadesView.hidden = FALSE;
    self.menuView.hidden = TRUE;
    self.menuBtn.hidden = TRUE;
    
    
    [self loadPreparaBebida:sender];
}

- (IBAction)menuBtn:(id)sender {
    if (self.cancelar.isHidden == FALSE){
        [manager writeString:@"D"];
        
    }
    
    if(![self.ingresadoLb.text isEqualToString:@"CAMBIO"])
        [self loadPreparaBebida:sender];
        //[self viewMenu];
}

- (IBAction)comprarBtn:(id)sender {
    assureCurrentView = 0;
    [manager writeString:texto];
    self.precioLb.text = @"$0.00";
    self.comprar.hidden = TRUE;
    self.videoBtn.hidden = TRUE;
    self.ingresadoLb.hidden = FALSE;
    self.precioLb.hidden = FALSE;
    self.cancelar.hidden = FALSE;
    self.ingresadoLb.text = @"INGRESADO";
    self.comprarView.hidden = TRUE;
    
}


- (IBAction)enviarBtn:(id)sender {
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    
    NSString *emailTitle = @"My Email Title";
    NSString *messageBody = @"Email Body";
    
    
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:@[]];

    [mc addAttachmentData:[NSData dataWithContentsOfFile:fileAtPath]
                 mimeType:@"text/csv"
                 fileName:@"archivoPrueba.csv"];
    [self presentViewController:mc animated:YES completion:nil];
}

-(void)messageSent:(SKPSMTPMessage *)message{
    NSLog(@"delegate - message sent");
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message sent." message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    //[alert show];
}

// On Failure
-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    // open an alert with just an OK button
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    //NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
}


-(void) movCarrusel{
    
    indiceAct++;
    if (indiceAct>=elementos) {
        indiceAct = 0;
    }
    self.carousel.scrollOffset = indiceAct;
    self.pruebaLb.text = posiciones[indiceAct];
    [manager writeString:posiciones[indiceAct]];
    
    //self.comprar.hidden = TRUE;
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.op1.hidden = TRUE;
    //self.seleccionaLb.hidden = FALSE;
    self.detenerVid.hidden = TRUE;
    self.ingresadoLb.text = @"INGRESADO";
    
    
}


- (IBAction)video:(id)sender{
    
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    //self.comprar.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.op1.hidden = TRUE;
    self.videoBtn.hidden = TRUE;
    self.detenerVid.hidden = FALSE;
    self.seleccionaLb.hidden = FALSE;
    
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(movieFinishedCallback:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:_moviePlayer];
    
    
    _moviePlayer.view.frame = CGRectMake(64, 540, 640, 360);
    [self.view addSubview:_moviePlayer.view];
    _moviePlayer.controlStyle = MPMovieControlStyleNone;
    
    
    [_moviePlayer play];
    _moviePlayer.view.hidden = FALSE;
    
    
    
}

- (IBAction)detenerVideo:(id)sender{
    [_moviePlayer stop];
    
}

- (void) movieFinishedCallback:(NSNotification*) aNotification {
    _moviePlayer = [aNotification object];
    _moviePlayer.view.hidden = TRUE;
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:_moviePlayer];
    
    
    _moviePlayer.view.hidden = TRUE;
    self.detenerVid.hidden = TRUE;
    self.videoBtn.hidden = FALSE;
    NSLog(@"Video ended!");
    
    ;
    
}

#pragma mark -
#pragma mark Button tap event



- (IBAction)enterPassword:(id)sender {
    
    if ([self.passwordText.text  isEqual: @"hola"]){

        [self showAdminBtns];
        //self.ingresar.hidden = FALSE;
        //self.vaciarBtn.hidden = FALSE;
    }
    else
        self.passwordText.text = @"";
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    //tiempoTimer = 10;
    contadorTimer = 0;
    [super touchesBegan:touches withEvent:event];
}



- (IBAction)ingresarBtn:(id)sender {
    UIStoryboard *mainStoryboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *conf = [mainStoryboard instantiateViewControllerWithIdentifier:@"configuracion"];
    
    [self presentViewController:conf animated:YES completion:nil];
}

-(IBAction)vaciarBtnAction:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmar" message:@"Confirmar Vaciar Variety" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        pruebaLb.text = @"Vaciando...";
        pruebaLb.hidden = FALSE;        //OJO! NUNCA QUITAR!
        
        [manager writeString:@"W"];
        [self hideAdminBtns];
        //self.ingresar.hidden = TRUE;
        //self.vaciarBtn.hidden = TRUE;
        //self.passwordText.text = @"";
    }
    else{
        [self hideAdminBtns];
        //self.ingresar.hidden = TRUE;
        //self.vaciarBtn.hidden = TRUE;
        //self.passwordText.text = @"";
    }
}


- (void)resetIdleTimer {
    
        if (!idleTimer) {
            idleTimer = [NSTimer scheduledTimerWithTimeInterval:tiempoTimer
                                                      target:self
                                                    selector:@selector(idleTimerExceeded)
                                                    userInfo:nil
                                                    repeats:NO];
        }
        else {
            if (fabs([idleTimer.fireDate timeIntervalSinceNow]) < tiempoTimer-1.0) {
            [idleTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:tiempoTimer]];
            }
        }
}


- (void)idleTimerExceeded {
    [idleTimer release];
    idleTimer = nil;
    
    //Do not use [precioLb.text isEqualToString:@"$0.00"]. iPad can change but money machine will wait for money!
    //inicializaLB contains the image complete to load system
    if (self.cancelar.isHidden && self.inicializaLb.isHidden && self.cancelarPaqueteBtn.isHidden && self.despachandoLb.isHidden) {
        [self showInitMain];
        //[self viewMenu];
        [manager writeString:@"M"];

    }
    
    
    //Checking Battery
    UIDeviceBatteryState currentStateBat = [UIDevice currentDevice].batteryState;
    if(currentStateBat == UIDeviceBatteryStateUnplugged){
        self.pruebaLb.text = @"iPad Desconectada";
        //Turning off the screen!
        self.doNothing.hidden = FALSE;
        //self.doNothing.titleLabel.text = @"FUERA DE SERVICIO";
        //self.doNothing.titleLabel.textColor =[UIColor whiteColor];
        [self hideInitMain];
        self.doNothing.backgroundColor = [UIColor blackColor];
        [self.doNothing setTitle: @"FUERA DE SERVICIO" forState: UIControlStateNormal];
        [self.doNothing setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
        [[UIScreen mainScreen] setBrightness:0.0f];
        
        //Setting idleTimer
        [[UIApplication sharedApplication] setIdleTimerDisabled:FALSE];
        
        //Sending Message
        if(!sendiPadDisconnected){
            [self enviarMensaje:5];
            sendiPadDisconnected = TRUE;
        }

    }
    else if(currentStateBat == UIDeviceBatteryStateCharging ||
            currentStateBat == UIDeviceBatteryStateFull){

        self.pruebaLb.text = @"iPad Conectada";
        self.doNothing.hidden = TRUE;
        self.doNothing.titleLabel.text = @"";
        [[UIScreen mainScreen] setBrightness:1.0f];
        
        //Assure app is always running
        [[UIApplication sharedApplication] setIdleTimerDisabled:TRUE];
        
        if(sendiPadDisconnected){
            [self enviarMensaje:6];
            sendiPadDisconnected = FALSE;
        }

    }
    else if(currentStateBat == UIDeviceBatteryStateUnknown){
        self.pruebaLb.text = @"iPad-Unkwn";
        
        //Assure app is always running
        [[UIApplication sharedApplication] setIdleTimerDisabled:TRUE];
        
        if(sendiPadUnknown){
            [self enviarMensaje:7];
            sendiPadUnknown = FALSE;
        }

    }
    [self writeLogAtHour];
    [self resetIdleTimer];

}

- (UIResponder *)nextResponder {
    [self resetIdleTimer];
    return [super nextResponder];
}

-(void)outputAccelerationData:(CMAcceleration)acceleration
{
    if (acceleration.y > -.8 && alertaRobo == 0) {
        alertaRobo = 1;
        self.pruebaLb.text = @"Robo de Ipad!";
        [self enviarMensaje:3];
    }
}


- (IBAction)americanoBtn:(id)sender {
    [self executeSelection:  @"Americano": @"MENU_CAPSULAS_5.png" : @"DESCRIPCION_5.png" : @"BOTON_INSERTA_5.png": 231];
}

- (IBAction)aromaBtn:(id)sender {
    [self executeSelection:  @"Grande Aroma": @"MENU_CAPSULAS_21.png" : @"DESCRIPCION_21.png" : @"BOTON_INSERTA_21.png": 99];
}


- (IBAction)aromaIntensoBtn:(id)sender {
    [self executeSelection:  @"Grande Intenso": @"MENU_CAPSULAS_22.png" : @"DESCRIPCION_22.png" : @"BOTON_INSERTA_22.png": 99];
}

- (IBAction)cafeAuLaitBtn:(id)sender {
    [self executeSelection:  @"Cafe Au Lait": @"MENU_CAPSULAS_23.png" : @"DESCRIPCION_23.png" : @"BOTON_INSERTA_23.png": 99];
}


- (IBAction)cappuccinoBtn:(id)sender {
    [self executeSelection:  @"Cappuccino": @"MENU_CAPSULAS_12.png" : @"DESCRIPCION_12.png" : @"BOTON_INSERTA_12.png": 231];
}

- (IBAction)espressoBtn:(id)sender {
    [self executeSelection:  @"Espresso": @"MENU_CAPSULAS_16.png" : @"DESCRIPCION_16.png" : @"BOTON_INSERTA_16.png": 66];
}

- (IBAction)espressoBaristaBtn:(id)sender {
    [self executeSelection:  @"Espresso Barista": @"MENU_CAPSULAS_8.png" : @"DESCRIPCION_8.png" : @"BOTON_INSERTA_8.png": 33];
}

- (IBAction)espressoCortadoBtn:(id)sender {
        [self executeSelection:  @"Cortado": @"MENU_CAPSULAS_19.png" : @"DESCRIPCION_19.png" : @"BOTON_INSERTA_19.png": 99];
}

- (IBAction)espressoDecafBtn:(id)sender {
    [self executeSelection:  @"Espresso Decaffeinato": @"MENU_CAPSULAS_14.png" : @"DESCRIPCION_14.png" : @"BOTON_INSERTA_14.png": 66];
}

- (IBAction)espressoIntensoBtn:(id)sender {
    [self executeSelection:  @"Espresso Intenso": @"MENU_CAPSULAS_2.png" : @"DESCRIPCION_2.png" : @"BOTON_INSERTA_2.png": 66];
}

- (IBAction)espressoRistrettoBtn:(id)sender {
    [self executeSelection:  @"Espresso Ristretto": @"MENU_CAPSULAS_17.png" : @"DESCRIPCION_17.png" : @"BOTON_INSERTA_17.png": 66];
}

- (IBAction)cappuccinoIceBtn:(id)sender {
        [self executeSelection:  @"Cappuccino Ice": @"MENU_CAPSULAS_20.png" : @"DESCRIPCION_20.png" : @"BOTON_INSERTA_20.png": 231];
}

- (IBAction)cappuccinoSkinnyBtn:(id)sender {
    [self executeSelection:  @"Cappuccino Skinny": @"MENU_CAPSULAS_7.png" : @"DESCRIPCION_7.png" : @"BOTON_INSERTA_7.png": 231];
}

- (IBAction)chaiTeaLatteBtn:(id)sender {
    [self executeSelection:  @"Chai Tea Latte": @"MENU_CAPSULAS_9.png" : @"DESCRIPCION_9.png" : @"BOTON_INSERTA_9.png": 198];
}

- (IBAction)chocoCaramelBtn:(id)sender {
    [self executeSelection:  @"Choco Caramel": @"MENU_CAPSULAS_18.png" : @"DESCRIPCION_18N.png" : @"BOTON_INSERTA_18.png": 198];
}

- (IBAction)chococinoBtn:(id)sender {
    [self executeSelection:  @"Chococino": @"MENU_CAPSULAS_15.png" : @"DESCRIPCION_15.png" : @"BOTON_INSERTA_15.png": 198];
}

- (IBAction)latteMacchiatoCaramelBtn:(id)sender {
    [self executeSelection:  @"Latte Macchiato Caramel": @"MENU_CAPSULAS_3.png" : @"DESCRIPCION_3.png" : @"BOTON_INSERTA_3.png" :231];
}

- (IBAction)latteMacchiatoBtn:(id)sender {
    [self executeSelection:  @"Latte Macchiato": @"MENU_CAPSULAS_6.png" : @"DESCRIPCION_6.png" : @"BOTON_INSERTA_6.png" :231];
}

- (IBAction)latteMacchiatoVanillaBtn:(id)sender {
    [self executeSelection:  @"Latte Macchiato Vanilla": @"MENU_CAPSULAS_11.png" : @"DESCRIPCION_11.png" : @"BOTON_INSERTA_11.png" :231];
}

- (IBAction)lungoBtn:(id)sender {
    [self executeSelection:  @"Lungo": @"MENU_CAPSULAS_4.png" : @"DESCRIPCION_4.png" : @"BOTON_INSERTA_4.png" :132];
}

- (IBAction)lungoDecaffeinatoBtn:(id)sender {
    [self executeSelection:  @"Lungo Decaffeinato": @"MENU_CAPSULAS_13.png" : @"DESCRIPCION_13.png" : @"BOTON_INSERTA_13.png" :132];
}

- (IBAction)lungoIntensoBtn:(id)sender {
    [self executeSelection:  @"Lungo Intenso": @"MENU_CAPSULAS_1.png" : @"DESCRIPCION_1.png" : @"BOTON_INSERTA_1.png" :132];
}

- (IBAction)marrakeshStyleTeaBtn:(id)sender {
    [self executeSelection: @"Marrakesh Style Tea": @"MENU_CAPSULAS_10.png" : @"DESCRIPCION_10.png" : @"BOTON_INSERTA_10.png" :198];
}

- (void)executeSelection:   (NSString*)coffename :
                            (NSString*)imgmenu :
                            (NSString*)imgdescription :
                            (NSString*)imgbtn :
                            (int) volbuy
{
    regresaPaqueteBtn.hidden = TRUE;
    [self hideAllCoffeeBtns];
    
    if(self.precioLb.isHidden && self.flechaDerBtn.isHidden){
        
        int salir = 0;
        int i = 0;
        
        while (salir == 0 && i < productosAct.count){
            
            if ([nombres[i]  isEqual: coffename]) {
                salir = 1;
            }
            else
                i++;
            
        }
        if(salir == 1){
            //Fase 2
            coffeeSelected = coffename;
            //Fase 3
            currentSlot = [self getCoffeeSlotAvailable: coffeeSelected];
            
            //Validating currentSlot
            //if(currentSlot > 0)
                //[self loadPreparaBebida:self];
                
            self.menuView.image = [UIImage imageNamed:imgmenu];
            self.descripcionView.image = [UIImage imageNamed:imgdescription];
            self.comprarView.image = [UIImage imageNamed:imgbtn];
            
            
            volCompra = [NSNumber numberWithInt: volbuy];
            
            //Mandamos carrusel a la posicion de enfrente para el usuario
            pruebaLb.text = [NSString stringWithFormat:@"P%.2d", currentSlot];
            //pruebaLb.hidden = FALSE;
            
            [manager writeString:[NSString stringWithFormat:@"P%.2d", currentSlot]];
            
            NSString *precio = precios[i];
            NSString *newStr = [precio substringToIndex:[precio length]-1];
            newStr = [newStr stringByReplacingOccurrencesOfString:@"." withString:@""];
            
            if ([newStr length] < 4) {
                newStr = [NSString stringWithFormat:@"0%@", newStr];
            }
            
            NSString *pos2 = [NSString stringWithFormat:@"%.2d", currentSlot];
            
            NSString *tipo = slots[i];
            
            NSString * strRR = [NSString stringWithFormat:@"C%@%@%@", tipo, pos2, newStr];
            //pruebaLb.text = strRR;
            //pruebaLb.hidden = FALSE;
            
            texto = strRR;
            
            
            self.seleccionaLb.hidden = TRUE;
            self.comprar.hidden = FALSE;
            
            self.seleccionaView.hidden = TRUE;
            self.moradoView.hidden = TRUE;
            self.descripcionView.hidden = FALSE;
            self.comprarView.hidden = FALSE;
            self.variedadesView.hidden = TRUE;
            self.menuView.hidden = FALSE;
            self.menuBtn.hidden = FALSE;
            
            self.americanoBtn.alpha = 1;
            self.aromaBtn.alpha = 1;
            self.aromaIntensoBtn.alpha = 1;
            self.cafeAuLaitBtn.alpha = 1;
            self.cappuccinoBtn.alpha = 1;
            self.cappuccinnoIceBtn.alpha = 1;
            self.cappuccinoSkinnyBtn.alpha = 1;
            self.chaiTeaLatteBtn.alpha = 1;
            self.chococaramelBtn.alpha = 1;
            self.chococinoBtn.alpha = 1;
            self.espressoBtn.alpha = 1;
            self.espressoBaristaBtn.alpha = 1;
            self.espressoCortadoBtn.alpha = 1;
            self.espressoDecafBtn.alpha = 1;
            self.espressoIntensoBtn.alpha = 1;
            self.latteCaramelBtn.alpha = 1;
            self.latteMacchiatoBtn.alpha = 1;
            self.latteVanillaBtn.alpha = 1;
            self.lungoBtn.alpha = 1;
            self.lungoDecafBtn.alpha = 1;
            self.lungoIntensoBtn.alpha = 1;
            self.marrakeshBtn.alpha = 1;
            self.ristrettoBtn.alpha = 1;
            
            if(test_for_simulator != 0){
                self.flechaDerBtn.hidden = false;
                self.cancelar.hidden = TRUE;
                self.precioLb.hidden = TRUE;
                self.ingresadoLb.hidden = TRUE;
                self.ingresadoLb.text = @"INGRESADO";
                self.seleccionaLb.hidden = TRUE;
                precioLb.hidden = TRUE;
                cancelar.hidden = TRUE;
                precioPagadoLb.hidden = TRUE;
                cambioView.hidden = TRUE;
                pagadoView.hidden = TRUE;
                cancelarPaqueteBtn.hidden = TRUE;
                cancelarPaqueteView.hidden = TRUE;
                comprarPaqueteView.hidden = TRUE;
                comprarPaqueteBtn.hidden = TRUE;
            }
            
        }
    }
}

- (IBAction)flechaDerBtn:(id)sender{

    CoffeeType *coffee = [[CoffeeType alloc] initWithName:coffeeSelected];
    
    //Incrementing global variable
    currentStep = currentStep+1;
    
    //Validating currentStep
    if(currentStep <coffee.steps){
        NSString *pasoSTR = [NSString stringWithFormat:@"PASO_%d_%d.png", currentStep, coffee.type];
        NSString *plecaSTR = [NSString stringWithFormat:@"MODO_PREPARACION_%d.png", coffee.type];
    
        self.pasosView.image = [UIImage imageNamed:pasoSTR];
        self.pasosView.hidden = FALSE;
    
        self.plecaView.image = [UIImage imageNamed:plecaSTR];
        self.plecaView.hidden = FALSE;
    
        //Setting pages
        self.flechaDerBtn.hidden = FALSE;
        self.flechaIzqBtn.hidden = FALSE;
        
        //Setting menu to white
        self.menuBtn.imageView.image = [UIImage imageNamed:botonBlancoSTR];
    }
    else if(currentStep == coffee.steps){
        NSString *pasoSTR = [NSString stringWithFormat:@"PASO_%d_%d.png", currentStep, coffee.type];
        NSString *plecaSTR = [NSString stringWithFormat:@"PLECA_%d.png", coffee.type];
        
        self.pasosView.image = [UIImage imageNamed:pasoSTR];
        self.pasosView.hidden = FALSE;
        
        self.plecaView.image = [UIImage imageNamed:plecaSTR];
        self.plecaView.hidden = FALSE;
        
        //Setting pages
        self.flechaDerBtn.hidden = FALSE;
        self.flechaIzqBtn.hidden = FALSE;
        
        //Setting menu to white
        self.menuBtn.imageView.image = [UIImage imageNamed:botonBlancoSTR];
    }
    else if(currentStep > coffee.steps){
        //[self enviarMensaje:4];
        //bugCounter++;
        [self loadPreparaBebida:sender];
        //[self viewMenu];
    }
        
}
- (IBAction)flechaIzqBtn:(id)sender{
    CoffeeType *coffee = [[CoffeeType alloc] initWithName:coffeeSelected];
    
    //Decreasing global variable
    currentStep = currentStep-1;
    
    //Validating currentStep
    if(currentStep <= 0){
        [self loadPreparaBebida:sender];
        //[self viewMenu];
    }
    else if(currentStep < coffee.steps){
        NSString *pasoSTR = [NSString stringWithFormat:@"PASO_%d_%d.png", currentStep, coffee.type];
        NSString *plecaSTR = [NSString stringWithFormat:@"MODO_PREPARACION_%d.png", coffee.type];
        
        self.pasosView.image = [UIImage imageNamed:pasoSTR];
        self.pasosView.hidden = FALSE;
        
        self.plecaView.image = [UIImage imageNamed:plecaSTR];
        self.plecaView.hidden = FALSE;
        
        //Setting pages
        self.flechaDerBtn.hidden = FALSE;
        self.flechaIzqBtn.hidden = FALSE;
        
        if(currentStep ==1 )
            self.flechaIzqBtn.hidden = TRUE;
    }
}

- (IBAction)EnviarReporteBtn:(id)sender{
    [self enviarMensaje: 4];
    [self hideAdminBtns];
}

- (IBAction)LlenarTanqueBtn:(id)sender{
    [manager writeString:@"A"];
    [self hideAdminBtns];
}

- (void) hideAdminBtns{
    self.ingresar.hidden = TRUE;
    self.vaciarBtn.hidden = TRUE;
    self.enviarReporteBtn.hidden = TRUE;
    self.llenarTanqueBtn.hidden = TRUE;
    self.passwordText.text = @"";
}

-(void) showAdminBtns{
    self.ingresar.hidden = FALSE;
    self.vaciarBtn.hidden = FALSE;
    self.enviarReporteBtn.hidden = FALSE;
    self.llenarTanqueBtn.hidden = FALSE;
}

-(void) viewMenu{
    [self hidePreparaPaquete];
    
    regresaPaqueteBtn.hidden = FALSE;
    
    self.comprar.hidden = TRUE;
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.op1.hidden = TRUE;
    //self.seleccionaLb.hidden = FALSE;
    //self.videoBtn.hidden = FALSE;
    self.seleccionaView.hidden = FALSE;
    self.moradoView.hidden = FALSE;
    self.descripcionView.hidden = TRUE;
    self.comprarView.hidden = TRUE;
    self.variedadesView.hidden = FALSE;
    self.menuView.hidden = TRUE;
    self.menuBtn.hidden = TRUE;
    //Cleaning Pleca
    self.plecaView.hidden = TRUE;
    self.pasosView.hidden = TRUE;
    //Cleaning Flechas
    self.flechaDerBtn.hidden = TRUE;
    self.flechaIzqBtn.hidden = TRUE;
    //Cleaning Steps
    currentStep = -1;
    //Setting menu to gray
    self.menuBtn.imageView.image = [UIImage imageNamed:botonGrisSTR];
    //Setting Fondo Init View to hidden
    self.fondoInitView.hidden = TRUE;
    self.inicializaLb.hidden = TRUE;
    self.despachandoLb.hidden = TRUE;
    //Setting turn on button to hidden
    self.doNothing.hidden = TRUE;
    self.doNothing.titleLabel.text = @"";
    //sendiPadDisconnected = FALSE;
    //pruebaLb.hidden = FALSE;
    
    //Fase 3
    preparaBebidaBtn.hidden = TRUE;
    preparaPaqueteBtn.hidden = TRUE;
    storePlecaView.hidden = TRUE;
    preparaBebidaView.hidden = TRUE;
    preparaPaqueteView.hidden = TRUE;
    
    self.americanoBtn.alpha = 1;
    self.aromaBtn.alpha = 1;
    self.aromaIntensoBtn.alpha = 1;
    self.cafeAuLaitBtn.alpha = 1;
    self.cappuccinoBtn.alpha = 1;
    self.cappuccinnoIceBtn.alpha = 1;
    self.cappuccinoSkinnyBtn.alpha = 1;
    self.chaiTeaLatteBtn.alpha = 1;
    self.chococaramelBtn.alpha = 1;
    self.chococinoBtn.alpha = 1;
    self.espressoBtn.alpha = 1;
    self.espressoBaristaBtn.alpha = 1;
    self.espressoCortadoBtn.alpha = 1;
    self.espressoDecafBtn.alpha = 1;
    self.espressoIntensoBtn.alpha = 1;
    self.latteCaramelBtn.alpha = 1;
    self.latteMacchiatoBtn.alpha = 1;
    self.latteVanillaBtn.alpha = 1;
    self.lungoBtn.alpha = 1;
    self.lungoDecafBtn.alpha = 1;
    self.lungoIntensoBtn.alpha = 1;
    self.marrakeshBtn.alpha = 1;
    self.ristrettoBtn.alpha = 1;
}
-(void) hiddenMenu{
    self.seleccionaView.hidden = FALSE;
    self.moradoView.hidden = FALSE;
    self.variedadesView.hidden = FALSE;
    //self.turnOnBtn.hidden = TRUE;
}


- (IBAction)doNothingBtn:(id)sender {
    self.doNothing.hidden = FALSE;
    self.doNothing.titleLabel.text = @"";
    [[UIScreen mainScreen] setBrightness:0.0f];
}

-(void) hideAllCoffeeBtns{
    self.americanoBtn.hidden = TRUE;
    self.aromaBtn.hidden = TRUE;
    self.aromaIntensoBtn.hidden = TRUE;
    self.cafeAuLaitBtn.hidden = TRUE;
    self.cappuccinoBtn.hidden = TRUE;
    self.cappuccinnoIceBtn.hidden = TRUE;
    self.cappuccinoSkinnyBtn.hidden = TRUE;
    self.chaiTeaLatteBtn.hidden = TRUE;
    self.chococaramelBtn.hidden = TRUE;
    self.chococinoBtn.hidden = TRUE;
    self.espressoBtn.hidden = TRUE;
    self.espressoBaristaBtn.hidden = TRUE;
    self.espressoCortadoBtn.hidden = TRUE;
    self.espressoDecafBtn.hidden = TRUE;
    self.espressoIntensoBtn.hidden = TRUE;
    self.latteCaramelBtn.hidden = TRUE;
    self.latteMacchiatoBtn.hidden = TRUE;
    self.latteVanillaBtn.hidden = TRUE;
    self.lungoBtn.hidden = TRUE;
    self.lungoDecafBtn.hidden = TRUE;
    self.lungoIntensoBtn.hidden = TRUE;
    self.marrakeshBtn.hidden = TRUE;
    self.ristrettoBtn.hidden = TRUE;
}
-(void) hidePreparaBebidaView{
    self.regresaPaqueteBtn.hidden = TRUE;
    
    self.seleccionaView.hidden = TRUE;
    self.moradoView.hidden = TRUE;
    self.variedadesView.hidden = TRUE;
    
    //Fase 1
    self.comprar.hidden = TRUE;
    self.cancelar.hidden = TRUE;
    self.precioLb.hidden = TRUE;
    self.ingresadoLb.hidden = TRUE;
    self.tipoLb.hidden = TRUE;
    self.precioListaLb.hidden = TRUE;
    self.detenerVid.hidden = TRUE;
    self.seleccionaLb.hidden = TRUE;
    self.textoRecib.hidden = TRUE;
    [self hideAdminBtns];
    //self.ingresar.hidden = TRUE;
    //self.vaciarBtn.hidden = TRUE;
    //self.enviarReporteBtn.hidden = TRUE;
    //self.llenarTanqueBtn.hidden = TRUE;
    self.op1.hidden = TRUE;
    
    self.variedadesView.hidden = TRUE;
    self.descripcionView.hidden = TRUE;
    self.comprarView.hidden = TRUE;
    self.menuView.hidden = TRUE;
    self.menuBtn.hidden = TRUE;
    
    [self hideAllCoffeeBtns];
    
    //Fase 2
    self.pasosView.hidden = TRUE;
    self.plecaView.hidden = TRUE;
    self.flechaDerBtn.hidden = TRUE;
    self.flechaIzqBtn.hidden = TRUE;
    //Setting Fondo Init View to hidden
    self.fondoInitView.hidden = TRUE;
    self.inicializaLb.hidden = TRUE;
    self.despachandoLb.hidden = TRUE;
    self.doNothing.hidden = TRUE;
    self.doNothing.titleLabel.text = @"";
    //Assure app is always running
    //[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    sendiPadDisconnected = FALSE;
    //pruebaLb.hidden = FALSE;
}

-(UIButton*)getButtonFromName : (NSString*) nameBtn{
    if([nameBtn isEqualToString: @"Lungo Intenso"])
        return self.lungoIntensoBtn;
    else if([nameBtn isEqualToString: @"Espresso Intenso"])
        return self.espressoIntensoBtn;
    else if([nameBtn isEqualToString: @"Latte Macchiato Caramel"])
        return self.latteCaramelBtn;
    else if([nameBtn isEqualToString: @"Lungo"])
        return self.lungoBtn;
    else if([nameBtn isEqualToString: @"Americano"])
        return self.americanoBtn;
    else if([nameBtn isEqualToString: @"Latte Macchiato"])
        return self.latteMacchiatoBtn;
    else if([nameBtn isEqualToString: @"Cappuccino Skinny"])
        return self.cappuccinoSkinnyBtn;
    else if([nameBtn isEqualToString: @"Espresso Barista"])
        return self.espressoBaristaBtn;
    else if([nameBtn isEqualToString: @"Chai Tea Latte"])
        return self.chaiTeaLatteBtn;
    else if([nameBtn isEqualToString: @"Marrakesh Style Tea"])
        return self.marrakeshBtn;
    else if([nameBtn isEqualToString: @"Latte Macchiato Vanilla"])
        return self.latteVanillaBtn;
    else if([nameBtn isEqualToString: @"Cappuccino"])
        return self.cappuccinoBtn;
    else if([nameBtn isEqualToString: @"Lungo Decaffeinato"])
        return self.lungoDecafBtn;
    else if([nameBtn isEqualToString: @"Espresso Decaffeinato"])
        return self.espressoDecafBtn;
    else if([nameBtn isEqualToString: @"Chococino"])
        return self.chococinoBtn;
    else if([nameBtn isEqualToString: @"Espresso"])
        return self.espressoBtn;
    else if([nameBtn isEqualToString: @"Espresso Ristretto"])
        return self.ristrettoBtn;
    else if([nameBtn isEqualToString: @"Choco Caramel"])
        return self.chococaramelBtn;
    else if([nameBtn isEqualToString: @"Cortado"])
        return self.espressoCortadoBtn;
    else if([nameBtn isEqualToString: @"Cappuccino Ice"])
        return cappuccinnoIceBtn;
    else if([nameBtn isEqualToString: @"Grande Aroma"])
        return self.aromaBtn;
    else if([nameBtn isEqualToString: @"Grande Intenso"])
        return self.aromaIntensoBtn;
    else if([nameBtn isEqualToString: @"Cafe Au Lait"])
        return self.cafeAuLaitBtn;
    else
        return Nil;
}

-(NSString*) printArray : (NSMutableArray*) my_array{
    NSString *text = @"";
    for(int i = 0; i < my_array.count; i++){
        int value  = [[my_array objectAtIndex:i] intValue];
        text = [NSString stringWithFormat: @"%@%@", text, [NSString stringWithFormat:@"%.2d", value]];
    }
    return text;
}

-(bool) isCoffeeAvailableAnywhere : (NSString*) cName{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *productos = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
    int sumExistencias = 0;
    
    for(int i=0; i<productos.count; i++){
        if([cName isEqualToString: productos[i]])
            sumExistencias = sumExistencias + [[existenciasArray objectAtIndex:i] intValue];
    }
    
    if(sumExistencias > 0)
        return TRUE;
    
    if(test_for_simulator == 0)
        return FALSE;
    else
        return TRUE;
}

-(int) getCoffeeSlotAvailable: (NSString*) cName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *productos = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
    
    for(int i=0; i<productos.count; i++){
        if([[existenciasArray objectAtIndex:i] intValue] > 0 && [cName isEqualToString: productos[i]])
            return i;
    }
 
    return -1;
 }

-(void) setDefaultsFromArrays{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *emailArrays = [[NSMutableArray alloc] initWithCapacity:coffeeNameBuyedArray.count];
    NSMutableString *row;
    
    for(int i=0; i<coffeeNameBuyedArray.count; i++){
        row = [NSMutableString stringWithString:@""];
        [row appendFormat:@"%@,%@,%@,%@,%@", [coffeeNameBuyedArray objectAtIndex:i],[coffeePriceBuyedArray objectAtIndex:i],[dateBuyedArray objectAtIndex:i], [lotesArray objectAtIndex:i], [fechasArray objectAtIndex:i]];
        emailArrays[i] = row;
        
    }
    
    [self cleanDefaultArrays];
    
    //Setting emailArrays to Defaults
    [defaults setObject:emailArrays forKey:@"emailDataAct"];
    [defaults synchronize];
}

-(void) getArraysFromDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if([[[defaults dictionaryRepresentation] allKeys] containsObject:@"emailDataAct"]){
        
        NSMutableArray *emailArrays = [NSMutableArray arrayWithArray:[defaults objectForKey:@"emailDataAct"]];
        
        for(int i=0; i<emailArrays.count; i++){
            NSString *row = [NSString stringWithString:[emailArrays objectAtIndex:i]];
            coffeeNameBuyedArray[i] = [row componentsSeparatedByString:@","][0];
            coffeePriceBuyedArray[i] = [row componentsSeparatedByString:@","][1];
            dateBuyedArray[i] = [row componentsSeparatedByString:@","][2];
            lotesArray[i] = [row componentsSeparatedByString:@","][3];
            fechasArray[i] = [row componentsSeparatedByString:@","][4];
        }
    }
}

-(void) cleanDefaultArrays{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"emailDataAct"];
    [defaults synchronize];
}

-(int) getProductVarietySlotFromName : (NSString*) name{
    
    int index = -1;
    
    for(int i=0; i<productosVariety.count; i++){
        if([name isEqual:[productosVariety objectAtIndex:i]]){
            index = i;
        }
    }
    return index;
}

@end
