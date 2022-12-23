//
//  ScanData.swift
//  Eduapp
//
//  Created by alaa gharbi on 22/12/2022.
//
import Foundation
struct ScanData : Identifiable{
    var id = UUID()
    let content : String
    init(content: String) {
      
        self.content = content
    }
}
