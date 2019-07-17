//
//  PreferencesWindow.swift
//  macos-meter
//
//  Created by Ignacio Jara on 16-07-19.
//  Copyright © 2019 Ignacio Jara. All rights reserved.
//

import Cocoa

protocol PreferencesWindowDelegate {
    func preferencesDidUpdate()
}
class PreferencesWindow: NSWindowController, NSWindowDelegate {
    let DEFAULT_CITY = "Santiago,CL"

    var delegate: PreferencesWindowDelegate?

    @IBOutlet weak var cityTextField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        let defaults = UserDefaults.standard
        let city = defaults.string(forKey: "city") ?? DEFAULT_CITY
        cityTextField.stringValue = city
    }
    override var windowNibName : String! {
        return "PreferencesWindow"
    }
    func windowWillClose(_ notification: Notification) {
        let defaults = UserDefaults.standard
        defaults.setValue(cityTextField.stringValue, forKey: "city")
        delegate?.preferencesDidUpdate()

    }
    
}
