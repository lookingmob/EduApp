//
//  CUserTableViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 13/12/2022.
//

import UIKit

class CUserTableViewController: UITableViewController {
    private var utilisateurs : [Utilisateur] = []

    @IBOutlet var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellossa")
        let contentView = cell?.contentView

       // let imageProfile = contentView?.viewWithTag(1) as! UIImageView
        let labelName = contentView?.viewWithTag(2) as! UILabel
        let labelUsername = contentView?.viewWithTag(3) as! UILabel
        
        let utilisateur = utilisateurs[indexPath.row]
        
      
        //labelName.text = utilisateur.prenom! + " " + utilisateur.nom!
         labelName.text = utilisateur.username!
        labelUsername.text = "@" + utilisateur.username!
        
        
//        ImageLoader.shared.loadImage(
//            identifier: utilisateur.idPhoto!,
//            url: Consts.URL_IMAGE + utilisateur.idPhoto!,
//            completion: { [] image in
//                imageProfile.image = image
//            })
        
        return cell!
    }
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        200
//    }
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return utilisateurs.count
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MessagerieViewModel.sharedInstance.creerNouvelleConversation(recepteur: utilisateurs[indexPath.row]._id!) { success, Conversation in
            if (success) {
                self.dismiss(animated: true, completion: nil)
            } else {
                self.present(Alert.makeServerErrorAlert(), animated: true)
            }
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        initialize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ModalTransitionMediator.instance.sendPopoverDismissed(modelChanged: true)
    }
    
    // METHODS
    func initialize() {
        UserViewModel.sharedInstance.recupererToutUtilisateur() { success, utilisateursfromRep in
            if success {
                self.utilisateurs = utilisateursfromRep!
                print(self.utilisateurs)
                self.tableView.reloadData()
            }else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not load utilisateurs "),animated: true)
            }
        }
    }}
