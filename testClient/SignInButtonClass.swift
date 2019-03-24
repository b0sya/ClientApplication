//
//  SignInButtonClass.swift
//  testClient
//
//  Created by b0sya on 24.03.2019.
//  Copyright © 2019 b0ysa. All rights reserved.
//

import UIKit

class SignInButton: UIButton {
    
    var color: UIColor = .black
    let touchDownAlpha: CGFloat = 0.3
    
    func setup() {
        backgroundColor = .clear
        layer.backgroundColor = color.cgColor
        
        layer.cornerRadius = 21.5
        clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let backgroundColor = backgroundColor {
            color = backgroundColor
        }
        
        setup()
    }
    
    
    convenience init(color: UIColor? = nil, title: String? = nil) {
        self.init(type: .custom)
        
        if let color = color {
            self.color = color
        }
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        setup()
    }
    
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
    
    func touchDown() {
    }
    
    func touchUp() {
    }
    
    weak var timer: Timer?
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    deinit {
        stopTimer()
    }

}
