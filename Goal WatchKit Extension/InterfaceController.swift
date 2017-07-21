//
//  InterfaceController.swift
//  Goal WatchKit Extension
//
//  Created by Luis Arias on 7/20/17.
//  Copyright © 2017 Luis Arias. All rights reserved.
//

import WatchKit
import Foundation


final class InterfaceController: WKInterfaceController {
  
  @IBOutlet weak var clockButtonImage: WKImage!
  @IBOutlet weak var caloriesButtonImage: WKImage!
  @IBOutlet weak var clockTapGesture: WKTapGestureRecognizer!
  @IBOutlet weak var caloriesTapGesture: WKTapGestureRecognizer!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
  }

  
  @IBAction func handleClockButtonTapped() {
    print(#function)
  }
  
  @IBAction func handleCaloriesButtonTapped() {
    print(#function)
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
