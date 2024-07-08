import UIKit

class CharacteresViewController: UIViewController {
    
    var characteresScreen: CharacteresView?
    
    override func loadView() {
        characteresScreen = CharacteresView()
        view = characteresScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableDelegates()
    }
    
    func setupTableDelegates() {
        characteresScreen?.table.delegate = self
        characteresScreen?.table.dataSource = self
    }

}

extension CharacteresViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterCellView = (characteresScreen?.table.dequeueReusableCell(withIdentifier: CharacterCellView().identifier, for: indexPath) as? CharacterCellView)!
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}


