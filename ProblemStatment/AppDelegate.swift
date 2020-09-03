

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var listCoOrdinator: ListCoOrdinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        listCoOrdinator = ListCoOrdinator()
        window?.rootViewController = listCoOrdinator.rootViewController
        
        return true
    }
}

