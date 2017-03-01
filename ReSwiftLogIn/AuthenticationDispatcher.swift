import ReSwift
import ReSwiftRouter

struct AuthenticationDispatcher {
    
    func logInSuccess(email: String) {
        mainStore.dispatch(UpdateSignedInStateAction(signedIn: true))
        mainStore.dispatch(UpdateLoadingStateAction(loading: false))
        mainStore.dispatch(CreateUsernameAction(email: email))
        mainStore.dispatch(ReSwiftRouter.SetRouteAction([Constants.RouteIds.signedIn]))
    }

    func logOutSuccess() {
        mainStore.dispatch(UpdateSignedInStateAction(signedIn: false))
        mainStore.dispatch(ReSwiftRouter.SetRouteAction([Constants.RouteIds.signIn]))
    }
}
