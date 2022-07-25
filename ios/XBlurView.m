// http://developer.limneos.net/index.php?ios=11.1.2&framework=UIKit.framework&header=_UIBackdropViewSettings.h
// https://github.com/voronianski/react-native-effects-view
// https://github.com/efremidze/VisualEffectView

#import "XBlurView.h"

@import PureBlurEffect;

@interface XBlurView ()

@property (nonatomic, strong) UIVisualEffectView *effectsView;
@property (nonatomic, strong) UIBlurEffect *blurEffect;

@end

@implementation XBlurView

- (instancetype)init
{
    self = [super init];
    return self;
}

// - (instancetype)initWithFrame:(CGRect)frame {
//     if (self = [super initWithFrame:frame]) {
//         self.blurEffect = [[[PureBlurEffect alloc] init] getBlurEffect];
//         self.effectsView = [[UIVisualEffectView alloc] initWithEffect:self.blurEffect];

//         // self.effectsView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//         // self.effectsView.frame = frame;

//         self.blurRadius = @0;

//         [self updateBlurEffect];

//         // self.clipsToBounds = true;

//         [self insertSubview:self.effectsView atIndex:[self.subviews count]];

//         // if (self.vibrant == YES) {
//         //     UIBlurEffect *vibrancyBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//         //     UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:vibrancyBlurEffect];
//         //     UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
//         //     [vibrancyEffectView setFrame:self.bounds];

//         //     [[vibrancyEffectView contentView] addSubview:self.subviews[0]];
//         //     [[self.effectsView contentView] addSubview:vibrancyEffectView];
//         // }

//         UIBlurEffect *vibrancyBlurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//         UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:vibrancyBlurEffect];
//         UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
//         [vibrancyEffectView setFrame:self.bounds];

//         [[vibrancyEffectView contentView] addSubview:self.subviews[0]];
//         [[self.effectsView contentView] addSubview:vibrancyEffectView];
//     }

//     return self;
// }

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.effectsView setFrame:self.bounds];

    if ([self.subviews containsObject:self.effectsView] == NO) {
        UIBlurEffect *blurEffectSurrogate = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        self.blurEffect = [[[PureBlurEffect alloc] init] getBlurEffect];

        // [self.blurEffect setValue:[NSNumber numberWithFloat:2.0] forKeyPath:@"saturationDeltaFactor"];
        // [self.blurEffect setValue:[NSNumber numberWithFloat:2.0] forKeyPath:@"zoom"];

        [self.blurEffect setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"scale"];
        [self.blurEffect setValue:self.blurRadius forKeyPath:@"blurRadius"];
        // [self.blurEffect setValue:[UIColor colorWithRed:0.06 green:0.07 blue:0.10 alpha:1.0] forKeyPath:@"colorTint"];
        // [self.blurEffect setValue:[NSNumber numberWithFloat:0.5] forKeyPath:@"colorTintAlpha"];

        self.effectsView = [[UIVisualEffectView alloc] initWithEffect:self.blurEffect];

        [self.effectsView setFrame:self.bounds];
        [self insertSubview:self.effectsView atIndex:[self.subviews count]];

        if (self.vibrant == YES) {
            UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffectSurrogate];
            UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
            [vibrancyEffectView setFrame:self.bounds];

            [[vibrancyEffectView contentView] addSubview:self.subviews[0]];
            [[self.effectsView contentView] addSubview:vibrancyEffectView];
        }
    }
}

- (void)setBlurRadius:(NSNumber*)radius
{
    if (radius && ![self.blurRadius isEqualToNumber:radius]) {
        _blurRadius = radius;
        [self updateBlurEffect];
    }
}

- (void)updateBlurEffect
{
    [self.blurEffect setValue:self.blurRadius forKeyPath:@"blurRadius"];
    [self.effectsView setEffect:self.blurEffect];
}

@end
