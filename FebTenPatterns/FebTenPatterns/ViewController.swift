//
//  ViewController.swift
//  FebTenPatterns
//
//  Created by thusitha on 2/10/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnTeamSelect: UIButton!
    @IBOutlet weak var imgTeam: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func navigateToChooseScreen(_ sender: Any) {
        let chooseScreen = storyboard?.instantiateViewController(withIdentifier: "ChooseScreen") as! ChooseViewController
        chooseScreen.selectionDelegate = self
        self.present(chooseScreen, animated: true, completion: nil)
    }
        
}

extension ViewController: SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        self.view.backgroundColor = color
        lblTitle.text = name
        imgTeam.image = image
    }
}

