//
//  MessageModelView.swift
//  Eduapp
//
//  Created by alaa gharbi on 9/12/2022.
//


import Foundation
import SwiftyJSON
import Alamofire

public class MessagerieViewModel: ObservableObject{
    
    static let sharedInstance = MessagerieViewModel()
    //let userId = "6385c2462fdd752a80a093f2"
    //"/chat/my-conversations/6385c2462fdd752a80a093f2"
    
    func recupererMesConversations( completed: @escaping (Bool, [Conversation]?) -> Void ) {
        AF.request(Consts.URLchat + "my-conversations/\(UserDefaults.standard.string(forKey: "id")!)",
                   method: .get,
                  // parameters: [ "sender" : UserDefaults.standard.string(forKey: "id")!],
                   encoding: URLEncoding.default)
                   //encoding: JSONEncoding.default)
           // .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    
                    var conversation : [Conversation]? = []
                    for singleJsonItem in jsonData["conversations"] {
                        conversation!.append(self.makeConversation(jsonItem: singleJsonItem.1))
                        print(conversation)
                        
                    }
                    completed(true, conversation)
                    
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func creerNouvelleConversation(recepteur: String, completed: @escaping (Bool, Conversation?) -> Void ) {
        AF.request(Consts.URLchat + "create-conversation",
                   method: .post,
                   parameters: [
                    "sender" : UserDefaults.standard.string(forKey: "id")!,
                    "receiver" : recepteur
                   ],
                   encoding: JSONEncoding.default)
           // .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    completed(true, self.makeConversation(jsonItem: JSON(response.data!)["messages"]))
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    //"/chat/my-messages/63961ed3de7389f437a77f2c"
    func recupererMesMessages(idConversation: String, completed: @escaping (Bool, [Message]?) -> Void ) {
        AF.request(Consts.URLchat + "my-messages/\(idConversation)",
                   method: .get,
                  // parameters: [ "conversation" : idConversation ],
                   encoding: JSONEncoding.default)
          //  .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    
                    var messages : [Message]? = []
                    for singleJsonItem in jsonData["messages"] {
                        messages!.append(self.makeMessage(jsonItem: singleJsonItem.1))
                    }
                    completed(true, messages)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func envoyerMessage(recepteur: String, description: String, completed: @escaping (Bool, Message?) -> Void ) {
        AF.request(Consts.URLchat + "send-message",
                   method: .post,
                   parameters: [
                    "senderId": UserDefaults.standard.string(forKey: "id")!,
                    //"sender": "63961ed3de7389f437a77f2c",
                    "receiverId": recepteur,
                    "description": description
                   ],
                   encoding: JSONEncoding.default)
          //  .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    completed(true, self.makeMessage(jsonItem: JSON(response.data!)["newMessage"]))
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
    
    func makeMessage(jsonItem: JSON) -> Message {
        return Message(
            sender: Sender(senderId: jsonItem["senderConversation"]["sender"].stringValue, displayName: "abc"),
            messageId: jsonItem["_id"].stringValue,
            //messageId: "blablala",

            sentDate: Date(),
            kind: .text(jsonItem["description"].stringValue)
        )
    }
    
    func makeConversation(jsonItem: JSON) -> Conversation {
        return Conversation(
            _id: jsonItem["_id"].stringValue,
            lastMessage: jsonItem["lastMessage"].stringValue,
            lastMessageDate: DateUtils.formatFromString(string: jsonItem["lastMessageDate"].stringValue),
            sender: UserViewModel.sharedInstance.makeItem(jsonItem: jsonItem["sender"]),
            receiver: UserViewModel.sharedInstance.makeItem(jsonItem: jsonItem["receiver"])
        )
    }
}





