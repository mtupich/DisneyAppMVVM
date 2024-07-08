import Foundation

class CharacteresListUseCaseImpl: CharacteresListUseCaseProtocol {

    private let characterRepository: CharacterRepository
    
    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }
    
    func execute(completion: @escaping (Result<[CharacteresDomainListEntity], Error>) -> Void) {
        characterRepository.fetchCharacters { result in
            switch result {
            case .success(let characterEntities):
                let characters = characterEntities.map { CharacteresDomainListEntity(name: $0.name, imageURL: $0.imageURL)}
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
}
