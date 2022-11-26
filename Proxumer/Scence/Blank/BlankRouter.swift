//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol BlankRoutingLogic {

}

protocol BlankDataPassing {
    var dataStore: BlankDataStore? { get }
}

class BlankRouter: BaseRouter, BlankRoutingLogic, BlankDataPassing {
    var dataStore: BlankDataStore?

}
