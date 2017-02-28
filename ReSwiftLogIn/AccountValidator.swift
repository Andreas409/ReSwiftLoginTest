class AccountValidator {
    
    func validateEmail(withEmail email: String) -> Bool {
        let atCheck = email.contains("@") ? true : false
        let dotCheck = email.contains(".") ? true : false
        return atCheck && dotCheck
    }
    
    func validatePassword(withPassword password: String) -> Bool {
        let lengthCheck = password.characters.count >= 4
        return lengthCheck
    }
}
