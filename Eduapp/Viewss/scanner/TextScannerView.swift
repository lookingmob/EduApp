//
//  TextScannerView.swift
//  Eduapp
//
//  Created by alaa gharbi on 30/12/2022.
//

import SwiftUI
import Vision

struct TextScannerView: View {
    @State private var recognizedText: String = ""
    @State private var uiImage:UIImage?
    
    var body: some View {
        VStack {
            let image = AsyncImage(url: URL(string: "hihi.jpg")!)
            
//            { uiImage in
//                self.uiImage = uiImage
//            }
//            { image in
//                    image.resizable()
//                }
            
            Image("pdficon")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    self.recognizeTextFromImage()
                }

            Text(recognizedText)
                .font(.title)
        }
    }

    private func recognizeTextFromImage() {
        // 1. Load the image that you want to recognize text from
        
        guard let image = UIImage(named: "example-image") else { return }
//    let image = AsyncImage(url: URL(string: Consts.URL_IMAGE+"\(book.image)")){ image in
//            image.resizable()
//        }placeholder: {
//            ProgressView()
//        }
        // 2. Create a request handler using the VNImageRequestHandler class
        let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])

        // 3. Create a text recognition request
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }

            // 4. Get the recognized text from the request's results
            guard let results = request.results, !results.isEmpty else {
                print("No text found")
                return
            }

            // 5. Convert the recognized text to a string and set it to the recognizedText state variable
            if let textResult = results.first as? VNRecognizedTextObservation {
                var fullName = "First Last"
                var fullNameArr = fullName.split {$0 == " "}
                
                self.recognizedText = textResult.topCandidates(1).first?.string ?? ""
            }
        }

        // 6. Perform the text recognition request
        do {
            try requestHandler.perform([textRecognitionRequest])
        } catch {
            print(error)
        }
    }
}

struct TextScannerView_Previews: PreviewProvider {
    static var previews: some View {
        TextScannerView()
    }
}
