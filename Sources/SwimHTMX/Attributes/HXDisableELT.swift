public enum HXDisableELT: HXAttribute {
    
    case this
    case closestSelector(_ selector: String)
    case selector(_ selector: String)
    
    var key: String { "hx-disabled-elt" }
    
    var value: String {
        switch self {
        case .this: return "this"
        case .closestSelector(let selector): return "closest \(selector)"
        case .selector(let selector): return selector
        }
    }
}
