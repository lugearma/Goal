//
//  GoalTimeInterfaceController.swift
//  Goal
//
//  Created by Luis Arias on 7/21/17.
//  Copyright © 2017 Luis Arias. All rights reserved.
//

import WatchKit
import Foundation

enum TimeSelectorType {
  
  case timeForEntireSession
  case timeForRound
  
  var mainColor: UIColor {
    switch self {
    case .timeForEntireSession: return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    case .timeForRound: return UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    }
  }
  
  var title: String {
    switch self {
    case .timeForEntireSession: return "Time for workout"
    case .timeForRound: return "Time per round"
    }
  }
}


final class GoalTimeInterfaceController: WKInterfaceController {
  
  private var selectorTimeState: TimeSelectorType = .timeForEntireSession
  private var _timeForEntireSessionSelected = 0
  private var _timeForRoundSelected = 0
  
  var timeForEntireSessionSelected: Int {
    get {
      return self._timeForEntireSessionSelected
    }
    
    set {
      self._timeForEntireSessionSelected = newValue <= 0 ? 0 : newValue
    }
  }
  
  var timeForRoundSelected: Int {
    get {
      return self._timeForRoundSelected
    }
    
    set {
      self._timeForRoundSelected = newValue <= 0 ? 0 : newValue
    }
  }
  
  @IBOutlet weak var diminishTimeButton: WKInterfaceButton!
  @IBOutlet weak var addTimeButton: WKInterfaceButton!
  @IBOutlet weak var currentTimeLabel: WKInterfaceLabel!
  @IBOutlet weak var setTimeButton: WKInterfaceButton!
  
  @IBAction func addTime() {
    
    switch selectorTimeState {
    case .timeForEntireSession:
      timeForEntireSessionSelected += 5
      currentTimeLabel.setText("\(timeForEntireSessionSelected)")
      
    case .timeForRound:
      timeForRoundSelected += 5
      currentTimeLabel.setText("\(timeForRoundSelected)")
    }
  }
  
  @IBAction func diminishTime() {
    
    switch selectorTimeState {
    case .timeForEntireSession:
      timeForEntireSessionSelected -= 5
      currentTimeLabel.setText("\(timeForEntireSessionSelected)")
      
    case .timeForRound:
      timeForRoundSelected -= 5
      currentTimeLabel.setText("\(timeForRoundSelected)")
    }
  }
  
  @IBAction func setTime(_ sender: WKInterfaceButton) {
    
    switch selectorTimeState {
      
    case .timeForEntireSession:
      guard timeForEntireSessionSelected != 0 else { return }
      selectorTimeState = .timeForRound
      updateUI()
      
    case .timeForRound:
      // TODO: Start Service
      pushController(withName: "VideoPlayer", context: nil)
    }
    
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    // Configure interface objects here.
  }
  
  func updateUI() {
    let mainColor = selectorTimeState.mainColor
    diminishTimeButton.setBackgroundColor(mainColor)
    addTimeButton.setBackgroundColor(mainColor)
    setTimeButton.setBackgroundColor(mainColor)
    setTimeButton.setTitle("Start")
    timeForEntireSessionSelected = 0
    currentTimeLabel.setText("0")
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    super.didDeactivate()
    selectorTimeState = .timeForEntireSession
  }
}
