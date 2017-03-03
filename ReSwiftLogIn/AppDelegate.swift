import UIKit
import ReSwift 
import Firebase
import ReSwiftRouter
import FBSDKCoreKit
import FBSDKLoginKit
import Google
import GoogleSignIn

let mainStore = Store<AppState>(reducer: AppReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var firebaseListener: FirebaseListener?
    var router: Router<AppState>!
    let firebase = FirebaseAuthentication()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initialiseFirebaseListeners()
        configureRouter()
        routeViewControllers()
        initGoogleSignIn()
        window?.makeKeyAndVisible()
        return initFacebookSignIn(application, launchOptions)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let facebookHandle = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        let googleHandle = GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
        return facebookHandle && googleHandle
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
        let facebookHandle = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: [:])
        let googleHandle = GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: [:])
        return facebookHandle && googleHandle
    }

    private func initFacebookSignIn(_ application: UIApplication, _ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
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
