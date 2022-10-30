//
//  ViewController.swift
//  Restaurant
//
//  Created by Сампилов Ильдар on 25.10.2022.
//

import UIKit

final class ViewController: UIViewController {
    private var foodSections = [FoodSection]()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        foodSections = [
            FoodSection(
                name: "Супы",
                foods: [
                    FoodDTO(name: "Борщ", image: UIImage(named: "borsh")),
                    FoodDTO(name: "Солянка", image: UIImage(named: "solyanka")),
                    FoodDTO(name: "Лагман", image: UIImage(named: "lagman")),
                    FoodDTO(name: "Лапша по-Китайски", image: UIImage(named: "lapsha")),
                ]
            ),
            FoodSection(
                name: "Салаты",
                foods: [
                    FoodDTO(name: "Цезарь", image: UIImage(named: "cezar")),
                    FoodDTO(name: "Овощной", image: UIImage(named: "ovoshnoy")),
                    FoodDTO(name: "Греческий", image: UIImage(named: "grecheskiy")),
                ]
            ),
            FoodSection(
                name: "Напитки",
                foods: [
                    FoodDTO(name: "Чай", image: UIImage(named: "chai")),
                    FoodDTO(name: "Кофе", image: UIImage(named: "koffe")),
                    FoodDTO(name: "Морс", image: UIImage(named: "mors")),
                ]
            )
        ]
        
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let controller = segue.destination as? DetailViewController
            let indexPath = tableView.indexPath(for: (sender as! UITableViewCell))!
            controller?.food = foodSections[indexPath.section].foods[indexPath.row]
        }
    }
}

extension ViewController: UITableViewDataSource {
    // Устанавливаем количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        foodSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        foodSections[section].name
    }

    // Устанавливаем количество элементов в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foodSections[section].foods.count
    }

    // Настраиваем ячейку в таблице по индексу(Присваиваем название ячейке)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foodSections[indexPath.section].foods[indexPath.row].name
        return cell
        
    }
}
