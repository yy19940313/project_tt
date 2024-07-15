//
//  PubNubManager.swift
//  project_tt
//
//  Created by Yi Y on 7/13/24.
//

/*
import PubNub
import Combine

class PubNubManager: ObservableObject {
    var pubnub: PubNub

    init() {
        let config = PubNubConfiguration(
            publishKey: "fill",
            subscribeKey: "fill",
            uuid: UserManager.shared.userID
        )
        self.pubnub = PubNub(configuration: config)
        subscribeToChannel("chat_channel")
    }
    
    func subscribeToChannel(_ channel: String) {
        pubnub.subscribe(to: [channel])

        // Adding message listener
        pubnub.addListener(self)
    }
    
    func publishMessage(_ message: String, to channel: String) {
        pubnub.publish(channel: channel, message: ["text": message]) { result in
            switch result {
            case let .success(response):
                print("Successfully published message: \(response)")
            case let .failure(error):
                print("Failed to publish message: \(error.localizedDescription)")
            }
        }
    }
}

extension PubNubManager: PubNubListener {
    func pubnub(_ pubnub: PubNub, didReceiveMessage message: PubNubMessage) {
        if let text = message.payload["text"] as? String {
            DispatchQueue.main.async {
                self.messages.append(text)
            }
        }
    }
}
*/
