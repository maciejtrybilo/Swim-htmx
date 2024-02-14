public enum HXTarget: HXAttribute {
    
    case id(_ id: String)
    case cssSelector(selector: String)
    case this
    case closestSelector(selector: String)
    case findSelector(selector: String)
    case next
    case nextSelector(selector: String)
    case previous
    case previousSelector(selector: String)
    
    var key: String { "hx-target" }
    
    var value: String {
        switch self {
        case .id(let id): return "#\(id)" // special convenience case
        case .cssSelector(let selector): return selector
        case .this: return "this"
        case .closestSelector(let selector): return selector
        case .findSelector(let selector): return selector
        case .next: return "next"
        case .nextSelector(let selector): return selector
        case .previous: return "previous"
        case .previousSelector(let selector): return selector
        }
    }
}
