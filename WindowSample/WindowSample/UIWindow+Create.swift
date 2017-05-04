//
//  UIWindow+Create.swift
//  WindowSample
//
//  Created by Hari Kunwar on 5/4/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

extension UIWindow {
    final class StatusBarPreferringViewController: UIViewController {
        // MARK: - Inputs

        private let statusBarStyle: UIStatusBarStyle

        // MARK: - Initialization

        init(statusBarStyle: UIStatusBarStyle) {
            self.statusBarStyle = statusBarStyle
            super.init(nibName: nil, bundle: nil)
        }
        

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - UIViewController

        override var prefersStatusBarHidden: Bool {
            return false
        }

        override var preferredStatusBarStyle: UIStatusBarStyle {
            return statusBarStyle
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.green
        }
    }
    
    static func newWindow(level: UIWindowLevel = UIWindowLevelStatusBar, statusBarStyle: UIStatusBarStyle) -> UIWindow {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            fatalError("Must have a key window")
        }
        
        let window = UIWindow(frame: keyWindow.bounds)
        window.windowLevel = level
        window.isHidden = false
        window.rootViewController = StatusBarPreferringViewController(statusBarStyle: statusBarStyle)
        return window
    }
}
