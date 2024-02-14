import Foundation

// TODO: escape these to avoid XSS
enum HXVals: HXAttribute {
    
    case jsonString(_ string: String)
    case encodable(_ encodable: Encodable)
    case js(_ script: String)
    
    var key: String { "hx-vals" }
    
    var value: String {
        
        switch self {
        case .jsonString(let string): return "'\(string)'"
        case .encodable(let encodable): return "'\(try! JSONEncoder().encode(encodable))'"
        case .js(let script): return "'js:{\(script)}'"
        }
    }
}
