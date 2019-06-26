import Vapor


public func routes(_ router: Router) throws {
    
    var noAPI: String = "API Key not found"
    var invalidParam: String = "The request is invalid"
    
    router.get("api", API.parameter) { req -> String in
        
        //http://localhost:8080/api/Fibonnaci?n=45&api_key=akejrbgakjergbakjerbg
        
        let request = try req.parameters.next(API.self)
        let api_key = try req.query.get(String.self, at: "api_key")
        
        print(request.request) // Fibonnaci
        
        switch request.request.description {
        case let fib where fib.contains("Fibonnaci"):
            if testForEmpty(arg: api_key) {
                let number = try req.query.get(String.self, at: "n")
                return testForEmpty(arg: number) ? Process.processFib(arg: number) : invalidParam
            } else {
                return noAPI
            }
        case let rev where rev.contains("ReverseWords"):
            if testForEmpty(arg: api_key) {
                let sentence = try req.query.get(String.self, at: "sentence")
                return testForEmpty(arg: sentence) ? Process.processRev(arg: sentence) : invalidParam
            } else {
                return noAPI
            }
        case let tok where tok.contains("Token"):
            if testForEmpty(arg: api_key) {
                return Process.processTok(arg: api_key)
            } else {
                return noAPI
            }
        case let tri where tri.contains("TriangleType"):
            if testForEmpty(arg: api_key) {
                let a = try req.query.get(String.self, at: "a")
                let b = try req.query.get(String.self, at: "b")
                let c = try req.query.get(String.self, at: "c")
                return Process.processTri(arg  : [a,b,c])
            } else {
                return noAPI
            }
        default: return "{'message':'No HTTP resource was found that matches the request URI '\(request.request)'}"
        }
    }
    
    func testForEmpty(arg: String) -> Bool {
        print(arg)
        return arg.isEmpty ? false : true
    }
}

struct API : Parameter {
    var request : String
    
    static func resolveParameter(_ parameter: String, on container: Container) throws -> API {
        return API(request: parameter)
    }
}
