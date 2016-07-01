//
//  IntentHandler.swift
//  HiSirIntent
//
//  Created by Hari Kunwar on 7/1/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Intents

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send message in HiSir app"

class IntentHandler: INExtension, INSendMessageIntentHandling {
    
    override func handler(for intent: INIntent) -> AnyObject {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    // MARK: - INStartWorkoutIntentHandling
    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Swift.Void) {
        print("Sending message from HiSir.")
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent))
        let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
        completion(response)
    }

}

