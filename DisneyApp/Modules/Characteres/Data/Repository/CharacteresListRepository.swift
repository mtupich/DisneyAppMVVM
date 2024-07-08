import Foundation

protocol CharacterRepository {
    typealias ResultCallback = (Result<[CharacteresDomainListEntity], Error>) -> Void
    
    func fetchCharacters(completion: @escaping ResultCallback)
}
