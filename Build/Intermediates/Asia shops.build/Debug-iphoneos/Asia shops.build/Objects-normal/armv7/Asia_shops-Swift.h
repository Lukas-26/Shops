// Generated by Apple Swift version 2.2 (swiftlang-703.0.6 clang-703.0.16)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import MessageUI;
@import CoreGraphics;
@import MapKit;
@import CoreLocation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIBarButtonItem;
@class MFMailComposeViewController;
@class NSError;
@class AboutView;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC10Asia_shops5About")
@interface About : UIViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) IBOutlet UIBarButtonItem * _Null_unspecified Open;
@property (nonatomic, weak) AboutView * _Null_unspecified aboutView;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)showAlert;
- (void)sendEmial:(NSString * _Nullable)predmet text:(NSString * _Nullable)text;
- (MFMailComposeViewController * _Nonnull)configuredMailComposeViewController:(NSString * _Nullable)predmet text:(NSString * _Nullable)text;
- (void)showSendMailErrorAlert;
- (void)mailComposeController:(MFMailComposeViewController * _Nonnull)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError * _Nullable)error;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;

SWIFT_CLASS("_TtC10Asia_shops9AboutView")
@interface AboutView : UIView
@property (nonatomic, weak) UIButton * _Null_unspecified contactButton;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
- (void)contactButt;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC10Asia_shops11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class MKPointAnnotation;
@class CLLocationManager;
@class UILongPressGestureRecognizer;
@class CLLocation;
@class MKMapView;
@class MKUserLocation;
@protocol MKAnnotation;
@class MKAnnotationView;
@class UIControl;

SWIFT_CLASS("_TtC10Asia_shops3Map")
@interface Map : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, strong) IBOutlet UIBarButtonItem * _Null_unspecified Open;
@property (nonatomic, weak) MKMapView * _Null_unspecified map;
@property (nonatomic, strong) MKPointAnnotation * _Nullable addAnnotation;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull manager;
- (void)viewDidLoad;
- (void)ShowDismisLocationAlert;
- (void)longPressed:(UILongPressGestureRecognizer * _Nonnull)sender;
- (void)topBarItemAdd:(UIBarButtonItem * _Nonnull)sender;
- (void)topBarItemCancel:(UIBarButtonItem * _Nonnull)sender;
- (void)addNew:(CLLocationCoordinate2D)coord;
- (void)cancelAdding;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateToLocation:(CLLocation * _Nonnull)newLocation fromLocation:(CLLocation * _Nonnull)oldLocation;
- (void)mapView:(MKMapView * _Nonnull)mapView didUpdateUserLocation:(MKUserLocation * _Nonnull)userLocation;
- (MKAnnotationView * _Nullable)mapView:(MKMapView * _Nonnull)mapView viewForAnnotation:(id <MKAnnotation> _Nonnull)addAnnotation;
- (void)mapView:(MKMapView * _Nonnull)mapView annotationView:(MKAnnotationView * _Nonnull)view calloutAccessoryControlTapped:(UIControl * _Nonnull)control;
- (void)mapView:(MKMapView * _Nonnull)mapView annotationView:(MKAnnotationView * _Nonnull)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (void)viewDidAppear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class NSIndexPath;
@class UITableViewCell;

SWIFT_CLASS("_TtC10Asia_shops6MenuVC")
@interface MenuVC : UITableViewController
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull MenuArray;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImagePickerController;
@class UIImageView;
@class UITextField;
@class UILabel;

SWIFT_CLASS("_TtC10Asia_shops17NewShopController")
@interface NewShopController : UIViewController <MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) MKPointAnnotation * _Nullable shopAnnotation;
@property (nonatomic, weak) MKMapView * _Null_unspecified map;
@property (nonatomic, weak) UIImageView * _Null_unspecified img;
@property (nonatomic, readonly, strong) UIImagePickerController * _Nonnull picker;
@property (nonatomic, weak) UILabel * _Null_unspecified name;
@property (nonatomic, weak) UITextField * _Null_unspecified textName;
- (void)viewDidLoad;
- (void)cameraPicker:(UIImageView * _Nonnull)img;
- (void)selectFromGallery;
- (void)takePhoto;
- (void)imagePickerController:(UIImagePickerController * _Nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * _Nonnull)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController * _Nonnull)picker;
- (MKAnnotationView * _Nullable)mapView:(MKMapView * _Nonnull)mapView viewForAnnotation:(id <MKAnnotation> _Nonnull)shopAnnotation;
- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField;
- (void)nameEditing:(UITextField * _Nonnull)source;
- (void)saveShop:(UIBarButtonItem * _Nonnull)source;
- (void)viewDidAppear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10Asia_shops6Seznam")
@interface Seznam : UIViewController
@property (nonatomic, strong) IBOutlet UIBarButtonItem * _Null_unspecified Open;
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
