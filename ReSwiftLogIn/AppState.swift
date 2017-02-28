import ReSwift
import ReSwiftRouter

struct AppState: StateType, HasNavigationState {
    var navigationState: NavigationState
    var signInState: SignInState
    var signedInState: SignedInState
    var authenticationState: AuthenticationState
}
