import UIKit

protocol CodeView {
  func buildViewHierarchy()
  func setupConstraints()
  func setupAditionalConfiguration()
  func setupView()
}

extension CodeView {
  func setupView() {
    buildViewHierarchy()
    setupConstraints()
    setupAditionalConfiguration()
  }
}


class CharacteresView: UIView {
        
    lazy var table: UITableView = {
       let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CharacterCellView.self, forCellReuseIdentifier: "characterCellView")
       return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacteresView: CodeView {
    func buildViewHierarchy() {
        addSubview(table)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: topAnchor),
            table.bottomAnchor.constraint(equalTo: bottomAnchor),
            table.rightAnchor.constraint(equalTo: rightAnchor),
            table.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    func setupAditionalConfiguration() {}
    
    
}
