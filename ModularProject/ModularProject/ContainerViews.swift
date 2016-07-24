//
//  ContainerViews.swift
//  ModularProject
//
//  Created by Andre Vellori on 24/07/2016.
//  Copyright © 2016 André Vellori. All rights reserved.
//

import Foundation
import UIKit

protocol Stuff {
    var thisIsMyStuffThereAreManyLikeItButThisIsMine: String { get }
}

protocol SomeStuffProvider {
    func getMyStuff() -> Stuff
}

protocol NumberedController {
    var myNumber: Int? {get set}
}


class FinalViewController: UIViewController, SomeStuffProvider {
    class CustomStuff: Stuff {
        var thisIsMyStuffThereAreManyLikeItButThisIsMine: String = NSDate().description
    }
    func getMyStuff() -> Stuff {
        return CustomStuff()
    }
    func done(sender: UIStoryboardSegue) {
        
    }
}

private func someRandom() -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
}

class NthVCViewController: UIViewController, NumberedController {
    @IBOutlet var label: UILabel! {
        didSet {
            if let number = myNumber {
                label.text = "I'm n. \(number)"
            }
        }
    }
    
    var myNumber: Int?
    
    @IBAction func done(sender: UIStoryboardSegue) {
        if let stuff = (sender.sourceViewController as? SomeStuffProvider)?.getMyStuff() {
            label.text = "returned at \(stuff.thisIsMyStuffThereAreManyLikeItButThisIsMine)"
        }
    }
}

class KingViewController: UIViewController {
    var amountOfControllers = 1
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if var numeredVC = segue.destinationViewController as? NumberedController {
            numeredVC.myNumber = amountOfControllers
            amountOfControllers += 1
        }
    }
}

@IBDesignable
class ColourfulView: UIView {
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = UIColor(red: someRandom(), green: someRandom(), blue: someRandom(), alpha: 1)
    }
}