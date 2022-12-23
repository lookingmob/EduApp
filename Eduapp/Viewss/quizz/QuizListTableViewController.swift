//
//  QuizListTableViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 3/12/2022.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire
import AlamofireImage

class QuizListTableViewController: UITableViewController {
    let disposeBag = DisposeBag()
    let tems = QuizService.shared.dic
    var trans = [String:String]()
   // let tems = bookserviicee.shared.dic
    
    
    
    var collapseDetailViewController: Bool = true
    @IBOutlet var tableViewList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewList.delegate = nil
        self.tableViewList.dataSource = nil
     //   self.tableViewList.register(UINib(nibName: "QuizTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableViewList.estimatedRowHeight = 200
     //   self.tableViewList.rowHeight = Aut
        let _ = tems.asObservable().bind(to: tableViewList.rx.items(cellIdentifier: "cellq",cellType: QuizTableViewCell.self)){
            (tv,tableViewItem,cell) in
       if let bookObserver = tableViewItem.value as? Dictionary<String,String> {
           
//ki 7ejtek debloki hadhom

           //       let downloadURL = URL(string: bookObserver["image"]!)!
//
//        let  stringUrl:String = bookObserver["image"]!
//        print("*********-----------*")
//        print(bookObserver["image"])
//        print("---------------------")
      //  let url = URL(string: bookObserver["image"]!)
//        print(url)
      //     cell.cellImageVew.af.setImage(withURL: url!)
//        let imageUrl = String(bookObserver["image"]!)
//        print(imageUrl)
         
           cell.levelLb.text = bookObserver["category"]
        cell.questionLb.text = bookObserver["question"]
          }
        }
        print("-------")
//        AF.request("http://172.17.2.159:3000/quiz/",method: .get)
//          .validate()
////             .responseJSON{ (data) in
////                 print(data)
////             }
//
//            .responseDecodable(of: QuizResponse.self) { (response) in
//            guard let quizs = response.value else {
//                print(response.error)
//                    return
//            }
//
//         do{
//             for quize in quizs.questions{
//                 print(quize)
//                 print("quize")
//
//               //  self.i = self.i+1
////                 dys["category"] = quize.category
////                 dys["question"] = quize.question
////
////                 print("-----------")
////               //  print(dys["image"]!)
////                 print("------------------")
////                 print(dys["category"])
////                 print("///////////////////")
////                 print(dys["question"])
////                 obs[String(self.i)] = dys
////             print(quizs)
//              }
////             print(obs)
////             print("-------")
//            }
//           //     self.dic.accept(obs)
//              //  print("1111111")
//
//            }
        ///
        QuizService.shared.getQuizs()
        print("*******")
        tableViewList.rx.itemSelected
                 .subscribe(onNext: {
                 book in
                     print(book.item)
                  print("*******-------")
                     let  bookitem = QuizService.shared.getQuiz(val: String(book.item) )
                     print(bookitem)
                     
                   //   let detailVC = DetailViewController()
                  //   BookService().getbooks()
                 //   self.showDetailViewController(QuizDetailViewController(), sender: nil)
                    
                     QuizConsts.category =  bookitem["category"]!
                     QuizConsts.ques = bookitem["question"]!
                     QuizConsts.id = bookitem["id"]!
                     QuizConsts.anwser1 = bookitem["incorrectAnswer1"]!
                     QuizConsts.answer2 = bookitem["incorrectAnswer2"]!
                     QuizConsts.answer3 = bookitem["incorrectAnswer3"]!
                     QuizConsts.correctanswer = bookitem["answer"]!
                     self.performSegue(withIdentifier: "detailquiz", sender: nil)
                             //   Taks.init(datetime: bookitem["datetime"]!, temperature: bookitem["temperature"]!, icon: ss)
              // let firt = Bundle.main.loadNibNamed("DetailView", owner: nil, options: nil)?.first as! DetailView
              //   self.addSubview(firt)
            
                     
                     
                // answer2: bookitem["incorrectAnswer2"]!,
                // answer3: bookitem["incorrectAnswer3"]!,
              //   category: bookitem["category"]!)
                   //  Consts.category = bookitem.isEmpty
                 })
                .disposed(by: disposeBag)
    }


    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath)
    {
        self.collapseDetailViewController = false
    }


}
