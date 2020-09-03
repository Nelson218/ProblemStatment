

import Foundation

public enum HTTPStatusCode: Int {
    case success = 200
    case clientError
    case serverError
    case unreachable = -1009
    case notFound
    case noService
    case malformedContent = 599
    case deviceLimitReached
    case subscriptionAlreadyAttached = 617
    case loginDetailsNotFound = 117
    case subscriptionInUse = 118
    case accessDenied = 109
    
    public init(value: Int) {
        switch value {
        case 117: self = .loginDetailsNotFound
        case 118: self = .subscriptionInUse
        case 404: self = .notFound
        case 599: self = .malformedContent
        case 617: self = .subscriptionAlreadyAttached
        case 811: self = .deviceLimitReached
        case -1008 ... -1001: self = .noService
        case 200...299: self = .success
        case 400...499: self = .clientError
        case 500...599: self = .serverError
        case 109: self = .accessDenied
        default: self = .unreachable
        }
    }
}
