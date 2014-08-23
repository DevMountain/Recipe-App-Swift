//
//  RecipesTableViewDataSource.swift
//  Recipe-App-Swift
//
//  Created by Joshua Howland on 8/23/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

import UIKit

class RecipesTableViewDataSource: NSObject, UITableViewDataSource {
 
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return RARecipes.count()
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell :UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell()
        }
        
        cell?.textLabel.text = RARecipes.titleAtIndex(indexPath.row)

        return cell
    }
    
}
