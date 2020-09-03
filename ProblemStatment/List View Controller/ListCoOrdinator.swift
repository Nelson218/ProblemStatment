
import UIKit
import ProbStatmentLib

final class ListCoOrdinator: BaseCoOrdinator {
    var rootViewController: UIViewController = UIViewController()
    
    init() {
        let listViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listViewController.onSelection = onSelectionOfCountry
        let navController = UINavigationController(rootViewController: listViewController)
        navController.navigationBar.isHidden = true
        rootViewController = navController
    }
    
    private func onSelectionOfCountry(country: Country?) {
        guard let country = country else { return }
        let detailCoordinator = DetailCoOrdinator(country: country)
        if let rootViewController = rootViewController as? UINavigationController {
            rootViewController.pushViewController(detailCoordinator.rootViewController, animated: true)
        }
    }
}
