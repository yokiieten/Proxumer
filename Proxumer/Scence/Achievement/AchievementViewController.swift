//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol AchievementDisplayLogic: BaseDisplayLogic {
}

class AchievementViewController: BaseViewController {
    var interactor: AchievementBusinessLogic?
    var router: (AchievementRoutingLogic & AchievementDataPassing)?
    @IBOutlet weak var achievementCollectionView: UICollectionView!
    // MARK: Object lifecycle
  
    override public func awakeFromNib() {
        super.awakeFromNib()
        configure(viewController: self)
        hideNavigation(true)
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
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        achievementCollectionView.registerCells(classNames: [AchievementCollectionViewCell.reuseIdentifer])
        achievementCollectionView.delegate = self
        achievementCollectionView.dataSource = self
    }

}

extension AchievementViewController: AchievementDisplayLogic {
    
}

extension AchievementViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCollectionViewCell.reuseIdentifer, for: indexPath) as? AchievementCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
}

extension AchievementViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        return CGSize(width: ((collectionView.frame.width - (padding * 4)) / 3) , height: ((collectionView.frame.width ) / 3))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
    }
}

