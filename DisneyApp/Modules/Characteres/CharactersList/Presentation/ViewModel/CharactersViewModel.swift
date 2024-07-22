import Foundation

class CharactersViewModel {
    
    private let charactersListUseCaseImpl: CharactersListUseCaseImpl
    var characters: [CharactersDomainListEntity] = []
    var onDataUpdated: (() -> Void)?
    
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
                print("passei aqui \(self?.characters)")
                print("sucesso")
            case .failure(let error):
                print("Erro ao buscar personagens:", error.localizedDescription)
            }

        }
    }
}
