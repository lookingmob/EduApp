//
//  DocumentBrowserViewController.swift
//  EduApp
//
//  Created by islem on 19/11/2022.
//

import UIKit
import SwiftUI

class DocumentBrowserViewController: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        allowsDocumentCreation = true
        allowsPickingMultipleItems = false
        
    }
    
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didRequestDocumentCreationWithHandler importHandler: @escaping (URL?,UIDocumentBrowserViewController.ImportMode)-> Void) {
        
        let newDocumentURL: URL? = nil
        
        if newDocumentURL != nil {
            importHandler(newDocumentURL, .move)
        }
        else{
            importHandler(nil, .none)
        }
    }
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickerDocumentsAt documentURLs: [URL]) {
        guard let sourceURL = documentURLs.first else {return}
        presentDocument(at: sourceURL)
    }
    func documentBrowser(_ controller: UIDocumentBrowserViewController, didImportDocumentAt sourceURL: URL, toDestinationURL destinationURL: URL) {
        presentDocument(at: destinationURL)
    }
    func documentBrowser(_ controller: UIDocumentBrowserViewController, failedToImportDocumentAt documentURL: URL, error: Error?) {
        
    }
    
    func presentDocument(at documentURL: URL){
        let document = Document(fileURL: documentURL)
        let pdfView = PDFViewUI(url: documentURL)
    
    document.open(completionHandler: { success in
        if success {
            let view = DocumentView(pdfView: pdfView, dismiss:{
                self.closeDocument(document)
            })
            let documentViewController = UIHostingController(rootView: view)
            self.present(documentViewController, animated: true, completion: nil)
        }else{
            }
    })
}

func closeDocument(_ document: Document){
    dismiss(animated: true){
        document.close(completionHandler: nil)
        }
    }
}
                        
