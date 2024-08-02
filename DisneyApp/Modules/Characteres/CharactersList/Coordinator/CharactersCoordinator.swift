import Foundation
import UIKit

class CharactersCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showCharacterDetail(character: CharactersDomainListEntity) {
        let viewModel = CharacterDetailViewModel(character: character)
        let detailViewController = CharacterDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

