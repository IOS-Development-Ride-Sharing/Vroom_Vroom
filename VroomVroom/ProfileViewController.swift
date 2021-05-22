//
//  ProfileViewController.swift
//  VroomVroom
//
//  Created by Vivian Ross on 5/22/21.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [PFObject]()
    var numberOfPosts = 20

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let query = PFQuery(className: "newPosts")
        query.whereKey("author", equalTo:PFUser.current()!)
        query.includeKey("author")
        query.order(byAscending: "departure_date")
        query.limit = numberOfPosts
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
        let currentUser = PFUser.current()!
        usernameLabel.text = currentUser["username"] as! String
        nameLabel.text = (currentUser["name"] as? String) ?? "Unknown"
        
        let imageFile = currentUser["profile_picture"] as? PFFileObject
        if imageFile != nil {
            let urlString = (imageFile?.url!)!
            let url = URL(string: urlString)!
            profileImage.af_setImage(withURL: url)
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePostCell") as! ProfilePostCell
        cell.departureLabel.text = post["departure_location"] as! String
        cell.arrivalLabel.text = post["arrival_location"] as! String
        cell.dateLabel.text = post["departure_date"] as! String
        return cell
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
