//
//  ScannerView.swift
//  Eduapp
import SwiftUI
import VisionKit
import PDFKit
import UIKit
struct scanView: View{
@Environment(\.presentationMode) var mode
@State var pdfName = ""
@State var addDoc = false
@Binding var files : [String]
@ObservedObject var scannerModel: ScannerModel
var body: some View{
ZStack{
VStack{
if let error = scannerModel.errorMessage {
Text(error)
} else {
ForEach(scannerModel.imageArray, id: \.self) { image in
Image(uiImage: image)
.resizable()
.aspectRatio(contentMode: .fit).contextMenu {
Button {
let items = [image]
let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.present(ac, animated: true)
} label: {
Label("Share", systemImage: "square.and.arrow.up")
}
Divider()
Button {
scannerModel.removeImage(image: image)
} label: {
Label("Delete", systemImage: "delete.left")
}
}
}
Button(action: {
withAnimation{
addDoc = true
}
}, label: {
VStack{
Image(systemName: "plus").font(.largeTitle)
Text("Scan Document")
}
})
}
}.navigationBarItems( trailing: Button(action:{
guard pdfName.count > 0 else{
return
}
self.mode.wrappedValue.dismiss()
saveDocument(a: scannerModel.imageArray, b: pdfName)
scannerModel.imageArray.removeAll()
files = getDocumentsDirectory()
}){
Text("Save")
})
if(addDoc){
VStack{
Spacer()
VStack{
Text("Please Enter a Title").font(.largeTitle)
TextField("Enter Title", text: $pdfName).multilineTextAlignment(.center)
Button(action: {
guard pdfName.count > 0 else{
return
}
UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.present(scannerModel.getDocumentCameraViewController(), animated: true, completion: nil)
addDoc = false
}){
Text("Next").foregroundColor(.white)
}
}.padding().background(Color.blue).padding().ignoresSafeArea()
}
}
}
}
}
