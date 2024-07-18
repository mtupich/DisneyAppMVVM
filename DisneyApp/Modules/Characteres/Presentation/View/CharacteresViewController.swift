import UIKit

class CharacteresViewController: UIViewController {
    
    var characteresScreen: CharacteresView?
    var characteresViewmodel: CharacteresViewModel?
    
    override func loadView() {
        characteresScreen = CharacteresView()
        view = characteresScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let characterRepository = CharacterRepositoryImpl()
        let characteresListUseCase = CharacteresListUseCaseImpl(characterRepository: characterRepository)
        characteresViewmodel = CharacteresViewModel(characteresListUseCaseImpl: characteresListUseCase)
               
        characteresViewmodel?.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.characteresScreen?.table.reloadData()
            }
        }
        
        setupTableDelegates()
        characteresViewmodel?.setDataFromApi()
    }
    
    func setupTableDelegates() {
        characteresScreen?.table.delegate = self
        characteresScreen?.table.dataSource = self
    }

}

extension CharacteresViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characteresViewmodel?.characteres.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCellView().identifier, for: indexPath) as! CharacterCellView
          if let character = characteresViewmodel?.characteres[indexPath.row] {
              cell.configure(with: character)
          }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}


