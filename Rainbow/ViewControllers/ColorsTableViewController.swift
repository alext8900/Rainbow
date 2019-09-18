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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowColorSegue" {
            guard let detailVC = segue.destination as?
                ColorDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            
            let color = colors[indexPath.row]
           
            detailVC.cellColor = color
        }
    
    }




    @IBAction func addNewColor(_ sender: Any) {
        let alert = UIAlertController(title:"Add Color", message: "Specify a color to add, values should be from 0-255", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Color Name"
        })
        
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Red (0-255)"
        })
        
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Blue (0-255)"
            
            
            alert.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Green (0-255)"
            })
            
            
        })
        
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler:  { (_) in
            guard let name = alert.textFields?[0].text, !name.isEmpty else { return }
            
            guard let redString = alert.textFields?[1].text, let redValue = Double(redString) else { return }
            guard let greenString = alert.textFields?[2].text, let greenValue = Double(greenString) else { return }
            guard let blueString = alert.textFields?[3].text, let blueValue = Double(blueString) else { return }
            
            let color = Color(name: name, color: UIColor(red: CGFloat(redValue/255.0), green: CGFloat(greenValue/255.0), blue: CGFloat(blueValue/255.0), alpha: 1.0))
            
            
            self.colors.append(color)
            self.tableView.reloadData()
        }))
        
        
        present(alert, animated: true, completion: nil)
    }
    
    




}

