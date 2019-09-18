//
//  ColorsTableViewController.swift
//  Rainbow
//
//  Created by Alex Thompson on 9/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        
        cell.textLabel?.text = "Cell #\(indexPath.row + 1)"
        return cell
    }
    
}

