//
//  FilteredCategory.swift
//  MyCollection
//
//  Created by Diogo Izele on 22/09/25.
//

enum FilteredCategory {
    case all
    case category(CategoryEnum)
    
    var localizedName: String {
        switch self {
        case .all: return "Todos"
        case .category(let c): return c.localizedName
        }
    }
}
