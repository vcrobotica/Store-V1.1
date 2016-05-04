//
//  ViewController.h
//  Vending 0.2
//
//  Created by V&C on 20/07/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RscMgr.h"
#import "vista2ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "iCarousel.h"
#import <MessageUI/MessageUI.h>
#import "SKPSMTPMessage.h"
#import <CoreMotion/CoreMotion.h>

#define LOOPBACK_TEST_LEN 4096

typedef enum CableConnectState
{
    kCableNotConnected,
    kCableConnected,
    kCableRequiresPasscode
    
} CableConnectState;

typedef enum
{
    kBaudIndex = 0,
    kDataBitsIndex = 1,
    kParityIndex = 2,
    kStopBitsIndex = 3
    
} PortConfigSettingType;



typedef enum
{
    kStatRx = 0,
    kStatTx = 1,
    kStatErr = 2
} StatType;



@interface ViewController : UIViewController <RscMgrDelegate, iCarouselDataSource, iCarouselDelegate, MFMailComposeViewControllerDelegate, SKPSMTPMessageDelegate, UITableViewDataSource,UITableViewDelegate>
{
    UILabel *ctsLabel;
    UILabel *dsrLabel;
    UILabel *cdLabel;
    UILabel *riLabel;
    UIBarButtonItem *rtsButton;
    UIBarButtonItem *dtrButton;
    
    UILabel *priceLB;
    UILabel *precioLb;
    UILabel *ingresadoLb;
    UILabel *tipoLb;
    UILabel *precioListaLb;
    UILabel *seleccionaLb;
    UILabel *pruebaLb;
    UITextView *textoRecib;
    UIImageView *op1;
    UIView *comprar;
    UIView *cancelar;
    UIView *videoBtn;
    UIView *detenerVid;
    UIView *ingresar;
    UITextField *passwordText;
    //UITableView *tabla1;
    //UIView *carousel;
    
    UIImageView  *variedadesView;
    UIImageView  *moradoView;
    UIImageView  *seleccionaView;
    UIImageView  *descripcionView;
    UIImageView  *comprarView;
    UIImageView  *menuView;
    UIButton *menuBtn;
    UIButton *americanoBtn;
    UIButton *aromaBtn;
    UIButton *aromaIntensoBtn;
    UIButton *cafeAuLaitBtn;
    UIButton *cappuccinoBtn;
    UIButton *cappuccinnoIceBtn;
    UIButton *cappuccinoSkinnyBtn;
    UIButton *chaiTeaLatteBtn;
    UIButton *chococaramelBtn;
    UIButton *chococinoBtn;
    UIButton *espressoBtn;
    UIButton *espressoBaristaBtn;
    UIButton *espressoCortadoBtn;
    UIButton *espressoDecafBtn;
    UIButton *espressoIntensoBtn;
    UIButton *latteCaramelBtn;
    UIButton *latteMacchiatoBtn;
    UIButton *latteVanillaBtn;
    UIButton *lungoBtn;
    UIButton *lungoDecafBtn;
    UIButton *lungoIntensoBtn;
    UIButton *marrakeshBtn;
    UIButton *ristrettoBtn;
    
    //Fase 2
    UIImageView  *plecaView;
    UIImageView  *pasosView;
    UIButton *flechaDerBtn;
    UIButton *flechaIzaBtn;
    UIImageView  *fondoInitView;
    UILabel *inicializaLb;
    UIButton *doNothing;
    
    //Fase 3: Store
    UIButton *preparaBebidaBtn;
    UIButton *preparaPaqueteBtn;
    UIImageView  *storePlecaView;
    UIImageView *preparaBebidaView;
    UIImageView *preparaPaqueteView;
    UIButton *regresaBebidaBtn;
    UIImageView  *regresaBebidaView;
    UITableView  *tablaVariety;
    UIImageView  *botonesView;
    UIButton *masBtn;
    UIButton *menosBtn;
    UIImageView  *vinetasTotalView;
    UIImageView *coffeeTypeSelectedView;
    UIButton  *comprarPaqueteBtn;
    UIImageView  *comprarPaqueteView;
    UIImageView  *pagadoView;
    UILabel  *precioPagadoLb;
    UIButton *regresaPaqueteBtn;
    UIButton  *cancelarPaqueteBtn;
    UIImageView  *cancelarPaqueteView;
    UIImageView  *cambioView;
    UILabel *pruebaLb2;
    UILabel *despachandoLb;
    UIButton *vaciar;
    
