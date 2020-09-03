
import Foundation

public protocol FilterOperationDelegate: class {
    func onFinish(countries: [Country])
}

public class FilterOperation: BaseOperation {
    
    private let countries: [Country]
    public var regionCountries = [Country]()
    
    public init(countries: [Country]) {
        self.countries = countries
        super.init()
    }
    
    public override func start() {
        guard !isCancelled else { return }
        
        for country in countries {
            
            var region = ""
            switch AppConfiguration.default.currentEnvironment {
                case .QA, .Prod: region = "Asia"
                case .Dev: region = "Americas"
            }
            
            if country.region == region {
                regionCountries.append(country)
            }
        }
    }
}
