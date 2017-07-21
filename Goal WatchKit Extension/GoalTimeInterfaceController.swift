//
//  GoalTimeInterfaceController.swift
//  Goal
//
//  Created by Luis Arias on 7/21/17.
//  Copyright © 2017 Luis Arias. All rights reserved.
//

import WatchKit
import Foundation


final class GoalTimeInterfaceController: WKInterfaceController {
  
  private var _timeSelected = 0
  
  var timeSelected: Int {
    get {
      return self._timeSelected
    }
    
    set {
      self._timeSelected = newValue <= 0 ? 0 : newValue
    }
  }
  
  @IBOutlet weak var diminishTimeButton: WKInterfaceButton!
  @IBOutlet weak var addTimeButton: WKInterfaceButton!
  @IBOutlet weak var currentTimeLabel: WKInterfaceLabel!
  
  @IBAction func addTime() {
    timeSelected += 5
    currentTimeLabel.setText("\(_timeSelected)")
  }
  
  @IBAction func diminishTime() {
    timeSelected -= 5
    currentTimeLabel.setText("\(_timeSelected)")
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
}
