import Firebase

class FirebaseListener {
    
    var authStateListener: FIRAuthStateDidChangeListenerHandle!
    var dispatcher = SignInDispatcher()
    
    init() {
        FIRApp.configure()
        initAuthListener()
        do {
            try FIRAuth.auth()?.signOut()
        } catch {
            print("logged out")
        }
    }
    
    deinit {
        if let auth = FIRAuth.auth() {
            auth.removeStateDidChangeListener(authStateListener)
        }
    }
    
    func initAuthListener() {
        //used to determine loggedin/loggedout
//        if let auth = FIRAuth.auth() {
//            authStateListener = auth.addStateDidChangeListener() { [weak self] (auth, user) in
////                self?.dispatcher.createAccountSuccess()
//                print("User desc: \(user.debugDescription)")
//                print("User name: \(user?.email)")
//            }
//        }
    }
}
