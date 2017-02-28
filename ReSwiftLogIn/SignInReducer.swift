import ReSwift

struct SignInReducer: Reducer {
    typealias ReducerStateType = SignInState
    
    let validator = AccountValidator()
    
    func handleAction(action: Action, state: SignInState?) -> SignInState {
        var state = state ?? createInitialSignInState()
        
        switch action {
        case _ as SignInActionLogIn:
            print("LOG IN")
        case let action as SignInActionCreateAccount:
            state = handleCreateAccountRequest(action: action, state: state)
        case let action as SignInActionValidateEmail:
            state = handleEmailValidationRequest(action: action, state: state)
        case let action as SignInActionValidatePassword:
            state = handlePasswordValidationRequest(action: action, state: state)
        case _ as SignInActionCreatedAccount:
            state = handleCreatedAccountRequest(state: state)
        default:
            break
        }
        print(state)
        return state
    }
    
    private func createInitialSignInState() -> SignInState {
        return SignInState(userEmail: "", userPassword: "", errorMessage: "", loading: false, signedIn: false)
    }
    
    private func handleEmailValidationRequest(action: SignInActionValidateEmail, state: SignInState) -> SignInState {
        var state = state
        let email = action.email
        if !email.isEmpty {
            if validator.validateEmail(withEmail: email) {
                state.errorMessage = ""
            } else {
                state.errorMessage = Constants.SignInErrors.invalidEmail
            }
        }
        return state
    }
    
    private func handlePasswordValidationRequest(action: SignInActionValidatePassword, state: SignInState) -> SignInState {
        var state = state
        let password = action.password
        if !password.isEmpty {
            if validator.validatePassword(withPassword: password) {
                state.errorMessage = ""
            } else {
                state.errorMessage = Constants.SignInErrors.invalidPassword
            }
        }
        return state
    }
    
    private func handleCreateAccountRequest(action: SignInActionCreateAccount, state: SignInState) -> SignInState {
        var state = state
        state.loading = true
        return state
    }
    
    private func handleCreatedAccountRequest(state: SignInState) -> SignInState {
        var state = state
        state.signedIn = true
        state.loading = false
        return state
    }
}
