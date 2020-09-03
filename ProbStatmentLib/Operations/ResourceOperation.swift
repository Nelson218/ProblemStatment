

import Foundation

public final class ResourceOperation<T>: BaseOperation {

    public private(set) var resource: Resource<T>
    private let completion: (ServiceResult<T>) -> Void

    internal init(resource: Resource<T>, completion: @escaping (ServiceResult<T>) -> Void) {
        self.resource = resource
        self.completion = completion
    }

    public override func start() {
        guard !isCancelled else { return }

        _ = Service<T>(resource: resource) { (result: ServiceResult<T>) in
            guard !self.isCancelled else { return }
            self.completion(result)
        }
    }
    
}
