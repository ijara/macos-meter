//
//  WeatherView.swift
//  macos-meter
//
//  Created by Ignacio Jara on 16-07-19.
//  Copyright © 2019 Ignacio Jara. All rights reserved.
//

import Cocoa

class WeatherView: NSView {

    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var cityTextField: NSTextField!
    @IBOutlet weak var currentConditionsTextField: NSTextField!
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    func update(_ weather: Weather) {
        // do UI updates on the main thread
        DispatchQueue.main.async {
            self.cityTextField.stringValue = weather.city
            self.currentConditionsTextField.stringValue = "\(Int(weather.currentTemp))°C and \(weather.conditions)"
            self.imageView.image = NSImage(named: weather.icon)

        }
    }
}
