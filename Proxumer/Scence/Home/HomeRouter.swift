//  Created by Sahassawat on 26/11/2565 BE.

import UIKit

protocol HomeRoutingLogic {

}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: BaseRouter, HomeRoutingLogic, HomeDataPassing {
    var dataStore: HomeDataStore?

}
