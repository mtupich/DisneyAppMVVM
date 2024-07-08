protocol CharacteresListUseCaseProtocol {
    func execute(completion: @escaping (Result<[CharacteresDomainListEntity], Error>) -> Void)
}
