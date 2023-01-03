//
//  PDFComponent.swift
//  EduApp
//
//  Created by islem on 19/11/2022.
//

import PDFKit
import SwiftUI


struct PDFComponent: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        return pdfView
    }
    func updateUIView(_ uiView: PDFView, context: Context) {
     print("PDF Component printed!")
    }
}
