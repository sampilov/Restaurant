//
//  DetailViewController.swift
//  Restaurant
//
//  Created by Сампилов Ильдар on 29.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    var food: FoodDTO?

    @IBOutlet var labelName: UILabel!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        labelName.text = food?.name
        imageView.image = food?.image
    }

}
