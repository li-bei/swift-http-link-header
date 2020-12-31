import HTTPLinkHeader
import XCTest

final class HTTPLinkHeaderTests: XCTestCase {
    func testParse() throws {
        XCTAssertEqual(try HTTPLinkHeader.parse(#"""
            <https://one.example.com>, \#
            <https://two.example.com>; rel=preconnect, \#
            <https://three.example.com>; rel="preconnect", \#
            <https://four.example.com>; param1=value1; param2="value2"
            """#), [
                HTTPLinkHeader(uriReference: #"https://one.example.com"#),
                HTTPLinkHeader(uriReference: #"https://two.example.com"#, parameters: [
                    HTTPLinkHeader.Parameter(name: "rel", value: "preconnect"),
                ]),
                HTTPLinkHeader(uriReference: #"https://three.example.com"#, parameters: [
                    HTTPLinkHeader.Parameter(name: "rel", value: "preconnect"),
                ]),
                HTTPLinkHeader(uriReference: #"https://four.example.com"#, parameters: [
                    HTTPLinkHeader.Parameter(name: "param1", value: "value1"),
                    HTTPLinkHeader.Parameter(name: "param2", value: "value2"),
                ]),
            ])
    }
}
