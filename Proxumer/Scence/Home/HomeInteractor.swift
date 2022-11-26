//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomeBusinessLogic {
    
}

protocol HomeDataStore {

}

class HomeInteractor: BaseInteractor, HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
}
