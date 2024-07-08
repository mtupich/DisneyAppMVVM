class CharacteresViewModel {
    
    private let characteresListUseCaseImpl: CharacteresListUseCaseImpl
    var characteres: [CharacteresDomainListEntity] = []
    
    init(characteresListUseCaseImpl: CharacteresListUseCaseImpl) {
        self.characteresListUseCaseImpl = characteresListUseCaseImpl
    }
    
    func fetchCharactersList() {
        characteresListUseCaseImpl.execute { [weak self] result in
            switch result {
            case .success(let characteres):
                self?.characteres = characteres
            case .failure(let error):
                print("Erro ao buscar personagens:", error.localizedDescription)
            }
        }
    }
}
