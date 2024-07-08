import Foundation

// MARK: - CharactersDataListEntity
struct CharactersDataListEntity: Codable {
    let info: Info
    let data: [Response]
}

// MARK: - Response
struct Response: Codable {
    let id: Int
    let films, shortFilms, tvShows, videoGames: [String]
    let parkAttractions: [String]
    let sourceURL: String
    let name: String
    let imageURL: String
    let createdAt, updatedAt: String
    let url: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case films, shortFilms, tvShows, videoGames, parkAttractions
        case sourceURL = "sourceUrl"
        case name
        case imageURL = "imageUrl"
        case createdAt, updatedAt, url
        case v = "__v"
    }
}

// MARK: - Info
struct Info: Codable {
    let totalPages, count: Int
    let previousPage, nextPage: String
}
