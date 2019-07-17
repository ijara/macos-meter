//
//  StatusMenuController.swift
//  macos-meter
//
//  Created by Ignacio Jara on 14-07-19.
//  Copyright © 2019 Ignacio Jara. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject , PreferencesWindowDelegate , WeatherAPIDelegate {

    //outlets
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var weatherView: WeatherView!
   
    //var
    var weatherMenuItem: NSMenuItem!
    var weatherAPI: WeatherAPI!
    var preferencesWindow: PreferencesWindow!
    //let
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    
    @IBAction func preferencesClicked(_ sender: NSMenuItem) {
        preferencesWindow.showWindow(nil)
    }
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
    }
    
    
    @IBAction func updateClicked(_ sender: NSMenuItem) {
        updateWeather()
    }

    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true // best for dark mode
        //statusItem.image = icon
        statusItem.title = "loading"
        statusItem.menu = statusMenu
        weatherAPI = WeatherAPI(delegate: self)
        weatherMenuItem = statusMenu.item(withTitle: "weather")
        weatherMenuItem.view = weatherView
        preferencesWindow = PreferencesWindow()
        preferencesWindow.delegate = self as PreferencesWindowDelegate
        updateWeather()
       
    }
    func preferencesDidUpdate() {
        updateWeather()
    }
    func weatherDidUpdate(_ weather: Weather) {
        NSLog(weather.description)
    }
    func updateWeather() {
        let DEFAULT_CITY = "Santiago,CL"

        let defaults = UserDefaults.standard
        let city = defaults.string(forKey: "city") ?? DEFAULT_CITY
        weatherAPI.fetchWeather(city) {
            weather in self.weatherView.update(weather)
            self.statusItem.title = weather.description
        }
    }
   
}
