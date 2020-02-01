//
//  ViewController.swift
//  FebFirstCoreData
//
//  Created by thusitha on 2/1/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var people: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register the cell
        title = "Name List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        people.append("Kamal")
        tableView.reloadData()
    }

    @IBAction func addName(_ sender: UIBarButtonItem) {
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row]
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //        return names.count
//        return people.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        //        cell.textLabel?.text = names[indexPath.row]
//        //        return cell
//
//        let person = people[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//            let person = people[indexPath.row]
//            people.remove(at: indexPath.row)
//            deleteData(name: (person.value(forKeyPath: "name") as? String)!)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}

