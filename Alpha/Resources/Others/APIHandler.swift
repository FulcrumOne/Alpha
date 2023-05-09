//
//  APIHandler.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

class APIHandler {
    private let link: String
    private let method: Method
    private let data: Encodable


    init(_ object: RequestProtocol) { self.link = object.link; self.method = object.method; self.data = object.data }
}

extension APIHandler {
    @discardableResult func receiveResponse() async throws -> Data {
        let request = try createRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        return try handleResponse(data, response)
    }
}

private extension APIHandler {
    func createRequest() throws -> URLRequest {
        var request = URLRequest(url: try getURL())
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addBody(try JSONEncoder().encode(data), if: method == .POST)
        return request
    }
    func handleResponse(_ data: Data, _ response: URLResponse) throws -> Data {
        switch (response as? HTTPURLResponse)?.statusCode {
            case 200, 201, 202: return data
            case let statusCode: throw "Error \(statusCode ?? 404)"
        }
    }
}

private extension APIHandler {
    func getURL() throws -> URL {
        switch URL(string: "\(serverURL)\(link)") {
            case .some(let url): return url
            case nil: throw "The given URL has an invalid format"
        }
    }
    var serverURL: String { "https://ios.rp.devfactory.com/"  }
}

// MARK: - Methods
extension APIHandler {
    enum Method: String { case POST, GET, DELETE }
}

// MARK: - Helpers
fileprivate extension URLRequest {
    mutating func addBody(_ body: Data, if condition: Bool) { if condition { httpBody = body } }
}
