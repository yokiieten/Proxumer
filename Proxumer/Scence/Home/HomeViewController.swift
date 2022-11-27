//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomeDisplayLogic: BaseDisplayLogic {
    func displayCell(viewModel: Home.CheckCell.ViewModel)
}

class HomeViewController: BaseViewController {
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?

    @IBOutlet weak var travelCollectionView: UICollectionView!
    @IBOutlet weak var bestOfferCollectionView: UICollectionView!
    @IBOutlet weak var suggestCollectionView: UICollectionView!
    
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
        setupCollectionView()
        hideNavigation(true)
        
    }
    
    private func setupCollectionView() {
        travelCollectionView.registerCells(classNames: [TravelCollectionViewCell.reuseIdentifer])
        travelCollectionView.delegate = self
        travelCollectionView.dataSource = self
        bestOfferCollectionView.registerCells(classNames: [ BestOfferCollectionViewCell.reuseIdentifer])
        bestOfferCollectionView.delegate = self
        bestOfferCollectionView.dataSource = self
        suggestCollectionView.registerCells(classNames: [SuggestCollectionViewCell.reuseIdentifer])
        suggestCollectionView.delegate = self
        suggestCollectionView.dataSource = self
    }
    
    @IBAction func newGoal(_ sender: Any) {
        router?.routeToGoal()
    }
    
}

extension HomeViewController: HomeDisplayLogic {
    
    func displayCell(viewModel: Home.CheckCell.ViewModel) {
        
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case bestOfferCollectionView: break
        case suggestCollectionView: break
        default:  break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case travelCollectionView: return 50
        case bestOfferCollectionView: return 10
        case suggestCollectionView: return 10
        default:  return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case travelCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCell.reuseIdentifer, for: indexPath) as? TravelCollectionViewCell else { return UICollectionViewCell() }
            cell.borderColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.1871724427, green: 0.4786525965, blue: 0, alpha: 1) : #colorLiteral(red: 0.7844778895, green: 0.2872895896, blue: 0.01326005813, alpha: 1)
            cell.borderWidth = 3
            return cell
    
        case bestOfferCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestOfferCollectionViewCell.reuseIdentifer, for: indexPath) as? BestOfferCollectionViewCell else { return UICollectionViewCell() }

            return cell
        case suggestCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestCollectionViewCell.reuseIdentifer, for: indexPath) as? SuggestCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:  return UICollectionViewCell()
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case travelCollectionView:
            return CGSize(width: (collectionView.frame.width * 0.6), height: collectionView.frame.height)
        case bestOfferCollectionView:
            return CGSize(width: (collectionView.frame.width * 0.5), height: collectionView.frame.height)
        case suggestCollectionView:
            return CGSize(width: (collectionView.frame.width * 0.5), height: collectionView.frame.height)
        default: return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case travelCollectionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        case bestOfferCollectionView:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case suggestCollectionView:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default: return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
}
