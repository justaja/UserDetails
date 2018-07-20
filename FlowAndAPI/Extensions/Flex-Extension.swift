
import FlexLayout
import UIKit

extension Flex {
    
    func cornerRadius(_ value: CGFloat) -> Flex {
        if let host = self.view {
            host.layer.cornerRadius = value
            host.layer.masksToBounds = true
            return self
        } else {
            preconditionFailure("Trying to modify deallocated host view")
        }
    }
    
    func shadow(offset: CGSize, radius: CGFloat, opacity: Float) -> Flex {
        if let host = self.view {
            host.layer.shadowOffset = offset
            host.layer.shadowRadius = radius
            host.layer.shadowOpacity = opacity
            return self
        } else {
            preconditionFailure("Trying to modify deallocated host view")
        }
    }
}
