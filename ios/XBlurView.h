#import <UIKit/UIKit.h>
#import <React/RCTView.h>

@interface XBlurView : RCTView

@property (nonatomic) BOOL vibrant;
@property (nonatomic, copy) NSNumber *blurRadius;
@property (nonatomic, copy) UIColor *tintColor;

@end
