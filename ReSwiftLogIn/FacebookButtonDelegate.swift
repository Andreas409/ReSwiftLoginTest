import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

extension SignInViewController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print("Facebook login button error: \(error.localizedDescription)")
            return
        } else {
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            dispatcher.login(withCredential: credential)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out of Facebook")
    }
}
