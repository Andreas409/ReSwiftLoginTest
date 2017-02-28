import Firebase

class FirebaseListener {
    
    var authStateListener: FIRAuthStateDidChangeListenerHandle!
    let dispatcher = SignInDispatcher()
    
    init() {
        FIRApp.configure()
        initAuthListener()
    }
    
    deinit {
        if let auth = FIRAuth.auth() {
            auth.removeStateDidChangeListener(authStateListener)
        }
    }
    
    func initAuthListener() {
        //used to determine loggedin/loggedout
        if let auth = FIRAuth.auth() {
            //addStateDidChangeListener -> called twice on start and when logging out
            authStateListener = auth.addStateDidChangeListener { [weak self] (_, user) in
                if user != nil {
                    self?.dispatcher.logInSuccess()
                }
                print("User desc: \(user.debugDescription)")
                print("User name: \(user?.email)")
            }
        }
    }
}
