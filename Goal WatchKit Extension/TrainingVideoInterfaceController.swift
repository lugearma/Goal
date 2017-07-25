//
//  TrainingVideoInterfaceController.swift
//  Goal
//
//  Created by Luis Arias on 7/24/17.
//  Copyright © 2017 Luis Arias. All rights reserved.
//

import WatchKit
import Foundation


final class TrainingVideoInterfaceController: WKInterfaceController {
  
  @IBOutlet weak var videoMovie: WKInterfaceMovie!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    setupMovie()
  }
  
  private func setupMovie() {
    let mainBundle = Bundle.main
    if let movieURL = mainBundle.url(forResource: "small", withExtension: "mp4") {
      self.videoMovie.setMovieURL(movieURL)
    }
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
