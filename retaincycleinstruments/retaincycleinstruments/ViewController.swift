//
//  ViewController.swift
//  retaincycleinstruments
//
//  Created by thusitha on 2/3/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Example", style: .plain, target: self
            , action: #selector(handleShowExampleTableView))
        
        renderLabel()
    }
    
    @objc func handleShowExampleTableView () {
        navigationController?.pushViewController(ExampleTable(), animated: true)
    }
    
    func renderLabel () {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.width / 2)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Example Profiling"
        self.view.addSubview(label)
    }

}

class Service {
    var exampleTable: ExampleTable?
}

class ExampleTable: UITableViewController {
    
    //deinitilizer declaration
    //check if you have retin cycle
    //this will show successfull deinitilation
    deinit {
        print("OS Reclaiming memory for example controler")
    }
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        
        //after you make ref of service class inside this example class its have rtain cycle that will not deinitilize the view
        //This two classes are referancing each other, that will make a retain cyle
        service.exampleTable = self
        
        //how do we fixed this
        //by default all the refarances are strong refrenace
        //you can fixed this by creating weak variable
        
    }
}

