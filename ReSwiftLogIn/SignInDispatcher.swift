import ReSwift
import ReSwiftRouter

struct SignInDispatcher {
    
    let firebase = FirebaseAuthentication()
    
    func login(email: String, password: String) {
        mainStore.dispatch(SignInActionLogIn(email: email, password: password))
    }
    
    func createAccount(email: String, password: String) {
        firebase.createUser(email: email, password: password, dispatcher: self)
        mainStore.dispatch(SignInActionCreateAccount(email: email, password: password))
    }
    
    func validateEmail(email: String) {
        mainStore.dispatch(SignInActionValidateEmail(email: email))
    }
    
    func validatePassword(password: String) {
        mainStore.dispatch(SignInActionValidatePassword(password: password))
    }
    
    func createAccountSuccess() {
        mainStore.dispatch(SignInActionCreatedAccount())
    }
}
