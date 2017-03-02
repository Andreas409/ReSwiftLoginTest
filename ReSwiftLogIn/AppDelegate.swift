import UIKit
import ReSwift 
import Firebase
import ReSwiftRouter
import FBSDKCoreKit
import FBSDKLoginKit

let mainStore = Store<AppState>(reducer: AppReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var firebaseListener: FirebaseListener?
    var router: Router<AppState>!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initialiseFirebaseListeners()
        configureRouter()
        routeViewControllers()
        window?.makeKeyAndVisible()
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        return handled
    }

    private func initialiseFirebaseListeners() {
        firebaseListener = FirebaseListener()
    }
    
    private func configureRouter() {
        router = Router(store: mainStore, rootRoutable: AppCoordinator(window: window!)) { state in
            return state.navigationState
        }
    }
    
    private func routeViewControllers() {
        if mainStore.state.authenticationState.signedIn {
            mainStore.dispatch(ReSwiftRouter.SetRouteAction([Constants.RouteIds.signedIn]))
        } else {
            mainStore.dispatch(ReSwiftRouter.SetRouteAction([Constants.RouteIds.signIn]))
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
}
