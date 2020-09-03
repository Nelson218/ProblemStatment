

import Foundation

public struct Countries: Decodable {
    public let results: [Country]
}

public struct Country: Decodable {
    public let name: String
    public let capital: String
    public let region: String
    public let population: Int
    public var currencies: [String]
    public var borders: [String]
    public var latlng: [Float]
}
