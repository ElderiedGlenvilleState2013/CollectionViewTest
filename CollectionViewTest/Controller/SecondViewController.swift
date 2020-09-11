//
//  SecondViewController.swift
//  CollectionViewTest
//
//  Created by Elderied McKinney on 9/10/20.
//  Copyright © 2020 Elderied McKinney. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dogImg: UIImageView!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var age: String?
    var name: String?
    var imgName: String?
    var desc: String?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let dogAge = age {
            ageLbl.text = dogAge
        }
        
        if let dogName = name {
            nameLbl.text = dogName
        }
        if let img = imgName {
            dogImg.image = UIImage(imageLiteralResourceName: img)
        }
        
        if let des = desc {
            descriptionLabel.text = des
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
