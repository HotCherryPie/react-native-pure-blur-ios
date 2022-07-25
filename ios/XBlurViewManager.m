#import "XBlurViewManager.h"

@implementation XBlurViewManager

RCT_EXPORT_MODULE();

- (UIView *)view
{
    return [[XBlurView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(vibrant, BOOL);
RCT_EXPORT_VIEW_PROPERTY(blurRadius, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor);

// RCT_EXPORT_VIEW_PROPERTY(tintOpacity, CGFloat);

@end
