import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate")
        Appearance.setGlobalAppearance()
        
        let initial1Controller = window?.rootViewController as! UITabBarController
        
        let initial2Controller = initial1Controller.viewControllers?.first as! UINavigationController
        //let initialController = window?.rootViewController as! UITabBarController
        
        let accountsViewController = initial2Controller.viewControllers.first as! AccountsViewController
        accountsViewController.stateController = StateController.shared
        return true
    }
}
