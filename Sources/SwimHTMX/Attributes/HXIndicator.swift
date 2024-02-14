public enum HXIndicator: HXAttribute {
    
    case id(_ id: String)
    case cssSelector(selector: String)
    case closestSelector(selector: String)
    
    var key: String { "hx-indicator" }
    
    var value: String {
        
        switch self {
        case .id(let id): return "#\(id)"
        case .cssSelector(let selector): return selector
        case .closestSelector(let selector): return "closest \(selector)"
        }
    }
}
