//
//  ViewController.swift
//  JavaScriptCore
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 personal. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //JSContext is an environment for running JavaScript code
        // After creating a JSContext, it's easy to run JavaScript code that creates variables, does calculations, or even defines functions:
        let context = JSContext()
        context.evaluateScript("var num = 5 + 5")
        context.evaluateScript("var names = ['Grace', 'Ada', 'Margaret']")
        context.evaluateScript("var triple = function(value) { return value * 3 }")
        let tripleNum: JSValue = context.evaluateScript("triple(num)")
        println("Tripled: \(tripleNum.toInt32())")
        
        let tripleFunction = context.objectForKeyedSubscript("triple")
        let result = tripleFunction.callWithArguments([5])
        println("Five tripled: \(result.toInt32())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

