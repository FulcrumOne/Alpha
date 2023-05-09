//
//  ViewModel.swift of Alpha
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

class ViewModel<R: Repository>: ObservableObject {
    @Published var isLoading: Bool = false

    fileprivate var repository: R = .init()
    required internal init() {}
}

extension ViewModel {
    /// VERY IMPORTANT NOTE: Use it only within a ViewModel class!!!
    func launch(withLoading: Bool = true) -> R {
        DispatchQueue.main.async { self.isLoading = withLoading }
        return repository
    }
    static var shared: Self { ViewModelProvider.makeViewModel() }
    func remove() { ViewModelProvider.removeViewModel(self) }
}


// MARK: Helper Methods
fileprivate class ViewModelProvider {
    private static var viewModelStore: [String: Any] = [:]

    static func makeViewModel<V: ViewModel<R>, R: Repository>() -> V {
        if let vm = viewModelStore[.init(describing: V.self)] as? V { return vm }

        let viewModel = V()
        viewModelStore[.init(describing: V.self)] = viewModel
        return viewModel
    }
    static func removeViewModel<V: ViewModel<R>, R: Repository>(_ viewModel: V) {
        viewModelStore.removeValue(forKey: .init(describing: type(of: viewModel)))
    }
}
