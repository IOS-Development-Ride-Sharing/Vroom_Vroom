//
//  FeedViewController.swift
//  VroomVroom
//
//  Created by Vivian Ross on 5/15/21.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    var numberOfPosts = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "newPosts")
        query.includeKey("author")
        query.order(byDescending: "createdAt")
        query.limit = numberOfPosts
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    @IBAction func onPostButton(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let post = posts[indexPath.row]
        let driverViewController = segue.destination as! DriverViewController
        driverViewController.driver=post["author"] as! PFUser
        //deselect so that cell is not highlighted when you go back
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
