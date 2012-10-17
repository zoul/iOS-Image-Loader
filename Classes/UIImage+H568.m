#import "UIImage+H568.h"
#include <objc/runtime.h>

@implementation UIImage(H568)

+ (void) load
{
    if  (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone) {
        // Running on iPad, nothing to change.
        return;
    }

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    BOOL tallDevice = (screenBounds.size.height > 480);
    if (!tallDevice) {
        // Running on a 320✕480 device, nothing to change.
        return;
    }

    method_exchangeImplementations(
        class_getClassMethod(self, @selector(imageNamed:)),
        class_getClassMethod(self, @selector(imageNamedH568:))
    );
}

+ (UIImage*) imageNamedH568: (NSString*) imageName
{
    NSString *tallImageName = [imageName stringByAppendingString:@"-568h@2x"];
    NSString *tallImagePath = [[NSBundle mainBundle] pathForResource:tallImageName ofType:@"png"];
    // Note that this is not a recursive call. Since we have exchanged the
    // method implementations for +imageNamed: and +imageNamedH568:, calling
    // +imageNamedH568 now calls the original +imageNamed: implementation.
    return [UIImage imageNamedH568:tallImagePath ? tallImageName : imageName];
}

@end