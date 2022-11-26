//  Created by Sahassawat on 23/11/2565 BE.

import UIKit

protocol SplashBusinessLogic {
    
}

protocol SplashDataStore {

}

class SplashInteractor: BaseInteractor, SplashBusinessLogic, SplashDataStore {
    var presenter: SplashPresentationLogic?
    var worker: SplashWorker?
}
