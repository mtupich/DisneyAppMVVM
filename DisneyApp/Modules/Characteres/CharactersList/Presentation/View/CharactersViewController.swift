import UIKit

class CharactersViewController: UIViewController {
    
    var charactersScreen: CharactersView?
    var charactersViewmodel: CharactersViewModel?
    var coordinator: CharactersCoordinator?
    
    override func loadView() {
        charactersScreen = CharactersView()
        view = charactersScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let characterRepository = CharacterRepositoryImpl()
        let charactersListUseCase = CharactersListUseCaseImpl(characterRepository: characterRepository)
        charactersViewmodel = CharactersViewModel(charactersListUseCaseImpl: charactersListUseCase)
        if let navigationController = self.navigationController {
            coordinator = CharactersCoordinator(navigationController: navigationController)
        }
        
        charactersViewmodel?.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.charactersScreen?.table.reloadData()
            }
        }
        
        setupTableDelegates()
        charactersViewmodel?.setDataFromApi()
    }
    
    func setupTableDelegates() {
        charactersScreen?.table.delegate = self
        charactersScreen?.table.dataSource = self
    }
    
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersViewmodel?.characters.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCellView().identifier, for: indexPath) as! CharacterCellView
        if let character = charactersViewmodel?.characters[indexPath.row] {
            cell.configure(with: character)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let character = charactersViewmodel?.characters[indexPath.row] else { return }
        charactersViewmodel?.selectCharacter(at: indexPath.row)
        if let selectedCharacter = charactersViewmodel?.selectedCharacter {
            coordinator?.showCharacterDetail(character: selectedCharacter)
        }
    }
    
}


