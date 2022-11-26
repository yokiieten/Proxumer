//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol BlankBusinessLogic {
    
}

protocol BlankDataStore {

}

class BlankInteractor: BaseInteractor, BlankBusinessLogic, BlankDataStore {
    var presenter: BlankPresentationLogic?
    var worker: BlankWorker?
}
