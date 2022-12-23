//
//  Document.swift
//  EduApp
//
//  Created by islem on 19/11/2022.
//
import UIKit
import PDFKit

class Document: UIDocument{
    
    override func contents(forType typeName: String) throws -> Any {
        return Data()
    }
  
    
    override func load(fromContents contents: Any , ofType typeName:String?) throws {
        print(self.fileURL)
    }
    
}
