//
//  Cool UI Elements.swift
//  MockNSamples
//
//  Created by Andre Vellori on 23/06/2016.
//  Copyright © 2016 André Vellori. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class SomeCoolButton : UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    @IBInspectable var title: String = "Hello World" {
        didSet {
            label.text = title
        }
    }
    var label: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    
    func setup() {
        imageView.frame = bounds
        addSubview(imageView)
        
        label.frame = bounds
        addSubview(label)
        
        
        
        label.textAlignment = .Center
        
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(panned))
        addGestureRecognizer(gesture)
        backgroundColor = UIColor.cyanColor()
        let bundle = NSBundle.init(forClass: SomeCoolButton.self)
        imageView.image = UIImage(named: "heart",inBundle: bundle,compatibleWithTraitCollection: traitCollection)
    }
    
    func panned(panner: UIPanGestureRecognizer) {
        switch panner.state {
        case .Began:
            excitedState()
        case .Ended:
            fallthrough
        case .Failed:
            fallthrough
        case .Cancelled:
            normalState()
        default: ()
            
        }
    }
    func normalState() {
        backgroundColor = UIColor.greenColor()
    }
    func excitedState() {
        backgroundColor = UIColor.redColor()
    }
}