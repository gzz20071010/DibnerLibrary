// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
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
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class DropDown;
@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UITextField;
@class UIButton;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC16DibnerLibraryApp10AddPlantVC")
@interface AddPlantVC : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified roomNumber;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified dateBtn;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified hourBtn;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified minBtn;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified dateBtn2;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified hrBtn2;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified minBtn2;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, readonly, strong) DropDown * _Nonnull dropDown;
@property (nonatomic, readonly, strong) DropDown * _Nonnull dropDown2;
@property (nonatomic, readonly, strong) DropDown * _Nonnull dropDown3;
@property (nonatomic, readonly, strong) DropDown * _Nonnull dropDown4;
@property (nonatomic, readonly, strong) DropDown * _Nonnull dropDown5;
@property (nonatomic, readonly, strong) DropDown * _Nonnull dropDown6;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (IBAction)onDropDownBtnPressed:(id _Nonnull)sender;
- (IBAction)onHourBtnPressed:(id _Nonnull)sender;
- (IBAction)onMinBtnPressed:(id _Nonnull)sender;
- (IBAction)onDate2Pressed:(id _Nonnull)sender;
- (IBAction)onHr2Pressed:(id _Nonnull)sender;
- (IBAction)onMin2Pressed:(id _Nonnull)sender;
- (IBAction)onCheckBtnPressed:(id _Nonnull)sender;
- (IBAction)onAddPressed:(id _Nonnull)sender;
- (IBAction)onCancelPressed:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC16DibnerLibraryApp11AppDelegate")
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

@class Firebase;

SWIFT_CLASS("_TtC16DibnerLibraryApp6HomeVC")
@interface HomeVC : UIViewController
@property (nonatomic, strong) Firebase * _Null_unspecified ref;
- (void)viewDidLoad;
- (IBAction)waterBtnPressed:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIBarButtonItem;

SWIFT_CLASS("_TtC16DibnerLibraryApp5MapVC")
@interface MapVC : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room401;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room402;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room403;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room410;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room404;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room411;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room405;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room406;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room407;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified room409;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop1;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop2;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop3;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop4;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop5;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop6;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop7;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified laptop8;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, copy) NSDictionary<NSString *, id> * _Nonnull libraryStatus;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)updateMap;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC16DibnerLibraryApp6MenuVC")
@interface MenuVC : UITableViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;

SWIFT_CLASS("_TtC16DibnerLibraryApp8RoomCell")
@interface RoomCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified roomNumbLb;
- (void)awakeFromNib;
- (void)parseData:(NSInteger)x;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC16DibnerLibraryApp9SideOneVC")
@interface SideOneVC : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull reservations;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC16DibnerLibraryApp11SideThreeVC")
@interface SideThreeVC : UIViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC16DibnerLibraryApp9SideTwoVC")
@interface SideTwoVC : UIViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
- (void)viewDidLoad;
- (IBAction)onLogOutPressed:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface UIColor (SWIFT_EXTENSION(DibnerLibraryApp))
- (nonnull instancetype)initWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (nonnull instancetype)initWithNetHex:(NSInteger)netHex;
@end


SWIFT_CLASS("_TtC16DibnerLibraryApp14ViewController")
@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified usernmaTF;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified passwordTF;
- (void)viewDidLoad;
- (IBAction)signinBtnPressed:(id _Nonnull)sender;
- (IBAction)signupBtnPressed:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC16DibnerLibraryApp15reservationCell")
@interface reservationCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified textLb;
- (void)awakeFromNib;
- (void)parseData:(NSInteger)x;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop