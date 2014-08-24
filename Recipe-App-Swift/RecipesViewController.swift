//
//  RecipesViewController.swift
//  Recipe-App-Swift
//
//  Created by Joshua Howland on 8/23/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView?
    var dataSource: RecipesTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = RecipesTableViewDataSource()
        
        tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        tableView?.delegate = self;
        tableView?.dataSource = dataSource
        self.view.addSubview(tableView!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 44;
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var detailViewController = RecipeDetailViewController()
        detailViewController.recipeIndex = indexPath.row
        self.navigationController.pushViewController(detailViewController, animated: true)
        
    }

}
