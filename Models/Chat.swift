//
//  ChatModel.swift
//  ChatBoxiOS21
//
//  Created by Xavier on 9/10/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//
//This uuid is the key and the calue is a dictionary(which is our object)
//let dictionary = [String:[String:String]]()

import Foundation


struct Chat {
    
    //Private protects these keys so they cant be reached outside of the class
    private let messageKey = "message"
    private let uuidKey = "uuid"
    
    //our object in it's simplest form
    let message: String
    let uuid: UUID
    
    //THIS IS For creating
    init(message: String, uuid: UUID = UUID()) {
        self.message = message
        self.uuid = uuid
    }
    
    //this is for retrieving
    init?(dictionary: [String: Any], identifier: String) {
        guard let message = dictionary[messageKey] as? String,
        let uuid =  UUID(uuidString: identifier) else { return nil }
        
        self.message = message
        self.uuid = uuid
    }
    
    //This will turn our object into a dictionary so we can store it to firebase
    // This is a computed property. Our object is above
    var dictionaryRep: [String: Any] {
    let dictionary = [
        messageKey: message,
        uuidKey : uuid.uuidString
        ]
        return dictionary
    }
    
    //We cant just send a dictionary across the web, we have to turn it into Data first. (reference willy wonka video)
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRep, options: .prettyPrinted)
        
    }
    
    
    
    
    
}













