//
//  ViewController.swift
//  savingNotes2
//
//  Created by TYLER MOK on 10/30/23.
//
public struct Dog: Codable {
    var color : String
    var name : String
    var age : Int
    var pic : String
}


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var infoOutlet: UILabel!
    
    let defaults = UserDefaults.standard
    var number : Int = 8
    var d1 : Dog?
    var dogs = [Dog]() // blank dog array
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = defaults.integer(forKey: "theNumber")
        print(number)
        
        // we are decoding a JSON object to an object
        if let items = defaults.data(forKey: "theDogs") {
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode([Dog].self, from: items) {
                           dogs = decoded
                        }
                }
        // printing all the names in the object array
         for a in dogs {
            print(a.name)
        }
        
        
        // end of viewdidload
    }

    @IBAction func saveButton(_ sender: Any) {
        defaults.set(20, forKey: "theNumber")
        
        
        var blah = Dog(color: "Golden", name: "Duke Dennis", age: 27)
        dogs.append(blah)
        var blah2 = Dog(color: "Brown", name: "Fanum", age: 23)
        dogs.append(blah2)
        
        
        // encoding the object into JSON class so it can be saved
        let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(dogs) {
               defaults.set(encoded, forKey: "theDogs")
               
                        }
        

    }
    
    
    
    
    
}

