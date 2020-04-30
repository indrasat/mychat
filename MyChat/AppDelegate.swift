//
//  AppDelegate.swift
//  MyChat
//
//  Created by Indra Kurniawan on 11/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options:
            [[.alert, .sound, .badge]],
                                                                completionHandler: { _, _ in
                                                                    // Handle Error
        })
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        ConversationSimulator.leftApplication()
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler
                                    completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        PushNotificationController.received(notification: notification) { shouldShowNotification in
            guard shouldShowNotification else {
                completionHandler([])
                return
            }
            completionHandler([.badge, .sound, .alert])
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        PushNotificationController.handle(response: response)
        completionHandler()
    }
}
