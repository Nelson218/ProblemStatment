
import Foundation

public typealias JSONDictionary = [String: Any]

extension Country {
    
    private enum EndPoints: String {
        case root = "all"
    }
    
    public static func fetch(completionHandler: @escaping ([Self]) -> Void, failure: @escaping (ErrorConfig) -> Void) {
        let resource = Resource<[Self]>(forURL: EndPoints.root.rawValue, decoder: JSONDecoder())
        BackgroundThread.shared.add(Resource: resource) { (result) in
            if let value = result.value {
                completionHandler(value)
            } else {
                failure(ErrorConfig(statusCode: result.statusCode, error: result.error))
            }
        }
    }
}
