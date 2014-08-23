//
//  RecipesViewController.swift
//  Recipe-App-Swift
//
//  Created by Joshua Howland on 8/23/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    var tableView: UITableView?
    var dataSource: RecipesTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = RecipesTableViewDataSource()
        
        tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        tableView?.dataSource = dataSource
        self.view.addSubview(tableView!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
