import Foundation

extension HTTPLinkHeader {
    public struct ParsingError: Error {}

    public static func parse(_ string: String) throws -> [HTTPLinkHeader] {
        try string.components(separatedBy: ",").map {
            let components = $0.components(separatedBy: ";")
            guard let uriReferenceComponent = components.first,
                  let openBracketIndex = uriReferenceComponent.firstIndex(of: "<"),
                  let closeBracketIndex = uriReferenceComponent.firstIndex(of: ">") else {
                throw ParsingError()
            }

            let startIndex = uriReferenceComponent.index(after: openBracketIndex)
            let uriReference = String(uriReferenceComponent[startIndex..<closeBracketIndex])
            var httpLinkHeader = HTTPLinkHeader(uriReference: uriReference)
            for parameterComponent in components.dropFirst() {
                let components = parameterComponent.trimmingCharacters(in: .whitespaces).components(separatedBy: "=")
                guard components.count == 2 else {
                    throw ParsingError()
                }

                let parameter = Parameter(name: components[0], value: components[1].trimmingCharacters(in: ["\""]))
                httpLinkHeader.parameters.append(parameter)
            }
            return httpLinkHeader
        }
    }
}
