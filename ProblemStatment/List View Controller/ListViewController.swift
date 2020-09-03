

import UIKit
import ProbStatmentLib

class ListViewController: UIViewController {

    private var countries: [Country]?
    internal var onSelection: ((Country?) -> Void) = { _ in }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Country.fetch(completionHandler: { (countries) in
            self.filterCountryByRegion(countries: countries)
        }) { (error) in
            
        }
        // Do any additional setup after loading the view.
    }
    
    private func filterCountryByRegion(countries: [Country]) {
        let filterOp = FilterOperation(countries: countries)
        filterOp.completionBlock = {
            self.countries = filterOp.regionCountries
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        BackgroundThread.shared.add(Operation: filterOp)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuse")
        cell.textLabel?.text = countries?[indexPath.row].name ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelection(countries?[indexPath.row])
    }
}
