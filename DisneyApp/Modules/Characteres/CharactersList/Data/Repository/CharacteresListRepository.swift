import Foundation

protocol CharacterRepository {
    typealias ResultCallback = (Result<CharactersDataListEntity, Error>) -> Void
    
    func fetchCharacters(completion: @escaping ResultCallback)
}

class CharacterRepositoryImpl: CharacterRepository {
    func fetchCharacters(completion: @escaping ResultCallback) {
        guard let url = URL(string: "https://api.disneyapi.dev/character") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "URL inválida"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Dados não encontrados"])))
                return
            }
            
            do {
                let decodedList = try JSONDecoder().decode(CharactersDataListEntity.self, from: data)
                completion(.success(decodedList))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
