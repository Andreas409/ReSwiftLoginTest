import ReSwift

struct UserSignedOutAction: Action {}
struct CreateUsernameAction: Action {
    let email: String
}
