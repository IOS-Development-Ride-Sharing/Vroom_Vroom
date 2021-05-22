//
//  EditProfileViewController.swift
//  VroomVroom
//
//  Created by Vivian Ross on 5/22/21.
//

import UIKit
import Parse
import AlamofireImage

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        profileImage.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onSubmitButton(_ sender: Any) {
        let currentUser = PFUser.current()!
        currentUser["name"] = nameField.text!
        let imageData = profileImage.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        currentUser["profile_picture"] = file
        currentUser.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else{
                print("error: \(error)")
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
