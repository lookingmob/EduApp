//
//  DocumentView.swift
//  EduApp
//
//  Created by islem on 19/11/2022.
//

import SwiftUI
import PDFKit


struct DocumentView: View {
    var pdfView: PDFViewUI!
    var dismiss:() -> Void
    var body: some View {
        VStack{
            pdfView
            
            Button("Done",action: dismiss)
        }
    }
}

struct PDFViewUI : UIViewRepresentable {
    let pdfView = PDFView()
    var url: URL?
    init(url: URL) {
        self.url = url
    }
    func makeUIView(context: Context) -> UIView {
        if let url = url {
            
            pdfView.document = PDFDocument(url: url)
        }
        return pdfView
    }
    func updateUIView(_ uiView:UIView, context: Context){
        
    }
    
}
