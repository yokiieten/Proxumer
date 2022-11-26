//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomePresentationLogic {
    func presentCell(response: Home.CheckCell.Request)
    
}

class HomePresenter: BasePresenter, HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
  
    // MARK: Do something
    func presentCell(response: Home.CheckCell.Request) {
        
    }

}
