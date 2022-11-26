//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol AchievementRoutingLogic {

}

protocol AchievementDataPassing {
    var dataStore: AchievementDataStore? { get }
}

class AchievementRouter: BaseRouter, AchievementRoutingLogic, AchievementDataPassing {
    var dataStore: AchievementDataStore?

}
