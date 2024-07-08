import Foundation

protocol CharacteresListRepositoryProtocol {
    func fetchCharacters(completion: @escaping (Result<[CharacteresDomainListEntity], NetworkError>) -> Void)
}

