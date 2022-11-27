//  Created by Sahassawat on 27/11/2565 BE.

import UIKit

protocol GoalDisplayLogic: BaseDisplayLogic {
}

class GoalViewController: BaseViewController {
    var interactor: GoalBusinessLogic?
    var router: (GoalRoutingLogic & GoalDataPassing)?
    
    @IBOutlet weak var goalCollectionView: UICollectionView!
    // MARK: Object lifecycle
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
        hideNavigation(true)
    }
    
    // MARK: Setup
    
    func configure(viewController: GoalViewController) {
        let interactor = GoalInteractor()
        let presenter = GoalPresenter()
        let router = GoalRouter()
        let worker = GoalWorker()
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
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        goalCollectionView.registerCells(classNames: [GoalCollectionViewCell.reuseIdentifer])
        goalCollectionView.delegate = self
        goalCollectionView.dataSource = self
    }
    
}

extension GoalViewController: GoalDisplayLogic {
    
}

extension GoalViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalCollectionViewCell.reuseIdentifer, for: indexPath) as? GoalCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
}

extension GoalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 24
        return CGSize(width: ((collectionView.frame.width - (padding * 4)) / 3.01) , height: ((collectionView.frame.height) / 2))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
}


