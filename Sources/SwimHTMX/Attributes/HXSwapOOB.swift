public enum HXSwapOOB: HXAttribute {
    
    case swap(_ swap: HXSwap)
    case swapAndSelector(_ swap: HXSwap, selector: String)
    
    var key: String { "hx-swap-oob" }
    
    var value: String {
        
        switch self {
        case .swap(let htSwap): return htSwap.value
        case .swapAndSelector(let htSwap, let selector): return "\(htSwap.value):\(selector)"
        }
    }
}
