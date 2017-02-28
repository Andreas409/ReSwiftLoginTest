import ReSwift

struct SignInReducer {
    typealias ReducerStateType = SignInState
    
    static func handle(action: Action, state: SignInState?) -> SignInState {
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
        case _ as SignInActionCreatedAccount:
            state = handleCreatedAccountRequest(state: state)
        case _ as SignInActionLogInSuccess:
            state = handleLogInSuccessRequest(state: state)
        case _ as SignInActionSignOut:
            state = handleSignOutRequest(state: state)
        default:
            break
        }
        print(state)
        return state
    }
}

let validator = AccountValidator()

func createInitialSignInState() -> SignInState {
    return SignInState(userEmail: "", userPassword: "", errorMessage: "", loading: false, signedIn: false)
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

func handleCreatedAccountRequest(state: SignInState) -> SignInState {
    var state = state
    state.signedIn = true
    state.loading = false
    return state
}

func handleLogInRequest(state: SignInState) -> SignInState {
    var state = state
    state.loading = true
    return state
}

func handleLogInSuccessRequest(state: SignInState) -> SignInState {
    var state = state
    state.loading = false
    state.signedIn = true
    return state
}

func handleSignOutRequest(state: SignInState) -> SignInState {
    var state = state
    state.signedIn = false
    return state
}
