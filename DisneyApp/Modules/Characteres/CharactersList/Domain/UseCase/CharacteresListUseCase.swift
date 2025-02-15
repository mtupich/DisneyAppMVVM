import Foundation

class CharactersListUseCaseImpl: CharactersListUseCaseProtocol {

    private let characterRepository: CharacterRepository
    
    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }
    
    func execute(completion: @escaping (Result<CharactersDataListEntity, Error>) -> Void) {
        characterRepository.fetchCharacters { result in
            completion(result)
        }
    }
    
}
