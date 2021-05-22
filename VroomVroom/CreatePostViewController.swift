//
//  CreatePostViewController.swift
//  VroomVroom
//
//  Created by Vivian Ross on 5/15/21.
//

import UIKit
import Parse

class CreatePostViewController: UIViewController {

    @IBOutlet weak var departureLocationField: UITextField!
    @IBOutlet weak var arrivalLocationField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var seatsField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var contactField: UITextField!
    @IBOutlet weak var notesField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "newPosts")
        post["author"] = PFUser.current()!
        post["departure_location"] = departureLocationField.text!
        post["arrival_location"] = arrivalLocationField.text!
        post["departure_date"] = dateField.text!
        post["departure_time"] = timeField.text!
        post["seats"] = seatsField.text!
        post["price"] = priceField.text!
        post["contact"] = contactField.text!
        post["notes"] = (notesField.text) ?? ()
        
        if departureLocationField.text == "" || arrivalLocationField.text == "" || seatsField.text == "" || priceField.text == "" || contactField.text == "" || dateField.text == "" || timeField.text == "" {
            print("Error: Must fill out required fields")
        } else{
            post.saveInBackground { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("saved!")
                } else {
                    print("error!")
                }
            }
        }
        
        
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
