
import UIKit

protocol BaseCoOrdinator {
    var rootViewController: UIViewController { set get }
}

extension BaseCoOrdinator {
    var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
