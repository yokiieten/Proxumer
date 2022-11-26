//
//  BaseViewController.swift
//  doctor
//
//  Created by Akkarin Phain on 13/12/2564 BE.
//

import UIKit

protocol BaseDisplayLogic: AnyObject {
    
}

class BaseViewController: UIViewController, BaseDisplayLogic {
        
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent  = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    var window: UIWindow?
    func overrideBackButtonOnLeftSide(color: UIColor = .black, action: Selector = #selector(onBackPressed)) {
        self.navigationController?.navigationBar.isHidden = false
        let backImage = UIImage(named: "back_button")?.withRenderingMode(.alwaysTemplate)
        let overrideBackButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: action)
        overrideBackButton.tintColor = color
        self.navigationItem.leftBarButtonItem = overrideBackButton
    }
    
    func overrideCloseButtonOnLeftSide(color: UIColor = .black, action: Selector = #selector(onBackPressed)) {
        self.navigationController?.navigationBar.isHidden = false
        let backImage = UIImage(named: "icon_close_webview")?.withRenderingMode(.alwaysTemplate)
        let overrideBackButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: action)
        overrideBackButton.tintColor = color
        self.navigationItem.leftBarButtonItem = overrideBackButton
    }
    
    func overrideDismissButtonOnRightSide(color: UIColor = .black, action: Selector = #selector(onDismissPressed)) {
        self.navigationController?.navigationBar.isHidden = false
        let backImage = UIImage(named: "close_x_button")?.withRenderingMode(.alwaysTemplate)
        let overrideBackButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: action)
        overrideBackButton.tintColor = color
        self.navigationItem.rightBarButtonItem = overrideBackButton
    }
    
    func overrideTrashCanButtonOnRightSide(color: UIColor = .black, action: Selector = #selector(trashCanPressed)) {
        self.navigationController?.navigationBar.isHidden = false
        let backImage = UIImage(named: "icon_trashcan")?.withRenderingMode(.alwaysTemplate)
        let overrideBackButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: action)
        overrideBackButton.tintColor = color
        self.navigationItem.rightBarButtonItem = overrideBackButton
    }
    
    func overrideCancelButtonOnRightSide(color: UIColor = .black, action: Selector = #selector(cancelPressed)) {
        let overrideBackButton = UIBarButtonItem(title: "ยกเลิก", style: .plain, target: self, action: action)
        self.navigationController?.navigationBar.isHidden = false
overrideBackButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.kanitRegular16], for: .normal)
        self.navigationItem.rightBarButtonItem = overrideBackButton
    }
    
    @objc func onBackPressed() {
        leftButtonAction?()
    }
    
    @objc func onDismissPressed() {
        rightButtonAction?()
    }
    
    @objc func trashCanPressed() {
        rightButtonAction?()
    }
    
    @objc func cancelPressed() {
        rightButtonAction?()
    }
    
    @objc func deletePressed() {
        rightButtonAction?()
    }
    
    func hideNavigation(_ bool: Bool) {
        self.navigationController?.navigationBar.isHidden = bool
    }
        
    func removeNavigationItem(side: NavigationSide) {
        switch side {
        case .left:
            self.navigationController?.navigationItem.leftBarButtonItem = nil
            self.navigationItem.setHidesBackButton(true, animated: false)
        case .right:
            self.navigationController?.navigationItem.rightBarButtonItem = nil
            self.navigationItem.setRightBarButton(nil, animated: false)
        }
    }
    
    func openDownloadAppPaotang() {
        let urlString = "itms-apps://itunes.apple.com/app/id1324902182"
        if let paotangUrl = URL(string: urlString) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(paotangUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(paotangUrl)
            }
        }
    }
}

enum NavigationSide {
    case left
    case right
}
