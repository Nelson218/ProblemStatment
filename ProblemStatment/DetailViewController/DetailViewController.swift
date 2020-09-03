
import UIKit
import ProbStatmentLib

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    internal var country: Country!
    internal var goBack: (() -> Void) = {  }
    
    override func viewDidLoad() {
        titleLabel.text = country.name
    }
    
    @IBAction func goBackCTA() {
        goBack()
    }
}
