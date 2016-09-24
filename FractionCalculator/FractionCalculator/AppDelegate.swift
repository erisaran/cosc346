//
//  AppDelegate.swift
//  FractionCalculator
//
//  Created by Benjaman Dutton on 9/6/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var display: NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func clickDigit(sender: NSButton) {
        let digit: Int = sender.tag
        display.stringValue += "\(digit)"
    }

    @IBAction func clickAdd(sender: NSButton) {
        display.stringValue += "+"
    }
    
    @IBAction func clickSubtract(sender: NSButton) {
        display.stringValue += "-"
    }
    
    @IBAction func clickMultiply(sender: NSButton) {
        display.stringValue += "*"
    }
    
    @IBAction func clickDivide(sender: NSButton) {
        display.stringValue += "/"
    }
    
    @IBAction func clickClear(sender: NSButton) {
        display.stringValue = ""
    }
    
    @IBAction func clickEquals(sender: NSButton) {
        if let result = Parser<Fraction>.evaluate(display.stringValue) {
            display.stringValue += "=\(result)"
        } else {
            display.stringValue = "Error"
        }
    }
}

