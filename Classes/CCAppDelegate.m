#import "CCAppDelegate.h"
#import "CCImageController.h"

@implementation CCAppDelegate
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [window setRootViewController:[[CCImageController alloc] init]];
    [window makeKeyAndVisible];
    return YES;
}

@end
