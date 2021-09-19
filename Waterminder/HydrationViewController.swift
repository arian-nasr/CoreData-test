//
//  HydrationViewController.swift
//  Waterminder
//
//  Created by Arian Nasr on 2021-09-18.
//

import UIKit

class HydrationViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Water]?
    var waterSum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Get items from Core Data
        fetchWater()
    }
    
    @IBOutlet weak var labelmL: UILabel!
    
    @IBAction func add1000mL(_ sender: Any) {
        addWater(quantity: 1000)
        fetchWater()
    }
    @IBAction func add250mL(_ sender: Any) {
        addWater(quantity: 250)
        fetchWater()
    }
    @IBAction func add500mL(_ sender: Any) {
        addWater(quantity: 500)
        fetchWater()
    }
    @IBAction func addOthermL(_ sender: Any) {
        //Create alert
        let alert = UIAlertController(title: "Add Water:", message: "How much water did you drink? (mL)", preferredStyle: .alert)
        alert.addTextField()
        
        //Configure button handler
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            //Get the textfield for the alert
            let textfield = alert.textFields![0]
            guard let text = textfield.text, let quantity = Int64(text) else {
                return
            }
            self.addWater(quantity: quantity)
            self.fetchWater()
            
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        alert.addAction(cancelButton)
        
        //Add button to alert
        alert.addAction(submitButton)
        
        //Show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func addWater(quantity: Int64) {
        //Create a new water object
        let newWater = Water(context: self.context)
        newWater.quantity = quantity
        
        //Save the data
        do {
            try self.context.save()
        }
        catch {
            
        }
    }
    
    func fetchWater() {
        // Fetch the data from Core Data
        waterSum = 0
        do {
            self.items = try context.fetch(Water.fetchRequest())
            items?.forEach { item in
                waterSum += Int(item.quantity)
            }
            labelmL.text = "\(waterSum) mL"
        }
        catch {
            
        }
    }


}
