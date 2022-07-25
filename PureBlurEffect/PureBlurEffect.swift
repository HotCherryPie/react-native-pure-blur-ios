import UIKit

@objc
open class PureBlurEffect: NSObject {
    private let customBlur = (NSClassFromString("_UICustomBlurEffect") as! UIBlurEffect.Type).init()

    @objc open func getBlurEffect() -> UIBlurEffect {
        return self.customBlur
    }
}
