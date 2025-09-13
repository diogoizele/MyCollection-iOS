//
//  CategoryEnum.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//

enum CategoryEnum: Codable {
    case Book
    case Movie
    case Record
    case Game
}

extension CategoryEnum {
    var localizedName: String {
        switch self {
        case .Book: return "Livro"
        case .Movie: return "Filme"
        case .Record: return "Disco"
        case .Game: return "Jogo"
        }
    }
}
