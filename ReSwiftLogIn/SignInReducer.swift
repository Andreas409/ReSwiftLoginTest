import ReSwift

struct SignInReducer: Reducer {
    typealias ReducerStateType = SignInState
    
    func handleAction(action: Action, state: SignInState?) -> SignInState {
        var state = state ?? SignInState()
        
        switch action {
        case _ as SignInActionLogIn:
            print("something")
        case _ as SignInActionCreateAccount:
            print("something")
        case _ as SignInActionValidateEmail:
            //todo expand on this
            if state.userEmail.isEmpty {
                state.errorMessage = "Valid email required"
            }
        case _ as SignInActionValidatePassword:
            if state.userPassword.isEmpty {
                state.errorMessage = "Password can't be empty"
            }
        default:
            break
        }
        return state
    }
}
