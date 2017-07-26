//
//  ViewController.swift
//  OAuthiOS11
//
//  Created by Hari Kunwar on 7/26/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    var authSession: SFAuthenticationSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signIn(_ sender: Any) {
        //Typedef block to handle response
        let handler: SFAuthenticationSession.CompletionHandler = { (callBack: URL?, error: Error? ) in
            guard error == nil, let successURL = callBack else {
                return
            }
            let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "oauth_token"}).first
            // Do what you now that you've got the token, or use the callBack URL
        }
        
        //OAuth Provider URL
        let authURL = URL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=amazingToken")
        //Initialize auth session
        authSession = SFAuthenticationSession(url: authURL!, callbackURLScheme: nil, completionHandler: handler)
        //Kick it off
        authSession?.start()
    }
}

