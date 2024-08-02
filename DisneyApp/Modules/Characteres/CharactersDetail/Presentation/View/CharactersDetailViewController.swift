import UIKit

class CharacterDetailViewController: UIViewController {
    var viewModel: CharacterDetailViewModel
    var characterDetailScreen: CharactersDetailView?
    
    override func loadView() {
        characterDetailScreen = CharactersDetailView()
        view = characterDetailScreen
    }

    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        characterDetailScreen?.characterName.text = viewModel.character.name
        
        if let imageURL = URL(string: viewModel.character.imageURL) {
            characterDetailScreen?.characterImg.kf.setImage(with: imageURL)
        } else {
            characterDetailScreen?.characterImg.image = nil
        }
    }
}

