

import Foundation

public struct Resource<T> {
    internal var urlRequest: URLRequest
    internal var parse: ((Data) -> T?)?
}

extension Resource {
    internal init(forURL: String, Configuration appConfiguration: AppConfiguration) {
        
        let urlString = appConfiguration.baseURL.rawValue + "\(forURL)"
        guard let url = URL(string: urlString) else  {
            fatalError("Error while constructing url \(forURL)")
        }
               
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = appConfiguration.httpMethod.rawValue
        self.urlRequest.allHTTPHeaderFields = appConfiguration.headers
        
        parse = { (data) in
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? T {
                return json
            }
                              
            if let string = String(data: data, encoding: .utf8) {
                if T.self == Int.self, let integer = Int(string) as? T {
                    return integer
                }
                if T.self == Float.self, let integer = Float(string) as? T {
                    return integer
                }
                if let _string = string as? T {
                    return _string
                }
            }
            return nil
        }
    }
}

extension Resource where T: Decodable {
    internal init(forURL: String, Configuration appConfiguration: AppConfiguration = .default, decoder: JSONDecoder) {
        self.init(forURL: forURL, Configuration: appConfiguration)
        parse = { (data) in
            return try? decoder.decode(T.self, from: data)
        }
    }
}
