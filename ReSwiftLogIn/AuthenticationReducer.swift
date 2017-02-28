import ReSwift
import ReSwiftRouter

struct AuthenticationReducer {
    
    static func handle(action: Action, for state: AuthenticationState?) -> AuthenticationState {
        var state = state ?? createInitialAuthenticationState()
        switch action {
        case let action as UpdateSignedInStateAction:
            state.signedIn = action.signedIn
        default:
            break
        }
        return state
    }
}

func createInitialAuthenticationState() -> AuthenticationState {
    return AuthenticationState(signedIn: false)
}
