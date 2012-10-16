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
    NSMutableString *mutableImageName = [imageName mutableCopy];

    // Strip extension if supplied
    NSRange extension = [imageName rangeOfString:@".png" options:NSBackwardsSearch | NSAnchoredSearch];
    if (extension.location != NSNotFound) {
        [mutableImageName deleteCharactersInRange:extension];
    }

    // Insert the -568h marker at correct position
    NSRange retinaMarker = [imageName rangeOfString:@"@2x"];
    if (retinaMarker.location != NSNotFound) {
        [mutableImageName insertString:@"-568h" atIndex:retinaMarker.location];
    } else {
        [mutableImageName appendString:@"-568h@2x"];
    }
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:mutableImageName ofType:@"png"];

    if (imagePath) {
        // The -568h image version exists, remove the @2x to load with
        // correct scale and call the original method implementation
        [mutableImageName replaceOccurrencesOfString:@"@2x" withString:@""
            options:NSBackwardsSearch range:NSMakeRange(0, [mutableImageName length])];
        return [UIImage imageNamedH568:mutableImageName];
    } else {
        // The -568h image version does not exist, call original method
        return [UIImage imageNamedH568:imageName];
    }
}

@end