

import UIKit
import ProbStatmentLib

final class DetailCoOrdinator: BaseCoOrdinator {
    var rootViewController: UIViewController = UIViewController()
    
    init(country: Country) {
        let detailController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.country = country
        detailController.goBack = goBack
        rootViewController = detailController
    }
    
    private func goBack() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
