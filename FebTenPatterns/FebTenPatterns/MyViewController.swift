//
//  MyViewController.swift
//  FebTenPatterns
//
//  Created by thusitha on 2/10/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, SelectTeamDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgTeam: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectTeam(_ sender: Any) {
        let chooseScreen = storyboard?.instantiateViewController(withIdentifier: "TeamScreen") as! TeamViewController
        
        chooseScreen.selectTeamDelegate = self
        self.present(chooseScreen, animated: true, completion: nil)
    }

    func didSelectTeam(image: UIImage, name: String, color: UIColor) {
        self.view.backgroundColor = color
        lblTitle.text = name
        imgTeam.image = image
    }


}

