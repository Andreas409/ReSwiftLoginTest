import ReSwift

struct SignedInReducer {
    
    static func handle(action: Action, for state: SignedInState?) -> SignedInState {
        var state = state ?? createInitialSignedInState()
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
