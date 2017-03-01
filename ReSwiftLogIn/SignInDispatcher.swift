import ReSwift
import ReSwiftRouter

struct SignInDispatcher {
    
    let firebase = FirebaseAuthentication()
    
    func login(email: String, password: String) {
        firebase.signInUser(email: email, password: password, dispatcher: self)
        mainStore.dispatch(SignInActionLogIn(email: email))
    }
    
    func createAccount(email: String, password: String) {
        //toask: use of self like this feels wrong? how to bring up completion block?
        firebase.createUser(email: email, password: password, dispatcher: self)
        mainStore.dispatch(SignInActionCreateAccount(email: email))
    }
    
    func validateEmail(email: String) {
        mainStore.dispatch(SignInActionValidateEmail(email: email))
    }
    
    func validatePassword(password: String) {
        mainStore.dispatch(SignInActionValidatePassword(password: password))
    }
}
