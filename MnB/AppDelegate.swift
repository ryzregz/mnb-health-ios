//
//  AppDelegate.swift
//  MnB
//
//  Created by Morris Murega on 7/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var config:Config?
    let TAG = "AppDelegateScene"
    //
    static var AppConfig:Config?{
        get{
            return config
        }
        set{
            config = newValue
        }
    }
    
    static var AppStore:[String:Any]{
        get{
            if let userInformation = UserDefaults.standard.dictionary(forKey: Constants.DEFAULT_USER_STORE_KEY){
                //Old value
                return userInformation
            }else{
                //New Instance
                let userInfo = [String:Any]()
                //
                UserDefaults.standard.set(userInfo, forKey: Constants.DEFAULT_USER_STORE_KEY)
                //
                return userInfo
            }
        }
        set{
            //Overwrite
            UserDefaults.standard.set(newValue, forKey: Constants.DEFAULT_USER_STORE_KEY)
        }
    }
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //UINavigationBar.appearance().barTintColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
       // UINavigationBar.appearance().tintColor = UIColor(red:0.0, green: 188.0, blue: 254.0, alpha: 1.0 )
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        do {
            //
            if let url = Bundle.main.url(forResource: Constants.KEY_CONFIG_FILE, withExtension: Constants.KEY_PLIST_FILE) {
                //
                let data = try Data(contentsOf: url)
                //
                AppDelegate.config = try PropertyListDecoder().decode(Config.self, from: data)
            }
        }catch{
            print(error)
            Logger.Log(from:self,with:"\(TAG): \(Constants.KEY_CONFIG_READ_ERROR) \(error)")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

