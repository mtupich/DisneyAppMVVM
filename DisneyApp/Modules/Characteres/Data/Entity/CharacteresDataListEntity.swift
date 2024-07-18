// MARK: - CharactersDataListEntity
struct CharactersDataListEntity: Codable {
    let info: Info
    let data: [Response]
}

// MARK: - Response
struct Response: Codable {
    let id: Int
    let name: String
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageUrl
    }
}

// MARK: - Info
struct Info: Codable {
    let totalPages, count: Int
    let previousPage, nextPage: String?
}
