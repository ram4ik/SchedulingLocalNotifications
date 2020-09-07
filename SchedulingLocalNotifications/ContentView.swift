//
//  ContentView.swift
//  SchedulingLocalNotifications
//
//  Created by ramil on 07.09.2020.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                    
                    if success {
                        print("All Set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }, label: {
                Text("Request Permission")
            })
            
            Button(action: {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            }, label: {
                Text("Schedule Notification")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
