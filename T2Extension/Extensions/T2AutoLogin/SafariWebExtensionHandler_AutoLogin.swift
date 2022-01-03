//
//  SafariWebExtensionHandler.swift
//  T2AutoLogin
//
//  Created by 大畑允人 on 2021/12/31.
//

import SafariServices

class SafariWebExtensionHandler_AutoLogin: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let messageDict: Dictionary = item.userInfo?["message"] as! Dictionary<String, Any>
        let message: [String] = messageDict["message"] as! [String]
        let funcName: String = message[0]
        
        var response: NSExtensionItem
        switch funcName {
        case "getUD":
            response = getUD(message: message)
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
    
    private func getUD(message: [String]) -> NSExtensionItem {
        let key = message[1]
        let value: String? = UserDefaults.T2E.string(forKey: key)
        
        let response = NSExtensionItem()
        response.userInfo = [ "message": value as Any ]
        return response
    }

}
