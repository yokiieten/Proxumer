//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol AchievementDisplayLogic: BaseDisplayLogic {
}

class AchievementViewController: BaseViewController {
    var interactor: AchievementBusinessLogic?
    var router: (AchievementRoutingLogic & AchievementDataPassing)?

    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }
  
    // MARK: Setup
  
    func configure(viewController: AchievementViewController) {
        let interactor = AchievementInteractor()
        let presenter = AchievementPresenter()
        let router = AchievementRouter()
        let worker = AchievementWorker()
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

extension AchievementViewController: AchievementDisplayLogic {
    
}
