import UIKit

class CharactersDetailView: UIView {
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var characterImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "branca")
        img.layer.cornerRadius = 18
        img.layer.shadowColor = UIColor.black.cgColor
        img.layer.shadowOpacity = 0.50
        img.layer.shadowOffset = CGSize(width: 0, height: 2)
        img.layer.shadowRadius = 4
        img.clipsToBounds = true
        return img
    }()
    
    lazy var characterName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Branca de Neve"
        lbl.font = .systemFont(ofSize: 46)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersDetailView: CodeView {
    func buildViewHierarchy() {
        addSubview(container)
        container.addSubview(characterImg)
        container.addSubview(characterName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leftAnchor.constraint(equalTo: leftAnchor),
            container.rightAnchor.constraint(equalTo: rightAnchor),
            
            characterImg.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
            characterImg.bottomAnchor.constraint(equalTo: characterName.topAnchor),
            characterImg.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            characterImg.leftAnchor.constraint(equalTo: container.leftAnchor),
            characterImg.rightAnchor.constraint(equalTo: container.rightAnchor),
            
            characterName.topAnchor.constraint(equalTo: characterImg.bottomAnchor, constant: 10),
            characterImg.heightAnchor.constraint(equalToConstant: 14),
            characterName.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setupAditionalConfiguration() {}
    
    
}
