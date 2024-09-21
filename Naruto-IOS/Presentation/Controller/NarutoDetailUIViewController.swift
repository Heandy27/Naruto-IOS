//
//  NarutoDetailUIViewController.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 21/9/24.
//

import UIKit

final class NarutoDetailUIViewController: UIViewController {

    @IBOutlet weak var narutoDetailImageView: UIImageView!
    @IBOutlet weak var descriptionDetailLabel: UILabel!
    
    @IBOutlet weak var titleNarutoLabel: UILabel!
    
    private let clanes: Clan
    
    init(clanes: Clan) {
        self.clanes = clanes
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    configureView()
    }

    @IBAction func buttonDetailPressed(_ sender: UIButton) {
    }
    
}

private extension NarutoDetailUIViewController {
    func configureView() {
        titleNarutoLabel.text = clanes.rawValue
        descriptionDetailLabel.text = "Hola soy \(clanes.rawValue)"
        guard let imageUrl = clanes.imageURL else {
            return
        }
        
        narutoDetailImageView.setImageView(url: imageUrl)
    }
}
