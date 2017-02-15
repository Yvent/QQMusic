//
//  Network.swift
//  qqqq
//
//  Created by 周逸文 on 16/12/13.
//  Copyright © 2016年 xxxx. All rights reserved.
//

import Alamofire
import SVProgressHUD

class Network: NSObject {

    static let share = Network()
    
    var manager: SessionManager!
    
    
    fileprivate override init() {
        super.init()
        
    
        let configuration = URLSessionConfiguration.default
       
        configuration.httpAdditionalHeaders = [
            "Content-Type": "applicaiton/json"
            
        ]
        
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource  = 30
         manager = Alamofire.SessionManager(configuration: configuration)
        

        
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            
            
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = self.manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }
    
    
    func request(url: String,Method: HTTPMethod, Para:  [String: Any]? = nil,Head: [String: String]? = nil,RResult: ((AnyObject?)->())? = nil,RError: ((NSError?)->Void)? = nil) {
        SVProgressHUD.show()
        manager.request(url, method: Method, parameters: Para, encoding: JSONEncoding.default, headers: Head).responseJSON { (RJ) in
            DebugPrint(RJ)
            switch RJ.result {
                case .success:
               SVProgressHUD.dismiss()
                RResult?(RJ.result.value as AnyObject? )
                case .failure:
                SVProgressHUD.dismiss()
                 RError?(RJ.result.error as NSError?)
                }
        }
    }
    //上传文件
    func uploadForm(url: String, headers: [String : String]? = nil,multipart: @escaping (MultipartFormData) -> Void,RResult: ((DataResponse<String>?)->())? = nil,
                    RError: ((NSError?)->Void)? = nil)  {
        
       
        manager.upload(multipartFormData: multipart, to: url) { (eR) in
            DebugPrint("eR\(eR)")
            switch eR {
            case .success(let request, _, _):
                
                request.responseString(completionHandler: { (reponseString) in
                     DebugPrint(reponseString)
                    RResult?(reponseString)
                })
//                request.responseJSON(completionHandler: { (JSON) in
//                    DebugPrint(JSON)
//                    if JSON.response?.statusCode == SuccessStatusCode {
//                        RResult?(JSON.result.value as AnyObject?)
//                    } else {
//                        RError?(JSON.result.error as NSError?)
//                    }
//                })
                
            case .failure(_): break
            }
            
        }
    }
}
