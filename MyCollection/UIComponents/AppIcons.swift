//
//  AppIcons.swift
//  MyCollection
//
//  Created by Diogo Izele on 26/09/25.
//


struct AppIcons {
    let Book = "book-solid-full"
    let Movie = "film-solid-full"
    let Game = "gamepad-solid-full"
}

extension AppIcons {
    func iconByCategory(_ category: String) -> String {
        switch category {
        case "Book":
            return Book
        case "Movie":
            return Movie
        case "Game":
            return Game
        default:
            return Book
        }
    }
}
