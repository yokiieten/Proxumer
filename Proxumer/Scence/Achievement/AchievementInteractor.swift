//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol AchievementBusinessLogic {
    
}

protocol AchievementDataStore {

}

class AchievementInteractor: BaseInteractor, AchievementBusinessLogic, AchievementDataStore {
    var presenter: AchievementPresentationLogic?
    var worker: AchievementWorker?
}
