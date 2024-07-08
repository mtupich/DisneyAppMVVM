import UIKit

class CharacterCellView: UITableViewCell {
    
    let identifier: String = "characterCellView"
    
    lazy var characterImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "branca")
        img.contentMode = .scaleToFill
        return img
    }()
    
    lazy var characterName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Branca de Neve"
        return lbl
    }()
    
    lazy var characterStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(characterStack)
        characterStack.addArrangedSubview(characterImg)
        characterStack.addArrangedSubview(characterName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterStack.topAnchor.constraint(equalTo: topAnchor),
            characterStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            characterStack.rightAnchor.constraint(equalTo: rightAnchor),
            characterStack.leftAnchor.constraint(equalTo: leftAnchor),
            
            characterImg.widthAnchor.constraint(equalToConstant: 80),
            characterImg.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func setupAditionalConfiguration() {}
    
    
}
                                
