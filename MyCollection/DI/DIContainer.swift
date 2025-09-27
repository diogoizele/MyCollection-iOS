//
//  DIContainer.swift
//  MyCollection
//
//  Created by Diogo Izele on 26/09/25.
//

import Foundation


final class DIContainer {
    static let shared = DIContainer()
    let client: GraphQLClient
    let homeRepository: CollectionRepository

    private init() {
        client = GraphQLClient(url: URL(string: "http://localhost:4000/graphql")!)
        
        let collectionService = CollectionService(client: client)
        homeRepository = CollectionRepository(service: collectionService)
    }

    func makeHomeViewController() -> HomeViewController {
        let viewModel = HomeViewModel(repository: homeRepository)
        return HomeViewController(viewModel: viewModel)
    }
}