    NSDictionary *portConfigTableData;
    NSArray *portConfigKeys;
    NSString *texto;
    
    NSThread *commThread;
    
    RscMgr *manager;
    
    NSIndexPath *currentSelection;
    
    NSTimer *idleTimer;
    NSTimer *idleTimer2;
    
    CableConnectState cableState;
    BOOL passRequired;
    
    BOOL loopContinous;
    BOOL loopbackTestRunning;
    int loopbackCount;
    
    BOOL rxEcho;
    
    int rxCount;
    int txCount;
    int errCount;
    
    UInt8 rxLoopBuff[kRSC_SerialReadBufferSize];
    UInt8 txLoopBuff[LOOPBACK_TEST_LEN];
    
    BOOL testingViewActive;
    
    //TestViewController *testController;
    
    int currentLoopTxIndex;
    
    //id <ViewControllerDelegate> delegate;
    
}

@property (retain, nonatomic) IBOutlet UILabel *priceLB;
@property (retain, nonatomic) IBOutlet UITextView  *textoRecib;
@property (retain, nonatomic) IBOutlet UILabel *precioLb;
@property (retain, nonatomic) IBOutlet UIImageView  *op1;
@property (retain, nonatomic) IBOutlet UIView  *comprar;
@property (retain, nonatomic) IBOutlet UIView  *cancelar;
@property (retain, nonatomic) IBOutlet UIView  *videoBtn;
@property (retain, nonatomic) IBOutlet UIView  *detenerVid;
@property (retain, nonatomic) IBOutlet UIView  *ingresar;
@property (retain, nonatomic) IBOutlet UILabel *ingresadoLb;
@property (retain, nonatomic) IBOutlet UILabel *tipoLb;
@property (retain, nonatomic) IBOutlet UILabel *precioListaLb;
@property (retain, nonatomic) IBOutlet UILabel *seleccionaLb;
@property (retain, nonatomic) IBOutlet UILabel *pruebaLb;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (retain, nonatomic) IBOutlet UITextField  *passwordText;
@property (strong, nonatomic) CMMotionManager *motionManager;

@property (retain, nonatomic) IBOutlet UIImageView  *variedadesView;
@property (retain, nonatomic) IBOutlet UIImageView  *moradoView;
@property (retain, nonatomic) IBOutlet UIImageView  *seleccionaView;
@property (retain, nonatomic) IBOutlet UIImageView  *descripcionView;
@property (retain, nonatomic) IBOutlet UIImageView  *comprarView;
@property (retain, nonatomic) IBOutlet UIImageView  *menuView;
@property (retain, nonatomic) IBOutlet UIButton *menuBtn;
@property (retain, nonatomic) IBOutlet UIButton *americanoBtn;
@property (retain, nonatomic) IBOutlet UIButton *aromaBtn;
@property (retain, nonatomic) IBOutlet UIButton *aromaIntensoBtn;
@property (retain, nonatomic) IBOutlet UIButton *cafeAuLaitBtn;
@property (retain, nonatomic) IBOutlet UIButton *cappuccinoBtn;
@property (retain, nonatomic) IBOutlet UIButton *cappuccinnoIceBtn;
@property (retain, nonatomic) IBOutlet UIButton *cappuccinoSkinnyBtn;
@property (retain, nonatomic) IBOutlet UIButton *chaiTeaLatteBtn;
@property (retain, nonatomic) IBOutlet UIButton *chococaramelBtn;
@property (retain, nonatomic) IBOutlet UIButton *chococinoBtn;
@property (retain, nonatomic) IBOutlet UIButton *espressoBtn;
@property (retain, nonatomic) IBOutlet UIButton *espressoBaristaBtn;
@property (retain, nonatomic) IBOutlet UIButton *espressoCortadoBtn;
@property (retain, nonatomic) IBOutlet UIButton *espressoDecafBtn;
@property (retain, nonatomic) IBOutlet UIButton *espressoIntensoBtn;
@property (retain, nonatomic) IBOutlet UIButton *latteCaramelBtn;
@property (retain, nonatomic) IBOutlet UIButton *latteMacchiatoBtn;
@property (retain, nonatomic) IBOutlet UIButton *latteVanillaBtn;
@property (retain, nonatomic) IBOutlet UIButton *lungoBtn;
@property (retain, nonatomic) IBOutlet UIButton *lungoDecafBtn;
@property (retain, nonatomic) IBOutlet UIButton *lungoIntensoBtn;
@property (retain, nonatomic) IBOutlet UIButton *marrakeshBtn;
@property (retain, nonatomic) IBOutlet UIButton *ristrettoBtn;
@property (nonatomic, retain) IBOutlet iCarousel *carousel;

