//
//  ColorsTableViewController.swift
//  Rainbow
//
//  Created by Alex Thompson on 9/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    var colors: [Color] = [
        Color(name: "Red", color: UIColor.red),
        Color(name: "Orange", color: .orange),
        Color(name: "Yellow", color: .yellow),
        Color(name: "Green", color: .green),
        Color(name: "Blue", color: .blue),
        Color(name: "Cyan", color: .cyan),
        Color(name: "Purple", color: .purple)
    ]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        return cell
    }
    
}

