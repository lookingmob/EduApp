//
//  ImageViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 23/11/2022.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var pickedImage = false

    @IBOutlet weak var imgv: UIImageView!
    
    @IBAction func selectimage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !pickedImage {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
                pickedImage = true
        }
    }
    @IBAction func imgpushtoserver(_ sender: UIButton) {
        guard let imageData = imgv.image?.jpegData(compressionQuality: 0.75) else { return }
        let randomID = UUID.init().uuidString
        uploadImage(imgData: imageData, imageName: "\(randomID).jpg")
        print("\(randomID).jpg")
        UserDefaults.standard.set("http://172.17.2.159:3000/user/upload/\(randomID).jpg", forKey: "picture")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomID = UUID.init().uuidString
       // let uploaderRef = Storage.storage().reference(withPath: "bookCover/\(randomID).jpg")
       // guard let imageData = imgv.image?.jpegData(compressionQuality: 0.75) else { return }
       // uploadImage(imgData: imageData, imageName: "\(randomID).jpg")
    }
    func uploadImage(imgData:Data,imageName:String){
       // params to send additional data, for eg. AccessToken or userUserId
       let params = ["userID":"userId","accessToken":"your accessToken"]
       print(params)
       AF.upload(multipartFormData: { multiPart in
           
           multiPart.append(imgData, withName: "upload",fileName: imageName,mimeType: "image/*")
       }, to: "http://172.17.2.159:3000/uploads",headers: []).responseJSON { apiResponse in
           
           switch apiResponse.result{
           case .success(_):
               let apiDictionary = apiResponse.value as? [String:Any]
               print("apiResponse --- \(apiDictionary?.values)")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
               
               // This is to get the SceneDelegate object from your view controller
               // then call the change root view controller function to change to main tab bar

                 (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
           case .failure(_):
               print("got an error")
           }
       }
   }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imgv.image = image
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

}
