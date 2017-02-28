import ReSwift
import ReSwiftRouter

class AppCoordinator: Routable {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func setToSignInViewController() -> Routable {
        let vc = UIStoryboard(name: Constants.StoryBoards.main, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.ViewControllers.signInVC)
        self.window.rootViewController = vc
        return self
    }
    
    func setToSignedInViewController() -> Routable {
        let vc = UIStoryboard(name: Constants.StoryBoards.main, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.ViewControllers.signedInVC)
        self.window.rootViewController = vc
        return self
    }
    
    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        switch routeElementIdentifier {
        case Constants.RouteIds.signIn:
            completionHandler()
            return setToSignInViewController()
        case Constants.RouteIds.signedIn:
            completionHandler()
            return setToSignedInViewController()
        default:
            return self
        }
    }
    
    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
        switch to {
        case Constants.RouteIds.signIn:
            completionHandler()
            return setToSignInViewController()
        case Constants.RouteIds.signedIn:
            completionHandler()
            return setToSignedInViewController()
        default:
            return self
        }
    }
}
