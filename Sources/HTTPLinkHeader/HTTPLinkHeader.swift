public struct HTTPLinkHeader: Equatable {
    public struct Parameter: Equatable {
        public var name: String
        public var value: String

        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }
    }

    public var uriReference: String
    public var parameters: [Parameter]

    public init(uriReference: String, parameters: [Parameter] = []) {
        self.uriReference = uriReference
        self.parameters = parameters
    }
}
