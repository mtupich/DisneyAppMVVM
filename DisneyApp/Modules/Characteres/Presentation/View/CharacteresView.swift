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
        table.backgroundColor = .green
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
            topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            rightAnchor.constraint(equalTo: rightAnchor),
            leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    func setupAditionalConfiguration() {}
    
    
}