//Fase 2 de pasos
@property (retain, nonatomic) IBOutlet UIImageView  *plecaView;
@property (retain, nonatomic) IBOutlet UIImageView  *pasosView;
@property (retain, nonatomic) IBOutlet UIButton *flechaDerBtn;
@property (retain, nonatomic) IBOutlet UIButton *flechaIzqBtn;
@property (retain, nonatomic) IBOutlet UIImageView  *fondoInitView;
@property (retain, nonatomic) IBOutlet UILabel *inicializaLb;
@property (retain, nonatomic) IBOutlet UIButton *doNothing;

//Fase 3: Store
@property (retain, nonatomic) IBOutlet UIButton *preparaBebidaBtn;
@property (retain, nonatomic) IBOutlet UIButton *preparaPaqueteBtn;
@property (retain, nonatomic) IBOutlet UIImageView  *storePlecaView;
@property (retain, nonatomic) IBOutlet UIImageView  *preparaBebidaView;
@property (retain, nonatomic) IBOutlet UIImageView  *preparaPaqueteView;
@property (retain, nonatomic) IBOutlet UIButton *regresaBebidaBtn;
@property (retain, nonatomic) IBOutlet UIImageView  *regresaBebidaView;
@property (retain, nonatomic) IBOutlet UITableView  *tablaVariety;
@property (retain, nonatomic) IBOutlet UIImageView  *botonesView;
@property (retain, nonatomic) IBOutlet UIButton  *masBtn;
@property (retain, nonatomic) IBOutlet UIButton  *menosBtn;
@property (retain, nonatomic) IBOutlet UIImageView  *vinetasTotalView;
@property (retain, nonatomic) IBOutlet UILabel *totalLb;
@property (retain, nonatomic) IBOutlet UIImageView  *coffeeTypeSelectedView;
@property (retain, nonatomic) IBOutlet UIButton *comprarPaqueteBtn;
@property (retain, nonatomic) IBOutlet UIImageView  *comprarPaqueteView;
@property (retain, nonatomic) IBOutlet UIImageView  *pagadoView;
@property (retain, nonatomic) IBOutlet UILabel  *precioPagadoLb;
//OTHER VIEW!
@property (retain, nonatomic) IBOutlet UIButton *regresaPaqueteBtn;
@property (retain, nonatomic) IBOutlet UIButton  *cancelarPaqueteBtn;
@property (retain, nonatomic) IBOutlet UIImageView  *cancelarPaqueteView;
@property (retain, nonatomic) IBOutlet UIImageView  *cambioView;
@property (retain, nonatomic) IBOutlet UILabel *pruebaLb2;
@property (retain, nonatomic) IBOutlet UILabel *despachandoLb;
@property (retain, nonatomic) IBOutlet UIButton *vaciarBtn;
@property (retain, nonatomic) IBOutlet UIButton *enviarReporteBtn;
@property (retain, nonatomic) IBOutlet UIButton *llenarTanqueBtn;

- (void)enviarMensaje:(int)mensaje;
- (void)executeSelection:(NSString*)coffename : (NSString*)imgmenu : (NSString*)imgdescription : (NSString*)imgbtn : (int) volbuy;

@end



