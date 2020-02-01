//
//  ViewController.swift
//  FebFirstCoreData
//
//  Created by thusitha on 2/1/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people: [NSManagedObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register the cell
        title = "Name List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "People")
        
        //3
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        //alert ref
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {[unowned self] action in
            
            guard let textField = alert.textFields?.first, let nameToSave = textField.text
                else {
                    return
            }
            
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
        
        alert.addTextField()
        alert.addAction(saveAction)
        present(alert, animated: true)
    }
    
    func save(name: String) {
        //init
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "People", in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // 3
        person.setValue(name, forKeyPath: "name")
        
        // 4
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        cell.textLabel?.text = people[indexPath.row]
//
//        return cell

        let person = people[indexPath.row]

        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
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

