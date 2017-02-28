import ReSwift
import ReSwiftRouter

struct AuthenticationDispatcher {
    
    func logInSuccess() {
        mainStore.dispatch(UpdateSignedInStateAction(signedIn: true))
        mainStore.dispatch(ReSwiftRouter.SetRouteAction([Constants.RouteIds.signedIn]))
    }

    func logOutSuccess() {
        mainStore.dispatch(UpdateSignedInStateAction(signedIn: false))
        mainStore.dispatch(ReSwiftRouter.SetRouteAction([Constants.RouteIds.signIn]))
    }
}
