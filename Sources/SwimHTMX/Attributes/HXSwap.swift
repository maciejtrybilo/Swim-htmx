enum HXSwap: HXAttribute {
    
    enum Modifier {
        
        enum Direction {
            case top, bottom
        }
        
        case transition(bool: Bool)
        case swap(time: String)
        case settle(time: String)
        case ignoreTitle(bool: Bool)
        case scroll(selector: String?, direction: Direction)
        case show(selector: String?, direction: Direction)
        case showNone
        case focusScroll(bool: Bool)
        
        var string: String {
            switch self {
            case .transition(let bool): return "transition:\(bool)"
            case .swap(let time): return "swap:\(time)"
            case .settle(let time): return "settle:\(time)"
            case .ignoreTitle(let bool): return "ignoreTitle:\(bool)"
            case .scroll(let selector, let direction): return "scroll\(selector != nil ? ":\(selector!)" : "")\(direction)"
            case .show(let selector, let direction): return "show\(selector != nil ? ":\(selector!)" : "")\(direction)"
            case .showNone: return "show:none"
            case .focusScroll(let bool): return "focus-scroll:\(bool)"
            }
        }
    }
    
    case innerHTML(modifiers: [Modifier]?)
    case outerHTML(modifiers: [Modifier]?)
    case beforebegin(modifiers: [Modifier]?)
    case afterbegin(modifiers: [Modifier]?)
    case beforeend(modifiers: [Modifier]?)
    case afterend(modifiers: [Modifier]?)
    case delete(modifiers: [Modifier]?)
    case none
    
    var key: String { "hx-swap" }
    
    var value: String {
        
        let composeValue = { (initial: String, modifiers: [Modifier]?) -> String in
            
            var value = initial
                        
            for modifier in modifiers ?? [] {
                value += (" " + modifier.string)
            }
            
            return value
        }
        
        switch self {
        case .innerHTML(let modifiers): return composeValue("innerHTML", modifiers)
        case .outerHTML(let modifiers): return composeValue("outerHTML", modifiers)
        case .beforebegin(let modifiers): return composeValue("beforebegin", modifiers)
        case .afterbegin(let modifiers): return composeValue("afterbegin", modifiers)
        case .beforeend(let modifiers): return composeValue("beforeend", modifiers)
        case .afterend(let modifiers): return composeValue("afterend", modifiers)
        case .delete(let modifiers): return composeValue("delete", modifiers)
        case .none: return "none"
        }
    }
}
