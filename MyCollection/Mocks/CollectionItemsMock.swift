//
//  CollectionItemsMock.swift
//  MyCollection
//
//  Created by Diogo Izele on 17/07/25.
//


struct CollectionItemsMock {
    static let items: [CollectionItem] = [
        CollectionItem(
            id: "1",
            title: "The Fellowship of the Ring",
            category: .Book,
            description: "First volume of The Lord of the Rings by J.R.R. Tolkien.",
            imageUrl: "https://example.com/fellowship.jpg",
            ratings: [Rating(id: "r1", author: "TolkienFan42", text: "Epic start to an amazing journey.", stars: 5)]
        ),
        CollectionItem(
            id: "2",
            title: "The Two Towers",
            category: .Book,
            description: "Second volume of The Lord of the Rings.",
            imageUrl: "https://example.com/twotowers.jpg",
            ratings: [Rating(id: "r2", author: "MiddleEarthLover", text: "Great continuation.", stars: 4)]
        ),
        CollectionItem(
            id: "3",
            title: "The Return of the King",
            category: .Book,
            description: "Conclusion of The Lord of the Rings trilogy.",
            imageUrl: "https://example.com/returnking.jpg",
            ratings: [Rating(id: "r3", author: "AragornIsKing", text: "Masterful finale.", stars: 5)]
        ),
        CollectionItem(
            id: "4",
            title: "The Lord of the Rings: The Fellowship of the Ring",
            category: .Movie,
            description: "2001 film directed by Peter Jackson.",
            imageUrl: "https://example.com/lotr1.jpg",
            ratings: [Rating(id: "r4", author: "MovieBuff", text: "Faithful and beautiful.", stars: 5)]
        ),
        CollectionItem(
            id: "5",
            title: "Star Wars: A New Hope",
            category: .Movie,
            description: "Original 1977 space opera classic.",
            imageUrl: "https://example.com/starwars1.jpg",
            ratings: [Rating(id: "r5", author: "JediFan", text: "Timeless adventure.", stars: 5)]
        ),
        CollectionItem(
            id: "6",
            title: "The Witcher 3: Wild Hunt",
            category: .Game,
            description: "Award-winning open world RPG.",
            imageUrl: "https://example.com/witcher3.jpg",
            ratings: [Rating(id: "r6", author: "GeraltFan", text: "Best RPG ever.", stars: 5)]
        ),
        CollectionItem(
            id: "7",
            title: "Harry Potter and the Philosopher's Stone",
            category: .Book,
            description: "The beginning of the Harry Potter saga.",
            imageUrl: "https://example.com/hp1.jpg",
            ratings: [Rating(id: "r7", author: "Muggle123", text: "Magical intro.", stars: 4)]
        ),
        CollectionItem(
            id: "8",
            title: "Spider-Man: Into the Spider-Verse",
            category: .Movie,
            description: "Animated film with multiverse Spider-Men.",
            imageUrl: "https://example.com/spiderman.jpg",
            ratings: [Rating(id: "r8", author: "ComicFan", text: "Visually stunning.", stars: 5)]
        ),
        CollectionItem(
            id: "9",
            title: "Stranger Things",
            category: .Movie,
            description: "Sci-fi horror TV show set in the '80s.",
            imageUrl: "https://example.com/strangerthings.jpg",
            ratings: [Rating(id: "r9", author: "DemogorgonHunter", text: "Nostalgic and creepy.", stars: 4)]
        ),
        CollectionItem(
            id: "10",
            title: "The Legend of Zelda: Breath of the Wild",
            category: .Game,
            description: "Revolutionary open-world adventure game.",
            imageUrl: "https://example.com/zelda.jpg",
            ratings: [Rating(id: "r10", author: "HylianHero", text: "Freedom and wonder.", stars: 5)]
        ),
        CollectionItem(
            id: "11",
            title: "Dark Side of the Moon",
            category: .Record,
            description: "Classic progressive rock album by Pink Floyd.",
            imageUrl: "https://example.com/darkside.jpg",
            ratings: [Rating(id: "r11", author: "VinylVibe", text: "Mind-blowing sound.", stars: 5)]
        ),
        CollectionItem(
            id: "12",
            title: "Avengers: Endgame",
            category: .Movie,
            description: "Finale of the Infinity Saga in the MCU.",
            imageUrl: "https://example.com/endgame.jpg",
            ratings: [Rating(id: "r12", author: "MCUFan", text: "Epic scale and closure.", stars: 5)]
        ),
        CollectionItem(
            id: "13",
            title: "Elden Ring",
            category: .Game,
            description: "Souls-like open world fantasy action RPG.",
            imageUrl: "https://example.com/eldenring.jpg",
            ratings: [Rating(id: "r13", author: "TarnishedSoul", text: "Masterpiece in difficulty and design.", stars: 5)]
        ),
        CollectionItem(
            id: "14",
            title: "Dune (2021)",
            category: .Movie,
            description: "Sci-fi epic based on Frank Herbert's novel.",
            imageUrl: "https://example.com/dune2021.jpg",
            ratings: [Rating(id: "r14", author: "ArrakisReader", text: "Visually spectacular.", stars: 4)]
        ),
        CollectionItem(
            id: "15",
            title: "1984",
            category: .Book,
            description: "Dystopian novel by George Orwell.",
            imageUrl: "https://example.com/1984.jpg",
            ratings: [Rating(id: "r15", author: "BigBrother", text: "Still relevant.", stars: 5)]
        ),
        CollectionItem(
            id: "16",
            title: "Interstellar",
            category: .Movie,
            description: "Sci-fi film exploring time and space.",
            imageUrl: "https://example.com/interstellar.jpg",
            ratings: [Rating(id: "r16", author: "ScienceNerd", text: "Emotional and grand.", stars: 5)]
        ),
        CollectionItem(
            id: "17",
            title: "Chrono Trigger",
            category: .Game,
            description: "Classic time-travel JRPG.",
            imageUrl: "https://example.com/chrono.jpg",
            ratings: [Rating(id: "r17", author: "RetroGamer", text: "Peak 16-bit RPG.", stars: 5)]
        ),
        CollectionItem(
            id: "18",
            title: "Attack on Titan",
            category: .Book,
            description: "Manga series with intense action and plot twists.",
            imageUrl: "https://example.com/aot.jpg",
            ratings: [Rating(id: "r18", author: "Otaku", text: "Dark and thrilling.", stars: 4)]
        ),
        CollectionItem(
            id: "19",
            title: "Fullmetal Alchemist: Brotherhood",
            category: .Movie,
            description: "Anime adaptation with faithful storytelling.",
            imageUrl: "https://example.com/fma.jpg",
            ratings: [Rating(id: "r19", author: "Alchemist", text: "Top-tier anime.", stars: 5)]
        ),
        CollectionItem(
            id: "20",
            title: "The Beatles – Abbey Road",
            category: .Record,
            description: "Iconic album by The Beatles.",
            imageUrl: "https://example.com/abbeyroad.jpg",
            ratings: [Rating(id: "r20", author: "MusicLover", text: "Timeless classic.", stars: 5)]
        )
    ]
}
