protocol CharacteresListUseCaseProtocol {
    func execute(completion: @escaping (Result<CharactersDataListEntity, Error>) -> Void)
}
