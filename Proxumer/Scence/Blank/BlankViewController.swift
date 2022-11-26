//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol BlankDisplayLogic: BaseDisplayLogic {
}

class BlankViewController: BaseViewController {
    var interactor: BlankBusinessLogic?
    var router: (BlankRoutingLogic & BlankDataPassing)?

    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
    }
  
    // MARK: Setup
  
    func configure(viewController: BlankViewController) {
        let interactor = BlankInteractor()
        let presenter = BlankPresenter()
        let router = BlankRouter()
        let worker = BlankWorker()
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

extension BlankViewController: BlankDisplayLogic {
    
}
