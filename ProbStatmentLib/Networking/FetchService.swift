
import Foundation
public final class BackgroundThread {

    private let queue: OperationQueue
    public static let shared: BackgroundThread = BackgroundThread()

    private init() {
        queue = OperationQueue()
        queue.name = "BackgroundThread"
        queue.maxConcurrentOperationCount = 1
    }
    
    public func add<T>(Resource resource: Resource<T>, onFinish: @escaping (ServiceResult<T>) -> Void) {
        let op = ResourceOperation(resource: resource) { (result) in
            onFinish(result)
        }
        queue.addOperation(op)
    }
    
    public func add(Operation operation: BaseOperation) {
        queue.addOperation(operation)
    }
}
