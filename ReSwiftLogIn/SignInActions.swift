import ReSwift

struct SignInActionLogIn: Action {}
struct SignInActionCreateAccount: Action {}
struct SignInActionValidateEmail: Action {
    let email: String
}
struct SignInActionValidatePassword: Action {
    let password: String
}
struct SignInActionCreatedAccount: Action {}
struct SignInActionLogInSuccess: Action {}
