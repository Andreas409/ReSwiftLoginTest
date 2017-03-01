import ReSwift

struct SignInReducer {
    
    static func handle(action: Action, for state: SignInState?) -> SignInState {
        var state = state ?? createInitialSignInState()
        
        switch action {
        case _ as SignInActionLogIn:
            state = handleLogInRequest(state: state)
        case _ as SignInActionCreateAccount:
            state = handleCreateAccountRequest(state: state)
        case let action as SignInActionValidateEmail:
            state = handleEmailValidationRequest(action: action, state: state)
        case let action as SignInActionValidatePassword:
            state = handlePasswordValidationRequest(action: action, state: state)
        case let action as UpdateLoadingStateAction:
            state = handleUpdateLoadingStateRequest(action: action, state: state)
        default:
            break
        }
        return state
    }
}

let validator = AccountValidator()

func createInitialSignInState() -> SignInState {
    return SignInState(userEmail: "", errorMessage: "", loading: false)
}

func handleEmailValidationRequest(action: SignInActionValidateEmail, state: SignInState) -> SignInState {
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

func handlePasswordValidationRequest(action: SignInActionValidatePassword, state: SignInState) -> SignInState {
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

func handleCreateAccountRequest(state: SignInState) -> SignInState {
    var state = state
    state.loading = true
    return state
}

func handleLogInRequest(state: SignInState) -> SignInState {
    var state = state
    state.loading = true
    return state
}

func handleUpdateLoadingStateRequest(action: UpdateLoadingStateAction, state: SignInState) -> SignInState {
    var state = state
    state.loading = action.loading
    return state
}
