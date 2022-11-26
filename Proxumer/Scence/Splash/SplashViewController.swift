//  Created by Sahassawat on 23/11/2565 BE.

import UIKit

protocol SplashDisplayLogic: BaseDisplayLogic {
}

class SplashViewController: BaseViewController {
    var interactor: SplashBusinessLogic?
    var router: (SplashRoutingLogic & SplashDataPassing)?

    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }
  
    // MARK: Setup
  
    func configure(viewController: SplashViewController) {
        let interactor = SplashInteractor()
        let presenter = SplashPresenter()
        let router = SplashRouter()
        let worker = SplashWorker()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension SplashViewController: SplashDisplayLogic {
    
}
