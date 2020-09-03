

import Foundation

public class BaseOperation: Operation {
    
    public enum State {
        case ready
        case executing
        case finished
        
        fileprivate func asKeyPath() -> String {
            switch self {
            case .ready:
                return "isReady"
            case .executing:
                return "isExecuting"
            case .finished:
                return "isFinished"
            }
        }
    }
    
    public var state: State {
        willSet {
            willChangeValue(forKey: newValue.asKeyPath())
            willChangeValue(forKey: state.asKeyPath())
        }
        
        didSet {
            didChangeValue(forKey: oldValue.asKeyPath())
            didChangeValue(forKey: state.asKeyPath())
        }
    }
    
    public override init() {
        state = .ready
        super.init()
    }
    
    // MARK: - NSOperation
    
    public override var isReady: Bool {
        return state == .ready
    }
    
    public override var isExecuting: Bool {
        return state == .executing
    }
    
    public override var isFinished: Bool {
        return state == .finished
    }
    
    public override var isAsynchronous: Bool {
        return true
    }
    
}
