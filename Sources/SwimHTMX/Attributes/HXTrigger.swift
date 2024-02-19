public enum HXTrigger: HXAttribute {

    case raw(value: String)
    
    var key: String { "hx-trigger" }
    
    var value: String {
        switch self {
        case .raw(let value):
            return value
        }
    }
}
