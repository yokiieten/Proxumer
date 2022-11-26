

import UIKit

enum Storyboard: String {
    case MainTabBar = "MainTabBarViewController"
    case Home = "HomeViewController"
    case Setting = "SettingViewController"
    case Contact = "ContactViewController"
    case WebMedicalCouncil = "WebMedicalCouncilViewController"
    case PaotangID = "PaotangIDViewController"
    case Profile = "ProfileViewController"
    case EditProfile = "EditProfileViewController"
    case Login = "LoginViewController"
    case ScanHIE = "ScanHIEViewController"
    case MDCard = "MDCardViewController"
    case MDCardPreview = "MDCardPreviewViewController"
    case ActionSheet = "ActionSheetViewController"
    case ConfirmOTP = "ConfirmOTPViewController"
    case EditProfilePreview = "EditProfilePreviewViewController"
    case PinApp = "PinAppViewController"
    case LoginOnboard = "LoginOnboardViewController"
    case LoginProcessDetail = "LoginProcessDetailViewController"
    case SyncData = "SyncDataViewController"
    case SplashViewController = "SplashViewController"
    case CredentialPreview = "CredentialPreviewViewController"
    case CredentialGuideInfo = "CredentialGuideInfoViewController"
    case ActivateBiometric = "ActivateBiometricViewController"
    case ActivateBiometricSecondStyle = "ActivateBiometricSecondStyleViewController"
    case ConfirmMDCard = "ConfirmMDCardViewController"
    case Notifications = "NotificationsViewController"
    case SettingMasked = "SettingMaskedViewController"
    case Consent = "ConsentViewController"
    case TermAndCondition = "TermAndConditionViewController"
    case CommonWebView = "CommonWebViewViewController"
    case Privilege = "PrivilegeViewController"
    case EVote = "EVoteViewController"
    case DraftTMCConsult = "DraftTMCConsultViewController"
    case TMCConsult = "TMCConsultViewController"
    case ViewSentMessage = "ViewSentMessageViewController"
    case ViewImage = "ViewImageViewController"
    case PDF = "PDFViewController"
    case CCMEScore = "CCMEScoreViewController"
    case CCMEInfo = "CCMEInfoViewController"
    case MedicalCertificate = "MedicalCertificateViewController"
    case MedicalCertificateFilter = "MedicalCertificateFilterViewController"
    case CommonDatePicker = "CommonDatePickerViewController"
    case MDCardRegistrationStep = "MDCardRegistrationStepViewController"
    case MDCardInProcess = "MDCardInProcessViewController"
    case MDCardPersonalInfo = "MDCardPersonalInfoViewController"
    case MDCardAddressInfo = "MDCardAddressInfoViewController"
    case MDCardWorkPlaceInfo = "MDCardWorkPlaceInfoViewController"
    case MDCardDocumentUpload = "MDCardDocumentUploadViewController"
    case MDCardConfirmInfo = "MDCardConfirmInfoViewController"
    case MDCardPayment = "MDCardPaymentViewController"
    case MDCardPaymentStatus = "MDCardPaymentStatusViewController"
    case MDCardUploadFailed = "MDCardUploadFailedViewController"

    var viewcontrollerId: String {
        return rawValue
    }
    
    var name: String {
        return String(describing: self)
    }
}

class BaseRouter {
    
    internal weak var viewController: UIViewController?
    private var onPushReceivedNotification: NSObjectProtocol?
    
    init() {}
    
    func backToPrevious() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func backToFirstView(){
        guard let viewControllers = viewController?.navigationController?.viewControllers else { return }
        guard let firstViewController = viewControllers.first else { return }
        viewController?.navigationController?.popToViewController(firstViewController, animated: true)
    }
    
    func present(viewController: UIViewController) {
        let navigationControll = UINavigationController(rootViewController: viewController)
        navigationControll.modalPresentationStyle = .fullScreen
        self.viewController?.present(navigationControll, animated: true, completion: nil)
    }
    
    func present(viewController: UIViewController, animated: Bool) {
        let navigationControll = UINavigationController(rootViewController: viewController)
        navigationControll.modalPresentationStyle = .fullScreen
        self.viewController?.present(navigationControll, animated: animated, completion: nil)
    }
    
    func present(viewController: UIViewController, modalPresentationStyle: UIModalPresentationStyle, animated: Bool) {
        let navigationControll = UINavigationController(rootViewController: viewController)
        navigationControll.modalPresentationStyle = modalPresentationStyle
        self.viewController?.present(navigationControll, animated: animated, completion: nil)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        guard self.viewController?.navigationController != nil else {
            viewController.modalPresentationStyle = .fullScreen
            self.viewController?.present(viewController, animated: true, completion: nil)
            return
        }
        viewController.navigationItem.hidesBackButton = true
        pushViewController(viewController, animated: true)
    }
    
    func pushViewControllerWithHidesBackButton(_ viewController: UIViewController) {
        guard self.viewController?.navigationController != nil else {
            viewController.modalPresentationStyle = .fullScreen
            self.viewController?.present(viewController, animated: true, completion: nil)
            return
        }
        viewController.navigationItem.hidesBackButton = true
        pushViewController(viewController, animated: true)
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.viewController?.navigationController else {
            viewController.modalPresentationStyle = .fullScreen
            self.viewController?.present(viewController, animated: animated, completion: nil)
            return
        }
        
        guard let directNavigation = viewController as? UINavigationController else {
            viewController.modalPresentationStyle = .fullScreen
            navigationController.pushViewController(viewController, animated: animated)
            return
        }
        
        directNavigation.modalPresentationStyle = .fullScreen
        self.viewController?.present(directNavigation, animated: animated, completion: nil)
    }
    
    func getViewController<VC: UIViewController>(storyboard: Storyboard, expectedVC: VC.Type) -> VC {
        return UIStoryboard(name: storyboard.name, bundle: nil)
            .instantiateViewController(withIdentifier: storyboard.viewcontrollerId) as! VC
    }
    
    func popToViewController(ofClass: AnyClass) {
        viewController?.navigationController?.popToViewController(ofClass: ofClass)
    }
    
}

extension BaseRouter {
    
    func pushToHome() {
        let controller = getViewController(storyboard: .MainTabBar, expectedVC: MainTabBarViewController.self)
        let nav = UINavigationController(rootViewController: controller)
        nav.setNavigationBarHidden(true, animated: false)
        
        guard let keyWindow = UIApplication.shared.keyWindow else {
            pushViewController(controller)
            return
        }
        
        keyWindow.removeSubviews()
        keyWindow.rootViewController = nav
        keyWindow.makeKeyAndVisible()
        UIView.transition(with: keyWindow,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
}


