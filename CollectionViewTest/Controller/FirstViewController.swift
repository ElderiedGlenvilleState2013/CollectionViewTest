//
//  FirstViewController.swift
//  CollectionViewTest
//
//  Created by Elderied McKinney on 9/10/20.
//  Copyright © 2020 Elderied McKinney. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var image: UIImageView!
    
    var categories : [CategoryModel] = [
        CategoryModel(categoryName: "Bonnie", categoryImage: "bonnie.jpg"), CategoryModel(categoryName: "Lucy Rose", categoryImage: "lucyrose.jpg"),
        CategoryModel(categoryName: "Peach", categoryImage: "peach.jgp"),
        CategoryModel(categoryName: "Summer", categoryImage: "summer.jpg"),
    ]
    var adoptAnimals: [Animal] = [
    
        Animal(name: "Bonnie", animalType: "Mix Breed", animalDesc: "Bonnie is for adoption, she is very cute ", animalAge: " 5 years 1 month", animalImage: "bonnie.jpg"),
        Animal(name: "Lucy Rose", animalType: "Mix", animalDesc: "Lucy is very happy and looking for a home", animalAge: "2 years and 3 month", animalImage: "lucyrose.jpg"),
        Animal(name: "Peach", animalType: "Mix Breed", animalDesc: "super happy need a home", animalAge: "2 years and 1 month", animalImage: "peach.jgp"),
        Animal(name: "Summer", animalType: "Mix Breed", animalDesc: "Summer is ready for the summer weather adopt today", animalAge: "10yrs and 2 months", animalImage: "summer.jpg"),
    ]
    
    
    var itemSize : CGSize = CGSize(width: 0, height: 0)
    var selectedCatory : CategoryModel?
    var selectAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        image.image = UIImage(imageLiteralResourceName: categories[0].categoryImage)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemsPerRow: CGFloat = 4
            let width = collectionView.frame.width / itemsPerRow
            let height = width
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.estimatedItemSize = itemSize
            itemSize = CGSize(width: width, height: height)
        }
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondViewController {
            secondVC.age = selectAnimal?.animalAge
            secondVC.name = selectAnimal?.name
            secondVC.desc = selectAnimal?.animalDesc
            secondVC.imgName = selectAnimal?.animalImage
            
            
        }
    }
    

}


extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryCell
        
        cell?.nameLabel.text = categories[indexPath.row].categoryName
        cell?.img.image = UIImage(imageLiteralResourceName: categories[indexPath.row].categoryImage)
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectAnimal = adoptAnimals[indexPath.row]
        performSegue(withIdentifier: "ShowAnimal", sender: nil)
    }
    
    
    
    
}
