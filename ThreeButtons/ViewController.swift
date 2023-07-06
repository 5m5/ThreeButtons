//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Mikhail Andreev on 05.07.2023.
//

import UIKit

class ViewController: UIViewController
{
	private lazy var buttons = [
		createButton(text: "Big surprise"),
		createButton(text: "Another victim"),
		createButton(
			text: "Three Hundred Bucks",
			action: UIAction() { [weak self] _ in
				self?.present(ThreeHundredBucksViewController(), animated: true)
			}
		)
	]

	override func viewDidLoad()
	{
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		buttons.enumerated().forEach
		{
			view.addSubview($1)
			$1.translatesAutoresizingMaskIntoConstraints = false
			let safeArea = view.safeAreaLayoutGuide
			NSLayoutConstraint.activate(
				[
					$1.topAnchor.constraint(equalTo: $0 == 0 ? safeArea.topAnchor : buttons[$0-1].bottomAnchor, constant: 16),
					$1.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
				]
			)
		}
	}
}

private extension ViewController
{
	func createButton(text: String, action: UIAction? = nil) -> Button
	{
		let verticalInset: CGFloat = 10
		let horizontalInset: CGFloat = 14
		var config = UIButton.Configuration.filled()
		config.contentInsets = .init(
			top: verticalInset,
			leading: horizontalInset,
			bottom: verticalInset,
			trailing: horizontalInset
		)
		let font = UIFont(name: "Futura-Bold", size: 16) ?? UIFont()
		let attributes = AttributeContainer([.font: font])
		config.attributedTitle = .init(text, attributes: attributes)
		config.titleAlignment = .center
		config.image = .init(systemName: "arrow.right.circle.fill")
		config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
		config.imagePlacement = .trailing
		config.imagePadding = 8
		config.baseBackgroundColor = .systemMint
		let button = Button(configuration: config, primaryAction: action)
		button.addTarget(self, action: #selector(animateDown), for: [.touchDown])
		button.addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
		return button
	}

	@objc private func animateDown(sender: UIButton)
	{
		let transform = CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95)
		animate(sender, transform: transform)
	}

	@objc private func animateUp(sender: UIButton)
	{
		animate(sender, transform: .identity)
	}

	private func animate(_ button: UIButton, transform: CGAffineTransform)
	{
		UIView.animate(
			withDuration: 0.2,
			delay: 0,
			options: [.allowUserInteraction, .beginFromCurrentState]
		) {
			button.transform = transform
		}
	}
}
