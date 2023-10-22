//
//  XibLoadableView.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

class XibView: UIView {

    // MARK: - Instance Properties

    var contentView: UIView?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupOnLoad()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupOnLoad()
    }

    // MARK: - Public Methods

    func setupOnLoad() {
        guard let contentView = loadFromNib() else {
            return
        }
        addSubview(contentView)
        contentView.fixInView(self)
        self.contentView = contentView
    }
}
