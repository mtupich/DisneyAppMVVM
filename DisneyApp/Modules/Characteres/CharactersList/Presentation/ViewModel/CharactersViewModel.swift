import Foundation

class CharactersViewModel {
    
    private let charactersListUseCaseImpl: CharactersListUseCaseImpl
    var characters: [CharactersDomainListEntity] = []
    var onDataUpdated: (() -> Void)?
    var selectedCharacter: CharactersDomainListEntity?
    
    init(charactersListUseCaseImpl: CharactersListUseCaseImpl) {
        self.charactersListUseCaseImpl = charactersListUseCaseImpl
    }
    
    func setDataFromApi() {
        charactersListUseCaseImpl.execute { [weak self] result in
            switch result {
            case .success(let data):
                for item in data.data {
                    self?.characters.append(CharactersDomainListEntity(name: item.name, imageURL: item.imageUrl ?? "teste"))
                }
                self?.onDataUpdated?()
            case .failure(let error):
                print("Erro ao buscar personagens:", error.localizedDescription)
            }

        }
    }
    
    func selectCharacter(at index: Int) {
        selectedCharacter = characters[index]
    }
}
