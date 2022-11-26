//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomeDisplayLogic: BaseDisplayLogic {
}

class HomeViewController: BaseViewController {
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?

    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }
  
    // MARK: Setup
  
    func configure(viewController: HomeViewController) {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()
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

extension HomeViewController: HomeDisplayLogic {
    
}
