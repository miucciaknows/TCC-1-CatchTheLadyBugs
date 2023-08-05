//
//  GestureHelper.swift
//  CatchTheBubbles
//
//  Created by Nathalia Trazzi on 05/08/23.
//

import Foundation
import UIKit

extension ViewController {
    func createPinchGestureRecognizer(target: Any?, action: Selector?) -> UIPinchGestureRecognizer {
        let recognizer = UIPinchGestureRecognizer(target: target, action: action)
        recognizer.scale = 3
        return recognizer
    }
}
