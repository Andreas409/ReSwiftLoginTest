import ReSwift

struct SignedInReducer {
    
    static func handle(action: Action, for state: SignedInState?) -> SignedInState {
        var state = state ?? createInitialSignedInState()
        switch action {
        case _ as UserSignedOutAction:
            state = handleSignOutRequest(state: state)
        case let action as CreateUsernameAction:
            state = handleUsernameRequest(action: action, state: state)
        default:
            break
        }
        return state
    }
}

func createInitialSignedInState() -> SignedInState {
    return SignedInState(userName: "")
}

func handleSignOutRequest(state: SignedInState) -> SignedInState {
    var state = state
    state.userName = ""
    return state
}

func handleUsernameRequest(action: CreateUsernameAction, state: SignedInState) -> SignedInState {
    let email = action.email
    var state =  state
    state.userName = email.components(separatedBy: "@")[0]
    return state
}
