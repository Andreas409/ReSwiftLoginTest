import ReSwift

struct SignInActionLogIn: Action {}
struct SignInActionCreateAccount: Action {}
struct SignInActionCreatedAccount: Action {}
struct SignInActionValidateEmail: Action {
    let email: String
}
struct SignInActionValidatePassword: Action {
    let password: String
}
