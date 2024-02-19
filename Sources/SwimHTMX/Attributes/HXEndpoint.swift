public enum HXEndpoint: HXAttribute {
    case get(path: String)
    case post(path: String)
    case delete(path: String)
    case put(path: String)
    case patch(path: String)
    
    var key: String {
                
        switch self {
        case .get: return "hx-get"
        case .post: return "hx-post"
        case .delete: return "hx-delete"
        case .put: return "hx-put"
        case .patch: return "hx-patch"
        }
    }
    
    var value: String {
        
        switch self {
        case .get(let path): return path
        case .post(let path): return path
        case .delete(let path): return path
        case .put(let path): return path
        case .patch(let path): return path
        }
    }
}
