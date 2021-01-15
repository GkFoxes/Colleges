//
//  RoundShadowImageView.swift
//  PravdaUIKit
//
//  Created by Матвеенко Дмитрий Владимирович on 24.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class RoundShadowImageView: UIView {

	// MARK: Properties

	private let cornerRadius: CGFloat
	private let shadowColor: UIColor
	private let shadowRadius: CGFloat
	private let shadowOpacity: Float
	private let shadowOffset: CGSize
	private let imageOpacity: Float

	// MARK: Layers

	private var imageLayer = CALayer()
	private var shadowLayer: CAShapeLayer?

	private var shadowPath: CGPath {
		return UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
	}

	// MARK: Views

	var image: UIImage? = nil {
		didSet {
			imageLayer.contents = image?.cgImage
			shadowLayer?.shadowPath = (image == nil) ? nil : shadowPath
		}
	}

	// MARK: Life Cycle

	init(
		cornerRadius: CGFloat = 10,
		shadowColor: UIColor = .black,
		shadowRadius: CGFloat = 8,
		shadowOpacity: Float = 0.6,
		shadowOffset: CGSize = CGSize(width: 0, height: 8),
		imageOpacity: Float = 0.75
	) {
		self.cornerRadius = cornerRadius
		self.shadowColor = shadowColor
		self.shadowRadius = shadowRadius
		self.shadowOpacity = shadowOpacity
		self.shadowOffset = shadowOffset
		self.imageOpacity = imageOpacity
		super.init(frame: .zero)

		self.backgroundColor = .systemBackground
		self.clipsToBounds = false
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		configureLayer()
		configureImageLayer()
		configureShadowLayer()

		guard let shadowLayer = shadowLayer else { assertionFailure(); return }
		self.layer.addSublayer(shadowLayer)
		self.layer.addSublayer(imageLayer)
	}
}

// MARK: Configure Layers

private extension RoundShadowImageView {
	func configureLayer() {
		self.layer.shouldRasterize = true
		self.layer.rasterizationScale = UIScreen.main.scale
	}

	func configureImageLayer() {
		imageLayer.frame = bounds
		imageLayer.contentsGravity = .resizeAspectFill
		let shadowMask = CAShapeLayer()
		shadowMask.path = shadowPath
		imageLayer.mask = shadowMask
		imageLayer.opacity = imageOpacity
		imageLayer.backgroundColor = UIColor.systemBackground.cgColor
	}

	func configureShadowLayer() {
		guard shadowLayer == nil else {
			shadowLayer?.shadowPath = (image == nil) ? nil : shadowPath
			return
		}

		shadowLayer = CAShapeLayer()

		guard let shadowLayer = shadowLayer else { assertionFailure(); return }
		shadowLayer.shadowPath = (image == nil) ? nil : shadowPath
		shadowLayer.shadowColor = shadowColor.cgColor
		shadowLayer.shadowRadius = shadowRadius
		shadowLayer.shadowOpacity = shadowOpacity
		shadowLayer.shadowOffset = shadowOffset
	}
}
