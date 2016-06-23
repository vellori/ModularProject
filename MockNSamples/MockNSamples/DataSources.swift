//
//  DataSources.swift
//  MockNSamples
//
//  Created by Andre Vellori on 19/06/2016.
//  Copyright © 2016 André Vellori. All rights reserved.
//

import Foundation
import UIKit

public class SimpleTableDS : NSObject, UITableViewDataSource {
    public func tableView(tableView: UITableView,
                          cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        let cell = UITableViewCell.init(style: .Default, reuseIdentifier: "mock")
        cell.textLabel?.text = "Item \(indexPath.row)"
        return cell
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int( arc4random_uniform(20) + 1 )
    }
}

public class PullToRefreshIB : NSObject {
    @IBOutlet var tableView : UITableView! {
        didSet {
            refreshControl.addTarget(self, action: #selector(requestRefresh),
                                     forControlEvents: .ValueChanged)
            tableView.addSubview(refreshControl)
        }
    }
    lazy var refreshControl = UIRefreshControl()
    
    public func requestRefresh(sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
}

public class TableViewSelectionToSegue : NSObject, UITableViewDelegate {
    @IBOutlet var segue : UIStoryboardSegue!
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            segue.perform()
    }
}