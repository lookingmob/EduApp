//
//  ContentView.swift
//  Eduapp
//
//Islem Naffeti
import SwiftUI
import VisionKit
import PDFKit
final class ScannerModel: NSObject, ObservableObject {
@Published var errorMessage: String?
@Published var imageArray: [UIImage] = []
 
func getDocumentCameraViewController() -> VNDocumentCameraViewController {
let vc = VNDocumentCameraViewController()
vc.delegate = self
return vc
}
func removeImage(image: UIImage) {
imageArray.removeAll{$0 == image}
}
}
func getDocumentsDirectory() -> [String] {
do {
var a : [String] = []
let fm = FileManager.default
let path =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
print(path)
let items = try fm.contentsOfDirectory(atPath: path)
for item in items {
print("Found \(item)")
a.append(item.description)
}
return a
} catch {
// failed to read directory – bad permissions, perhaps?
let a : [String] = []
return a
}
}
func DeleteFile(file: String) {
let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
let documentDirectory = paths[0]
let filePath = documentDirectory.appendingFormat("/" + file)
do {
let fileManager = FileManager.default
// Check if file exists
if fileManager.fileExists(atPath: filePath) {
// Delete file
try fileManager.removeItem(atPath: filePath)
} else {
print("File does not exist")
}
}
catch let error as NSError {
print("An error took place: \(error)")
}
print("removed")
}
func saveDocument(a: [UIImage], b: String){
do{
let pdfDocument = PDFDocument()
for i in a.indices{
let pdfPage = PDFPage(image: a[i])
pdfDocument.insert(pdfPage!, at: i)
}
let data = pdfDocument.dataRepresentation()
let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let docURL = documentDirectory.appendingPathComponent((b + ".pdf"))
print(docURL)
try data?.write(to: docURL)
}catch(let error){
print("error is \(error.localizedDescription)")
}
}
//this extension enables the camera to scan the document
extension ScannerModel: VNDocumentCameraViewControllerDelegate {
    //when canceled, it goes back
func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
controller.dismiss(animated: true, completion: nil)
}
    //checks for error
func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
errorMessage = error.localizedDescription
}
    //when it is done, it adds the image to the array
func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
print("Did Finish With Scan.")
    
for i in 0..<scan.pageCount {
    
self.imageArray.append(scan.imageOfPage(at:i))
}
controller.dismiss(animated: true, completion: nil)
}
}
//struct ContentView: View {
//@ObservedObject var scannerModel: ScannerModel
//@State var files : [String] = []
//@State var PDFview = false
//@State var fileName = ""
//@State var url = URL(string: "")
//var pdf : some View{
//LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width/4))], spacing: 20){
//ForEach( files.indices, id: \.self){ file in
//VStack{
//Image("docs").resizable().aspectRatio(contentMode: .fit)
//Spacer()
//Text("\(files[file])").font(.caption).onTapGesture {
//withAnimation{
//let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//let documentDirectory = paths[0].appendingPathComponent(files[file])
//let filePath = documentDirectory
//url = filePath
//fileName = files[file]
//PDFview = true
//}
//}
//}.padding().frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/3).background(Color.gray).overlay(
//VStack{
//HStack{
//Spacer()
//Button(action: {
//DeleteFile(file: files[file])
//files.remove(at: file)
//}){
//Text("Delete")
//}
//}
//Spacer()
//}
//).padding(.horizontal)
//}
//VStack{
//Spacer()
//NavigationLink(destination: scanView(files: $files, scannerModel: scannerModel)){
//VStack{
//Image(systemName: "plus").font(.largeTitle).padding(.bottom)
//Text("Scan New Document").font(.caption)
//}
//}
//Spacer()
//}.padding().frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/3).background(Color.gray).padding(.horizontal)
//}.padding()
//}
//struct pdfOpen : View{
//@Binding var PDFview : Bool
//@State var share = false
//var url : URL
//var fileName : String
//@State var printPDF = false
//@State var pdfShare = PDFView()
//@State var fileToShare = [Any]()
//var body: some View{
//VStack{
//HStack(alignment: .bottom){
//Button(action: {
//withAnimation{
//PDFview = false
//}
//}){
//Text("Back").fontWeight(.semibold)
//}
//Spacer()
//Text(fileName).fontWeight(.semibold)
//Spacer()
//Button(action: {
//withAnimation{                        fileToShare.removeAll()
//pdfShare.document = PDFDocument(url: url)
//fileToShare.append(NSURL(fileURLWithPath: url.absoluteString))
//print(fileToShare.description)
//share.toggle()
//}
//}){
//Image(systemName: "square.and.arrow.up").font(.title3)
//}.sheet(isPresented: $share, content: {
//                  ActivityViewController(activityItems: [pdfShare.document?.dataRepresentation()]).edgesIgnoringSafeArea(.all)
//ActivityViewController(activityItems: [NSURL(fileURLWithPath: url.relativePath)]).edgesIgnoringSafeArea(.all)
//})
//}.padding()
//PDFKitRepresentedView(url)
//Spacer()
//Button(action: {
//printPDF = true
//}){
//Text("Print")
//}
//}
//}
//}
//var body: some View {
//ZStack{
//if(PDFview){
//pdfOpen(PDFview: $PDFview, url: url!, fileName: fileName)
//}
//else{
//NavigationView{
//VStack{
//pdf.onAppear{
//withAnimation(){
//files = getDocumentsDirectory()
//}
//}
//Spacer()
//}.navigationBarTitle("My PDF Reader", displayMode: .large)
//}
//}
//}
//}
//}
struct ContentView_Previews: PreviewProvider {
static var previews: some View {
//ContentView(scannerModel: ScannerModel())
    ContentView(books: Book(id: "", bookname: "", authname: "", edition: "", degre: "", image: "",price: 0))
}
}
struct PDFKitRepresentedView: UIViewRepresentable {
let url: URL
init(_ url: URL) {
self.url = url
}
func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
// Create a PDFView and set its PDFDocument.
let pdfView = PDFView()
pdfView.document = PDFDocument(url: self.url)
pdfView.pageBreakMargins = UIEdgeInsets(top: 50, left: 30, bottom: 50, right:30)
pdfView.autoScales = true
return pdfView
}
func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
// Update the view.
}
}
struct ActivityViewController: UIViewControllerRepresentable {
var activityItems: [Any]
var applicationActivities: [UIActivity]? = nil
func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
return controller
}
func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
