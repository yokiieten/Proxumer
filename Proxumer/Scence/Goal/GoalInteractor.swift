//  Created by Sahassawat on 27/11/2565 BE.

import UIKit

protocol GoalBusinessLogic {
    
}

protocol GoalDataStore {

}

class GoalInteractor: BaseInteractor, GoalBusinessLogic, GoalDataStore {
    var presenter: GoalPresentationLogic?
    var worker: GoalWorker?
}
