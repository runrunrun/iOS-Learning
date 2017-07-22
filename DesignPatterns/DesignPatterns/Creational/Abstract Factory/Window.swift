//
//  Window.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// MARK: Products
// Abstract product
protocol Window {
    var title: String { get set }
    
    func resize()
    func redraw()
}

// Concrete product 1
struct MSWindow: Window {
    var title: String
    
    func resize() {
    }
    
    func redraw() {
    }
}

// Concrete product 2
struct MacWindow: Window {
    var title: String
    
    func resize() {
    }
    
    func redraw() {
    }
}

// MARK: Factories
// Abstract factory
protocol WindowFactory {
    func createWindow() -> Window
}

// Concrete factory 1
struct MSWindowFactory: WindowFactory {
    func createWindow() -> Window {
        return MSWindow(title: "MSWindow title")
    }
}

// Concrete factory 2
struct MacWindowFactory: WindowFactory {
    func createWindow() -> Window {
        return MacWindow(title: "Mac title")
    }
}

// MARK: GUI builder
enum WindowType {
    case ms, mac
}

struct GUIBuilder {
    static func windowFactory(_ type: WindowType) -> WindowFactory {
        switch type {
        case .ms:
            return MSWindowFactory()
        case .mac:
            return MacWindowFactory()
        }
    }
}










