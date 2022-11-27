//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomeRoutingLogic {
    func routeToAchievement()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: BaseRouter, HomeRoutingLogic, HomeDataPassing {
    var dataStore: HomeDataStore?
    
    func routeToAchievement() {
        let vc = getViewController(storyboard: .Achievement, expectedVC: AchievementViewController.self)
        pushViewController(vc)
    }

}
