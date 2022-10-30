//
//  FoodSection.swift
//  Restaurant
//
//  Created by Сампилов Ильдар on 30.10.2022.
//

import UIKit

struct FoodSection {
    var name: String
    var foods: [FoodDTO]
}

struct FoodDTO {
    let name: String
    let image: UIImage?
}
