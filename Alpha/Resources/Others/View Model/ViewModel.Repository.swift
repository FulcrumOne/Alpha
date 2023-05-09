//
//  ViewModel.Repository.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

class Repository {
    required init() {}
}

struct RepositoryResult<T> {
    private let result: T?
    private let error: Error?


    init(_ closure: () async throws -> T) async {
        do { self.result = try await closure(); self.error = nil }
        catch { self.result = nil; self.error = error }
    }
    func receive<R: Repository>(_ parent: ViewModel<R>, _ functionName: String = #function) throws -> T {
        DispatchQueue.main.async { parent.isLoading = false }

        if let error = error { throw error }
        else if let result = result { return result }
        else { fatalError("ERROR: An object has no value or error") }
    }
}
