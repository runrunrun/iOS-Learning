//
//  IntentHandler.swift
//  HiSirIntent
//
//  Created by Hari Kunwar on 7/1/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Intents


// The Intents framework (Intents.framework) supports the handling of SiriKit interactions. You use the classes of this
// framework to define an Intents extension, which is an app extension that processes user requests originating from 
// Siri or Maps. When the user requests your app services through one of these conduits, the system forwards those 
// requests to your Intents extension for handling. You use the classes of this framework to receive the data from the 
// user and to provide an appropriate response.

// Examples of some of the Intents.
// INBookRestaurantReservationIntent
// Requests the creation of a reservation at the specified restaurant.
// INBookRestaurantReservationIntentResponse
// Contains your app’s response to a book restaurant reservation intent.
// INBooleanResolutionResult
// Describes the result of resolving a Boolean value associated with an intent.
// INCallRecordTypeResolutionResult
// Provides the resolution for intent parameters whose type is INCallRecordType.
// INCancelWorkoutIntent
// Cancels an active workout.
// INCancelWorkoutIntentResponse

// You will want to replace this or add other intents as appropriate.

// We are handling SendMessage intent in this class. We can handle other intents
// The intents you wish to handle must be declared in the extension's Info.plist.
// You can test your example integration by saying things to Siri like:
// "Send message in HiSir app"

class IntentHandler: INExtension, INSendMessageIntentHandling {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    // MARK: - INStartWorkoutIntentHandling
    func handle(sendMessage intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse)
        -> Swift.Void) {
        print("Sending message from HiSir.")
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent))
        let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
        completion(response)
    }

}

