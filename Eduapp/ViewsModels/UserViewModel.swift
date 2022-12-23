import Foundation
import SwiftyJSON
import Alamofire

class UserViewModel: ObservableObject{
    
    static let sharedInstance = UserViewModel()
//    let URL = "http://172.17.2.159:3000/user/"
//    func signIn(username:String,email:String,password:String) -> Bool {
//      UserService().SignIn(urlStr: URL, userusername: username, useremail: email, userpassword: password, onSuccess: {
//          onSuccess()
//      })
//      {
//          (errorMessage) in
//          onError(errorMessage)
//      }
//  }
    
    
//    func login(email:String,password:String) async -> Bool
//    {if (await UserService().LogIn(urlStr: URL, useremail: email, userpassword: password)) != ""
//        { return true}
//    return false
//    }
    
    
    
    
//    func profile() -> Bool
//    {if UserService().getProfile() == ""
//        { return true}
//        return false
//    }
    
    
//    func mailer(usermail : String) -> Bool
//    {
//        if ( UserService().sendMail(email: usermail) == 200 ){
//            return true
//        }else
//        {
//            return false
//        }
//    }
//
//
    
    ///////
    func recupererToutUtilisateur( completed: @escaping (Bool, [Utilisateur]?) -> Void ) {
        AF.request(Consts.URLuser+"usrs",
                   method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print(response.data)
                    var users : [Utilisateur]? = []
                    for singleJsonItem in JSON(response.data!)["users"] {
                        users!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    }
                    print("---+/*-+")
                    print(users)
                    completed(true, users)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
//    func inscription(utilisateur: Utilisateur, completed: @escaping (Bool) -> Void) {
//        AF.request(Consts.URL + "utilisateur/inscription",
//                   method: .post,
//                   parameters: [
//                    "username": utilisateur.username!,
//                    "email": utilisateur.email!,
//                    "mdp": utilisateur.mdp!,
//                    "nom": utilisateur.nom!,
//                    "prenom": utilisateur.prenom!,
//                    "dateNaissance": DateUtils.formatFromDate(date: utilisateur.dateNaissance!) ,
//                    "idPhoto": utilisateur.idPhoto!
//
//                   ] ,encoding: JSONEncoding.default)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    print("Validation Successful")
//                    completed(true)
//                case let .failure(error):
//                    print(error)
//                    completed(false)
//                }
//            }
//    }
//
//    func connexion(email: String, mdp: String, completed: @escaping (Bool, Any?) -> Void) {
//        AF.request(Consts.URL + "utilisateur/connexion",
//                   method: .post,
//                   parameters: ["email": email, "mdp": mdp])
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    let jsonData = JSON(response.data!)
//                    let utilisateur = self.makeItem(jsonItem: jsonData["utilisateur"])
//                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
//                    UserDefaults.standard.setValue(utilisateur._id, forKey: "idUtilisateur")
//                //    UserDefaults.standard.set(utilisateur.blockedUsers, forKey: "blockedUsers")
//                  //  UserDefaults.standard.set(utilisateur.blockedPosts, forKey: "blockedPosts")
//                    print(utilisateur)
//
//                    completed(true, utilisateur)
//                case let .failure(error):
//                    debugPrint(error)
//                    completed(false, nil)
//                }
//            }
//    }
//
//    func loginWithSocialApp(email: String, nom: String, prenom: String, completed: @escaping (Bool, Utilisateur?) -> Void ) {
//        AF.request(Consts.URL + "utilisateur/connexionAvecReseauSocial",
//                   method: .post,
//                   parameters: [
//                    "email": email,
//                    "nom": nom,
//                    "prenom": prenom
//                   ],
//                   encoding: JSONEncoding.default)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .response { response in
//                switch response.result {
//                case .success:
//                    let jsonData = JSON(response.data!)
//                    let utilisateur = self.makeItem(jsonItem: jsonData["utilisateur"])
//
//                    print("this is the new token value : " + jsonData["token"].stringValue)
//                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
//                    UserDefaults.standard.setValue(utilisateur._id, forKey: "idUtilisateur")
//                    //UserDefaults.standard.set(utilisateur.blockedUsers, forKey: "blockedUsers")
//                    //UserDefaults.standard.set(utilisateur.blockedPosts, forKey: "blockedPosts")
//                    completed(true, utilisateur)
//                case let .failure(error):
//                    debugPrint(error)
//                    completed(false, nil)
//                }
//            }
//    }
//
//    func recupererUtilisateurParToken(userToken: String, completed: @escaping (Bool, Utilisateur?) -> Void ) {
//        print("Looking for user --------------------")
//        AF.request(Consts.URL + "utilisateur/recupererUtilisateurParToken",
//                   method: .post,
//                   parameters: ["token": userToken],
//                   encoding: JSONEncoding.default)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .response { response in
//                switch response.result {
//                case .success:
//                    let jsonData = JSON(response.data!)
//                    let utilisateur = self.makeItem(jsonItem: jsonData["utilisateur"])
//                    print("Found utilisateur --------------------")
//                    print(utilisateur)
//                    print("-------------------------------")
//                    completed(true, utilisateur)
//                case let .failure(error):
//                    debugPrint(error)
//                    completed(false, nil)
//                }
//            }
//    }
//
//
//    func reEnvoyerConfirmationEmail(email: String, completed: @escaping (Bool) -> Void) {
//        AF.request(Consts.URL + "utilisateur/reEnvoyerConfirmationEmail",
//                   method: .post,
//                   parameters: ["email": email])
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    print("Validation Successful")
//                    completed(true)
//                case let .failure(error):
//                    print(error)
//                    completed(false)
//                }
//            }
//    }
//
//    func motDePasseOublie(email: String, codeDeReinit: String, completed: @escaping (Bool) -> Void) {
//        AF.request(Consts.URL + "utilisateur/motDePasseOublie",
//                   method: .post,
//                   parameters: ["email": email, "codeDeReinit": codeDeReinit])
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    print("Validation Successful")
//                    completed(true)
//                case let .failure(error):
//                    print(error)
//                    completed(false)
//                }
//            }
//    }
//
//    func changerMotDePasse(email: String, nouveauMotDePasse: String, completed: @escaping (Bool) -> Void) {
//        AF.request(Consts.URL + "utilisateur/changerMotDePasse",
//                   method: .put,
//                   parameters: ["email": email,"nouveauMotDePasse": nouveauMotDePasse])
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    print("Validation Successful")
//                    completed(true)
//                case let .failure(error):
//                    print(error)
//                    completed(false)
//                }
//            }
//    }
//
//    func changerPhotoDeProfil(email: String, uiImage: UIImage, completed: @escaping (Bool) -> Void ) {
//
//        AF.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(uiImage.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "image.jpeg", mimeType: "image/jpeg")
//
//            for (key, value) in
//                    [
//                        "email": email,
//                    ]
//            {
//                multipartFormData.append((value.data(using: .utf8))!, withName: key)
//            }
//
//        },to: Consts.URL + "utilisateur/photo-profil",
//                  method: .post)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    print("Success")
//                    completed(true)
//                case let .failure(error):
//                    completed(false)
//                    print(error)
//                }
//            }
//    }
    
//    func manipulerUtilisateur(utilisateur: Utilisateur, methode: HTTPMethod, completed: @escaping (Bool) -> Void) {
//        print(utilisateur)
//        AF.request(Consts.URL + "utilisateur/modifierProfil",
//                   method: methode,
//                   parameters: [
//                    //"_id" : utilisateur._id!,
//                    //"pseudo": utilisateur.pseudo!,
//                    "email": utilisateur.email!,
//                    //"mdp": utilisateur.mdp!,
//                    "nom": utilisateur.nom!,
//                    "prenom": utilisateur.prenom!,
//                    "dateNaissance": DateUtils.formatFromDate(date: utilisateur.dateNaissance!),
//                    //"idPhoto": utilisateur.idPhoto!,
//                 //   "sexe": String(utilisateur.sexe!),
//                    //"score": utilisateur.score!,
//                    //"bio": utilisateur.bio!
//                   ])
//            .response { response in
//                print(response)
//            }
//    }
    
//    func supprimerUtilisateur(utilisateur: Utilisateur) {
//
//        AF.request(Consts.URL + "utilisateur",
//                   method: .delete,
//                   parameters: ["_id": utilisateur._id!],
//                   encoding: JSONEncoding.default,
//                   headers: nil)
//            .response { response in
//                print(response)
//            }
//    }
    
//    func blockUser(userToBlock: String, completed: @escaping (Bool) -> Void) {
//        AF.request(Consts.URL + "utilisateur/block",
//                   method: .post,
//                   parameters: [
//                    "userToBlock": userToBlock,
//                    "user": UserDefaults.standard.string(forKey: "idUtilisateur")!
//                   ],
//                   encoding: JSONEncoding.default,
//                   headers: nil)
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    print("Success")
//                    completed(true)
//                case let .failure(error):
//                    completed(false)
//                    print(error)
//                }
//            }
//    }
    
    func makeItem(jsonItem: JSON) -> Utilisateur {
        
//        var BParray : [String] = []
//        for singleJsonItem in jsonItem["blockedPosts"]   {
//            BParray.append(singleJsonItem.1.stringValue)
//        }
        
//        var BUarray : [String] = []
//        for singleJsonItem in  jsonItem["blockedUsers"]  {
//            BUarray.append(singleJsonItem.1.stringValue)
//        }
        
        return Utilisateur(
            _id: jsonItem["_id"].stringValue,
            username: jsonItem["username"].stringValue,
            email: jsonItem["email"].stringValue
//            mdp: jsonItem["mdp"].stringValue,
//            nom: jsonItem["nom"].stringValue,
//            prenom: jsonItem["prenom"].stringValue
//            dateNaissance: DateUtils.formatFromString(string: jsonItem["dateNaissance"].stringValue),
        //    idPhoto: jsonItem["idPhoto"].stringValue
          //  sexe: jsonItem["sexe"].boolValue,
          //  score: jsonItem["score"].intValue,
          //  bio: jsonItem["bio"].stringValue,
          //  isVerified: jsonItem["isVerified"].boolValue,
         //   blockedUsers: BUarray,
           // blockedPosts: BParray
        )
    }
}
