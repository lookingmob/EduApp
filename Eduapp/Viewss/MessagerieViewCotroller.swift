//
//  MessagerieViewCotroller.swift
//  Eduapp
//
//  Created by alaa gharbi on 9/12/2022.
//

import UIKit

class MessagerieView: UITableViewController,  ModalTransitionListener {
    // VARS
    private var conversations : [Conversation] = []
    private var selectedConversation: Conversation?
    
    @IBOutlet weak var tableview: UITableView!
    // PROTOCOLS
 
    // PROTOCOLS
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellmsggg")
        let contentView = cell?.contentView

        let imageProfile = contentView?.viewWithTag(1) as! UIImageView
        let labelUsername = contentView?.viewWithTag(2) as! UILabel
        let labellastMessage = contentView?.viewWithTag(3) as! UILabel
       // let blockButton = contentView?.viewWithTag(4) as! UIButton
        
        let conversation = conversations[indexPath.row]
        let receiver = conversation.receiver
        imageProfile.roundedGrayPhoto()
        
        
        labelUsername.text = receiver.username!
        labellastMessage.text = conversation.lastMessage
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedConversation = conversations[indexPath.row]
        self.performSegue(withIdentifier: "conversationSeguees", sender: selectedConversation)
    }
    
    
    // LIFECYCLE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "conversationSeguees" {
            let destination = segue.destination as! ChatView
            destination.currentConversation = selectedConversation
            destination.title = (selectedConversation?.receiver.username)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ModalTransitionMediator.instance.setListener(listener: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initialize()
    }
    
    // METHODS
    func popoverDismissed() {
        initialize()
    }
    
    func initialize() {
        self.conversations = []
        self.tableView.reloadData()
        MessagerieViewModel.sharedInstance.recupererMesConversations { [self] success, conversationsfromRep in
            if success {
                self.conversations = []
                for conversation in conversationsfromRep! {
                        conversations.append(conversation)
                }
                
                self.tableView.reloadData()
            }else {
                self.present(Alert.makeAlert(titre: "Error", message: NSLocalizedString("Could not load conversations", comment: "")),animated: true)
            }
        }
    }
}
