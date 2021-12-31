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
        let messageDict: Dictionary = item.userInfo?["message"] as! Dictionary<String, String>
        
        let key: String? = messageDict["message"]
        let value: String? = UserDefaults.T2E.string(forKey: key!)

        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: value as Any ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }

}
