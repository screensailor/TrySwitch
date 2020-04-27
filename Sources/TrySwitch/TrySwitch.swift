import Peek

public struct Try {
    
    private let cases: [() throws -> ()]
    
    private init(_ cases: [() throws -> ()]) {
        self.cases = cases
    }
}

extension Try {
    
    public static func `switch`(_ ƒ: @escaping () throws -> ()) -> Try {
        self.init([ƒ])
    }
    
    public func `case`(_ ƒ: @escaping () throws -> ()) -> Try {
        .init(cases + [ƒ])
    }
    
    public func `default`(
        function: StaticString = #function,
        file: StaticString = #file,
        line: Int = #line
    ) {
        var errors: [Error] = []
        for ƒ in cases {
            do { return try ƒ() }
            catch { errors.append(error) }
        }
        "\(errors)".peek("⚠️", function, file, line)
    }
    
    public func `default`(_ ƒ: ([Error]) -> ()) {
        var errors: [Error] = []
        for ƒ in cases {
            do { return try ƒ() }
            catch { errors.append(error) }
        }
        ƒ(errors)
    }
    
    public func defaultLast() throws {
        var error: Error?
        self.default{ error = $0.last }
        if let error = error {
            throw error
        }
    }
}