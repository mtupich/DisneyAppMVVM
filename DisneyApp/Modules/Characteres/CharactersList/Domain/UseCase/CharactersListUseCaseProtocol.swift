protocol CharactersListUseCaseProtocol {
    func execute(completion: @escaping (Result<CharactersDataListEntity, Error>) -> Void)
}
