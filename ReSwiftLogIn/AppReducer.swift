import ReSwift
import ReSwiftRouter

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        let newState = AppState(
            navigationState: NavigationReducer.handleAction(action, state: state?.navigationState),
            signInState: SignInReducer.handle(action: action, for: state?.signInState),
            signedInState: SignedInReducer.handle(action: action, for: state?.signedInState),
            authenticationState: AuthenticationReducer.handle(action: action, for: state?.authenticationState)
        )
        print(newState)
        return newState
    }
}
