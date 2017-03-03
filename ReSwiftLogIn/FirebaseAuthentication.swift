import Firebase

class FirebaseAuthentication: FirebaseInstance {
    
    internal func signInUser(withEmail email: String, password: String, dispatcher: SignInDispatcher) {
        //toask: just use auth()?
        if let auth = FIRAuth.auth() {
            auth.signIn(withEmail: email, password: password) { (_, error) in
                if let error = error {
                    print("Passwword/Email Sign In Error: \(error)")
                    return
                }
            }
        }
    }
    
    internal func signOutUser() {
        do {
            try FIRAuth.auth()?.signOut()
        } catch {
            print("Signout Error with Firebase")
        }
    }
    
    internal func createUser(email: String, password: String, dispatcher: SignInDispatcher) {
        if let auth = FIRAuth.auth() {
            auth.createUser(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    dispatcher.login(withEmail: email, password: password)
                }
                if let error = error {
                    print("Create User Error: \(error)")
                    return
                }
            }
        }
    }
    
    internal func signInUser(withCredential credential: FIRAuthCredential, dispatcher: SignInDispatcher) {
        if let auth = FIRAuth.auth() {
            auth.signIn(with: credential) { (user, error) in
                if let error = error {
                    print("Credential sign in error: \(error)")
                    return
                }
                if let user = user {
                    print("user's name: \(user.displayName)")
                    print("user's email: \(user.email)")
                }
            }
        }
    }
}
