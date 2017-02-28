import ReSwift
import ReSwiftRouter

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            navigationState: NavigationReducer.handleAction(action, state: state?.navigationState),
            signInState: SignInReducer.handle(action: action, state: state?.signInState)
        )
    }
}
