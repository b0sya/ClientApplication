//
//  SignInButton.swift
//  testClient
//
//  Created by b0sya on 25.03.2019.
//  Copyright © 2019 b0ysa. All rights reserved.
//

import UIKit

class SignInButton : UIButton {
    var color: UIColor = .black
    let touchDownAlpha: CGFloat = 0.3
    weak var timer : Timer?
    let timerStep: TimeInterval = 0.01
    @objc let animateTime: TimeInterval = 0.4
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }
    lazy var alphaStep: CGFloat = {
        return (1 - touchDownAlpha) / CGFloat(animateTime / timerStep)
    }()
    
    convenience init(color: UIColor? = nil, title: String? = nil) {
        self.init(type: .custom)
        
        if let color = color {
            self.color = color
        }
        
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        setup()
    }
    
    //Button settings
    func setup() {
        backgroundColor = .clear
        layer.backgroundColor = color.cgColor
        
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let backgroundColor = backgroundColor {
            color = backgroundColor
        }
        
        setup()
    }
    
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func touchUp() {
        timer = Timer.scheduledTimer(timeInterval: timerStep, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
    }
    
    @objc func animation() {
        guard let backgroundAlpha = layer.backgroundColor?.alpha else {
            stopTimer()
            return
        }
        
        let newAlpha = backgroundAlpha + alphaStep
        
        if newAlpha < 1 {
            layer.backgroundColor = color.withAlphaComponent(newAlpha).cgColor
        } else {
            layer.backgroundColor = color.cgColor
            stopTimer()
        }
    }
    
    func touchDown() {
        stopTimer()
        
        layer.backgroundColor = color.withAlphaComponent(touchDownAlpha).cgColor
    }
    
    deinit {
        stopTimer()
    }
    
}

