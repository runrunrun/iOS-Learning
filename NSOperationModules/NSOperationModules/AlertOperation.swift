//
//  AlertOperation.swift
//  NSOperationModules
//
//  Created by Hari Kunwar on 8/8/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

enum State {
    case Ready, Executing, Finished
    
    func keyPath() -> String {
        switch self {
        case .Ready:
            return "isReady"
        case .Executing:
            return "isExecuting"
        case .Finished:
            return "isFinished"
        }
    }
}

class AlertOperation : Operation {
    var title = ""
    var message = ""
    var presentingViewController: UIViewController?
    // MARK: - Properties
    var state = State.Ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath())
            willChangeValue(forKey: state.keyPath())
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath())
            didChangeValue(forKey: state.keyPath())
        }
    }
    
    init(viewController: UIViewController) {
        presentingViewController = viewController
    }
    
    // main is the method you override in Operation subclasses to actually perform work.
    override func main() {
        state = .Executing

        let alertController = UIAlertController(title: "Default Style", message: "A standard alert.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.state = .Finished
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.state = .Finished
        }
        alertController.addAction(OKAction)
        
        DispatchQueue.main.async {
            if let viewController = self.presentingViewController  {
                viewController.present(alertController, animated: true, completion: {
                })
            }
        }
    }
    
    // MARK: - Action methods
//    override func start() {
//    
//    }
    
    override func cancel() {
        super.cancel()
        state = .Finished
    }
    
    // MARK: - State methods
    override var isReady: Bool {
        return state == .Ready
    }
    
    override var isExecuting: Bool {
        return state == .Executing
    }
    
    override var isFinished: Bool {
        return state == .Finished
    }

//    override var isConcurrent: Bool {
//        return true
//    }
}

