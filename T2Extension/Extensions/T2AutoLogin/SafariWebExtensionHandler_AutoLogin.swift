//
//  SafariWebExtensionHandler.swift
//  T2AutoLogin
//
//  Created by 大畑允人 on 2021/12/31.
//

import SafariServices
import KeychainAccess

class SafariWebExtensionHandler_AutoLogin: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let messageDict: Dictionary = item.userInfo?["message"] as! Dictionary<String, Any>
        let message: [String] = messageDict["message"] as! [String]
        let funcName: String = message[0]
        
        var response: NSExtensionItem
        let schemaVersion: Int = UserDefaults.T2E.object(forKey: "SchemaVersion") as? Int ?? 1
        
        switch schemaVersion {
        case 1:
            switch funcName {
            case "getUD":
                response = getUD(key: message[1])
            case "getAccount":
                response = getUD(key: "Account")
            case "getPassword":
                response = getUD(key: "Password")
            case "getRow":
                response = getUD(key: "Row\(message[1])")
            default:
                response = responceNil()
            }
        case 2:
            switch funcName {
            case "getAccount":
                response = getKC(key: "Account")
            case "getPassword":
                response = getKC(key: "Password")
            case "getRow":
                response = getKC(key: "Row\(message[1])")
            default:
                response = responceNil()
            }
        default:
            response = responceNil()
        }

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
    
    private func responceNil() -> NSExtensionItem {
        let response = NSExtensionItem()
        response.userInfo = [ "message": "" as Any ]
        return response
    }
    
    private func getUD(key: String) -> NSExtensionItem {
        let value: String? = UserDefaults.T2E.string(forKey: key)
        
        let response = NSExtensionItem()
        response.userInfo = [ "message": value as Any ]
        return response
    }
    
    private func getKC(key: String) -> NSExtensionItem {
        let keychain = Keychain(service: "tokyo.sheat.T2Extension", accessGroup: Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String + "T2AccountShareGroup")
        
        let value: String? = try? keychain.getString(key)
        
        let response = NSExtensionItem()
        response.userInfo = [ "message": value as Any ]
        return response
    }

}
