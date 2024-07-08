import Foundation

class CharacteresListService {
    func fetchCharacters(completion: @escaping (Result<[CharactersDataListEntity], Error>) -> Void) {
        // Exemplo simplificado de chamada a uma API usando URLSession
        guard let url = URL(string: "https://api.example.com/characters") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let characters = try JSONDecoder().decode([CharactersDataListEntity].self, from: data)
                completion(.success(characters))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

