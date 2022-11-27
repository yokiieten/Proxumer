//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomeRoutingLogic {
    func routeToGoal()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: BaseRouter, HomeRoutingLogic, HomeDataPassing {
    var dataStore: HomeDataStore?
    
    func routeToGoal() {
        let vc = getViewController(storyboard: .Goal, expectedVC: GoalViewController.self)
        pushViewController(vc)
    }

}
