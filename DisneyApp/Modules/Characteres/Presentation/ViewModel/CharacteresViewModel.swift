import Foundation

class CharacteresViewModel {
    
    private let characteresListUseCaseImpl: CharacteresListUseCaseImpl
    var characteres: [CharacteresDomainListEntity] = []
    var onDataUpdated: (() -> Void)?
    
    init(characteresListUseCaseImpl: CharacteresListUseCaseImpl) {
        self.characteresListUseCaseImpl = characteresListUseCaseImpl
    } 
    
    func setDataFromApi() {
        characteresListUseCaseImpl.execute { [weak self] result in
            switch result {
            case .success(let data):
                for item in data.data {
                    self?.characteres.append(CharacteresDomainListEntity(name: item.name, imageURL: item.imageUrl ?? "teste"))
                }
                self?.onDataUpdated?()
                print("passei aqui \(self?.characteres)")
                print("sucesso")
            case .failure(let error):
                print("Erro ao buscar personagens:", error.localizedDescription)
            }

        }
    }
}
