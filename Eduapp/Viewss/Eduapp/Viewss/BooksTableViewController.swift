//
//  BooksTableViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 5/12/2022.
//list storyboard
/*
import UIKit
import RxCocoa
import RxSwift
import Alamofire
import AlamofireImage
class BooksTableViewController : UITableViewController
{
    let disposeBag = DisposeBag()
    let tems = bookserviicee.shared.dic
    var collapDetailViewController: Bool = true
    @IBOutlet var ttableView: UITableView!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ttableView.delegate = nil
        self.ttableView.dataSource = nil
        //self.ttableView
        self.ttableView.estimatedRowHeight = 300
        let _ = tems.asObservable().bind(to: ttableView.rx.items(cellIdentifier: "cellb",cellType: BooksTableViewCell.self)){
            (tv,tableViewItem,cell) in
       if let bookObserver = tableViewItem.value as? Dictionary<String,String> {
           cell.booktitle.text = bookObserver["bookname"]
        cell.degree.text = bookObserver["edition"]
          }
        }
        print("-------")
        bookserviicee.shared.getbooks()
        print("*******")
        ttableView.rx.itemSelected
                 .subscribe(onNext: {
                 book in
                     print(book.item)
                  print("*******-------")
                   let  bookitem = bookserviicee.shared.getQuiz(val: String(book.item) )
                     print(bookitem)
                     let url = URL(string: "http://172.17.5.182:3000/user/upload/upload_1669997547448.pdf")
                     print(url)
                     PDFComponent(url:  url!)
                 })
                .disposed(by: disposeBag)
    }
   
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath)
    {
        self.collapDetailViewController = false
    }
}
*/
