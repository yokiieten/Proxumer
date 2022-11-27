

import UIKit

class MainTabBarViewController: UITabBarController {

    var customTabBarView = UIView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.kanitTabarStyle], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.kanitTabarStyle], for: .selected)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setScreenMode()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let sizeToDecrease: CGFloat = 34.0
        tabBar.frame.size.height -= sizeToDecrease
        tabBar.frame.origin.y = view.frame.height - sizeToDecrease
    }

    func setScreenMode() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }

}

class TabBarWithCorners: UITabBar {
    var color: UIColor?
    var radius: CGFloat = 16

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        shapeLayer.shadowOffset = CGSize(width: -4, height: -3)
        shapeLayer.shadowOpacity = 0.5
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [],
            cornerRadii: CGSize(width: radius, height: 0.0))

        return path.cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame = self.frame
        let window = UIApplication.shared.keyWindow
        if #available(iOS 11.0, *) {
            tabFrame.size.height = 65 + (window?.safeAreaInsets.bottom ?? CGFloat.zero)
        } else {
            tabFrame.size.height = 65 + 22
        }
        if #available(iOS 11.0, *) {
            tabFrame.origin.y = self.frame.origin.y + ( self.frame.height - 65 - (window?.safeAreaInsets.bottom ?? CGFloat.zero))
        } else {
            tabFrame.origin.y = self.frame.origin.y + (self.frame.height - (65 - 22))
        }
        self.layer.cornerRadius = 30
        self.frame = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }
}
