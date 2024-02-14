import Swim

extension Node {
    
    func htmxAction(endpoint: HXMethod,
                    target: HXTarget,
                    swap: HXSwap = .innerHTML(modifiers: nil),
                    indicator: HXIndicator? = nil,
                    vals: HXVals? = nil,
                    confirm: String? = nil,
                    disable: HXDisableELT? = nil) -> Node {
        
        switch self {
        case .element(let name, var attributes, let children):
            
            attributes[endpoint.key] = endpoint.value
            attributes[target.key] = target.value
            attributes[swap.key] = swap.value
            
            if let indicator {
               attributes[indicator.key] = indicator.value
            }
            
            if let vals {
                attributes[vals.key] = vals.value
            }
            
            if let confirm {
                attributes["hx-confirm"] = confirm
            }
            
            if let disable {
                attributes[disable.key] = disable.value
            }
            
            return .element(name, attributes, children)
            
        default:
            fatalError("You cannot add HTMX attributes to this type of Node.")
        }
    }
    
    func htmxDisable() -> Node {
        
        switch self {
        case .element(let name, var attributes, let children):
            
            attributes["hx-disable"] = ""
            
            return .element(name, attributes, children)
            
        default:
            fatalError("You cannot add HTMX attributes to this type of Node.")
        }
    }
    
    func htmxOutOfBand(id: String, _ oob: HXSwapOOB) -> Node {
        
        switch self {
        case .element(let name, var attributes, let children):
            
            attributes["id"] = id
            attributes[oob.key] = oob.value
            
            return .element(name, attributes, children)
            
        default:
            fatalError("You cannot add HTMX attributes to this type of Node.")
        }
    }
    
    func htmxIndicator(id: String) -> Node {
        
        switch self {
        case .element(let name, var attributes, let children):
            
            attributes["id"] = id
            
            if let classes = attributes["class"], !classes.isEmpty {
                attributes["class"] = "\(classes), htmx-indicator"
            } else {
                attributes["class"] = "htmx-indicator"
            }
            
            return .element(name, attributes, children)
            
        default:
            fatalError("You cannot add HTMX attributes to this type of Node.")
        }
    }
}
