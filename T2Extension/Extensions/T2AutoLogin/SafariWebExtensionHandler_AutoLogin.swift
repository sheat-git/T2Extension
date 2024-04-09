//
//  SafariWebExtensionHandler_AutoLogin.swift
//  T2AutoLogin
//
//  Created by 大畑允人 on 2021/12/31.
//

import KeychainAccess
import SafariServices

class SafariWebExtensionHandler_AutoLogin: NSObject, NSExtensionRequestHandling {
    private static let schemaVersion: Int = UserDefaults.T2E.object(forKey: "SchemaVersion") as? Int ?? 1

    private func getValue(key: String) -> String {
        switch Self.schemaVersion {
        case 1:
            return UserDefaults.T2E.string(forKey: key) ?? ""
        case 2:
            let keychain = Keychain(service: "tokyo.sheat.T2Extension", accessGroup: Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String + "T2AccountShareGroup")
            return (try? keychain.getString(key)) ?? ""
        default:
            return ""
        }
    }

    func beginRequest(with context: NSExtensionContext) {
        let messageKey: String
        if #available(iOS 17.0, macOS 14.0, *) {
            messageKey = SFExtensionMessageKey
        } else {
            messageKey = "message"
        }

        let request = context.inputItems.first as! NSExtensionItem
        let message = request.userInfo?[messageKey] as! [String: Any]

        let response = NSExtensionItem()

        if let function = message["function"] as? String {
            switch function {
            case "GET_ACCOUNT":
                let account = getValue(key: "Account")
                let password = getValue(key: "Password")
                var rows: [String] = []
                for i in 1 ... 7 {
                    rows.append(getValue(key: "Row\(i)"))
                }
                response.userInfo = [messageKey: [
                    "id": account,
                    "password": password,
                    "rows": rows,
                ]]
            case "GET_PASSWORD":
                response.userInfo = [messageKey: getValue(key: "Password")]
            default:
                break
            }
        }

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}
