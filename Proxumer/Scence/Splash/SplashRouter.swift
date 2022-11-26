//  Created by Sahassawat on 23/11/2565 BE.

import UIKit

protocol SplashRoutingLogic {
 func routeToHome()
}

protocol SplashDataPassing {
    var dataStore: SplashDataStore? { get }
}

class SplashRouter: BaseRouter, SplashRoutingLogic, SplashDataPassing {
    var dataStore: SplashDataStore?

    
    func routeToHome() {
        self.pushToHome()
    }
}
