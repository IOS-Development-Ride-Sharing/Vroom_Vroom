//
//  SearchViewController.swift
//  VroomVroom
//
//  Created by Vivian Ross on 5/22/21.
//

import UIKit
import Parse

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var departureField: UITextField!
    @IBOutlet weak var arrivalField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    var numberOfPosts = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchPostCell") as! SearchPostCell
        let user = post["author"] as! PFUser
        cell.driverLabel.text = (user["name"] as? String) ?? user.username
        cell.departureLabel.text = post["departure_location"] as! String
        cell.arrivalLabel.text = post["arrival_location"] as! String
        cell.dateLabel.text = post["departure_date"] as! String
        cell.timeLabel.text = post["departure_time"] as! String
        cell.seatsLabel.text = post["seats"] as! String
        cell.priceLabel.text = post["price"] as! String
        cell.contactLabel.text = post["contact"] as! String
        cell.notesLabel.text = (post["notes"] as? String) ?? ""
        return cell
    }
    
    @IBAction func onSearchButton(_ sender: Any) {
        let query = PFQuery(className: "newPosts")
        query.includeKey("author")
        if departureField.text != "" {
            query.whereKey("departure_location", equalTo: departureField.text)
        }
        if arrivalField.text != "" {
            query.whereKey("arrival_location", equalTo: arrivalField.text)
        }
        if dateField.text != "" {
            query.whereKey("departure_date", equalTo: dateField.text)
        }
        query.order(byDescending: "createdAt")
        query.limit = numberOfPosts
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
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
