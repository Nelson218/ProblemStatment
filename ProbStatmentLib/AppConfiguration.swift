

import Foundation

internal enum HttpMethod: String {
    case post
    case get
    case put
    case delete
    
    internal var rawValue: String {
        switch self {
        case .post: return "POST"
        case .get: return "GET"
        case .put: return "PUT"
        case .delete: return "DELETE"
        }
    }
}

internal enum BaseURL: String {
    case rootAPI
    
    internal var rawValue: String {
        switch self {
        case .rootAPI: return "https://restcountries-v1.p.rapidapi.com/"
        }
    }
}

internal enum Environment  {
    case QA
    case Dev
    case Prod
}

internal struct AppConfiguration {
    internal let host = "restcountries-v1.p.rapidapi.com"
    internal let key = "475eebcce4msh1e04982ca510f1bp148de4jsn7d672619f9c0"
    internal let useQueryString = "true"
    internal let baseURL: BaseURL
    internal let httpMethod: HttpMethod
    internal let headers: Dictionary<String, String>
    internal let currentEnvironment: Environment
    
    internal init(baseURL: BaseURL, HTTPMethodType httpMethod: HttpMethod, currentEnvironment: Environment) {
        self.baseURL = baseURL
        self.httpMethod = httpMethod
        self.currentEnvironment = currentEnvironment
        headers = ["x-rapidapi-host": host,
                   "x-rapidapi-key": key,
                   "useQueryString": useQueryString]
    }
    
    internal static var `default`: AppConfiguration = {
        return AppConfiguration(baseURL: .rootAPI, HTTPMethodType: .get, currentEnvironment: .QA)
    }()
}
