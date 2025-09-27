//
//  CollectionRepository.swift
//  MyCollection
//
//  Created by Diogo Izele on 26/09/25.
//

final class CollectionRepository {
    
    private let service: CollectionService
    private var cachedStats: CollectionStats?
    
    init(service: CollectionService) {
        self.service = service
    }
    
    func getStats(forceRefresh: Bool = false, completion: @escaping (Result<CollectionStats, Error>) -> Void) {
        
        if !forceRefresh, let cache = cachedStats {
            completion(.success(cache))
            return
        }
        
        service.fetchCollectionStats { [weak self] result in
            switch result {
            case .success(let stats):
                self?.cachedStats = stats
                completion(.success(stats))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
