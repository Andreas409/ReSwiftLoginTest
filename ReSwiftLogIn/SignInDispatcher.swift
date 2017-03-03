import ReSwift
import ReSwiftRouter
import Firebase

struct SignInDispatcher {
    
    let firebase = FirebaseAuthentication()
    
    func login(withEmail email: String, password: String) {
        firebase.signInUser(withEmail: email, password: password, dispatcher: self)
        mainStore.dispatch(SignInActionLogIn(email: email))
    }
    
    func login(withCredential credential: FIRAuthCredential) {
        firebase.signInUser(withCredential: credential, dispatcher: self)
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
