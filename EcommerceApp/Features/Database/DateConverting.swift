import Foundation

//MARK: Date Converting Protocol

protocol DateConvertingProtocol {
    func ConvertDate () -> String
}

//MARK: Date Converting 

final class DateConverting: DateConvertingProtocol {
    
    func ConvertDate () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        
        formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        
        let myStringafd = formatter.string(from: yourDate!)
        
        return myStringafd
    }
}
