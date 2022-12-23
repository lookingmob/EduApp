//
//  BookService.swift


import Foundation
/*class BookService: ObservableObject{
    
    func getAllBooks(urlStr:String,httpMethod:String,headerFields:[String:String] = [:]) async throws -> Any?
    {
        guard let url = URL(string: urlStr ) else { return nil }
        var urlReqest = URLRequest(url: url)
        urlReqest.allHTTPHeaderFields = headerFields
        urlReqest.httpMethod = httpMethod
        urlReqest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data,response) = try await URLSession.shared.data(for: urlReqest)
        
        if let response = (response as? HTTPURLResponse)
        {
            
            if response.statusCode == 200
            {
                let decodedData = try JSONDecoder().decode(BookiResponse.self, from: data)
                return decodedData
                
            }else{
                
                return nil
            }
            
        }else{
            
            return nil
            
        }
        
    }
}
*/
