
import SwiftUI

struct ScanerView: View {
    @State private var showScannerSheet = false
    @State private var texts : [ScanData] = []
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts) { text in
                            NavigationLink(destination: ScrollView{Text(text.content)}, label: {
                                Text(text.content).lineLimit(1)
                            })
                        }
                    }
                }else{
                    Text("no scan yet") .font(.title)               }
                
            }.navigationTitle("scanner")
                .navigationBarItems(trailing: Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    Image(systemName: "doc.text.viewfinder").font(.title)
                }).sheet(isPresented: $showScannerSheet, content: {
                    makeScannerView()
                    
                })
                )
        }
    }
    private func makeScannerView()->ScanKit{
        ScanKit(completion: {
            textPerpage in
            if let outputText = textPerpage?.joined(separator: "\n*").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
                print(newScanData)
            }
            self.showScannerSheet = false
        })
    }
   private func compareStrings(){
        var count = 0
           let string = "chiaii::acioajci - dfdfs *ds f::ddf / *- _::_:-"
        let secondstring = "chicaii::acioajci - df::dfs *ds f::ddf / *- _::_:-"

           let components = string.components(separatedBy: "::")
           let secondcomponents = secondstring.components(separatedBy: "::")
           print(components)
           print(secondcomponents)

        for i in 0..<min(components.count, secondcomponents.count) {
            if components[i] != secondcomponents[i] {
                count += 1
            }
        }

        if components.count > secondcomponents.count {
            count += components.count - secondcomponents.count
        } else if secondcomponents.count > components.count {
            count += secondcomponents.count - components.count
        }

        print("Number of different elements: \(count)")
        
        
        // prints "Number of different elements: 1"
       }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScanerView()
    }
}
