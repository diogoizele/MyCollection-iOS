//
//  CollectionService.swift
//  MyCollection
//
//  Created by Diogo Izele on 26/09/25.
//

final class CollectionService {
    
    private let client: GraphQLClient
    
    init(client: GraphQLClient) {
        self.client = client
    }
    
    func fetchCollectionStats(completion: @escaping (Result<CollectionStats, Error>) -> Void) {
        let query = """
              query CollectionStats {
                  collectionStats {
                      totalItems
                      categoryPercentages {
                          category
                          quantity
                      }
                  }
              }
            """
        
        client.perform(query: query) { (result: Result<CollectionStatsResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.collectionStats))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
