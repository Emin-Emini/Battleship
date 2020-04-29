//
//  Extensions.swift
//  Battleship
//
//  Created by Emin Emini on 16.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    //MARK: - Animations
    
    func testing() {
        print("test")
    }
    
    func blink() {
        self.alpha = 0.2
        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.alpha = 1.0}, completion: nil)
    }
    
    func blink(enabled: Bool = true, duration: CFTimeInterval = 1.0, delay: TimeInterval, stopAfter: CFTimeInterval = 0.0) {
        enabled ? (UIView.animate(withDuration: duration,
            delay: delay,
            options: [.curveEaseInOut, .autoreverse, .repeat],
            animations: { [weak self] in self?.alpha = 0.2 },
            completion: { [weak self] _ in self?.alpha = 1.0 })) : self.layer.removeAllAnimations()
        if !stopAfter.isEqual(to: 0.0) && enabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + stopAfter) { [weak self] in
                self?.layer.removeAllAnimations()
            }
        }
    }
    
    func shake(count: Float = 4, for duration: TimeInterval = 0.5, withTranslation translation: Float = 3) {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
