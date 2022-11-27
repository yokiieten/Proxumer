//  Created by Sahassawat on 27/11/2565 BE.

import UIKit

protocol GoalRoutingLogic {

}

protocol GoalDataPassing {
    var dataStore: GoalDataStore? { get }
}

class GoalRouter: BaseRouter, GoalRoutingLogic, GoalDataPassing {
    var dataStore: GoalDataStore?

}
