//
//  ThreeHundredBucksViewController.swift
//  ThreeButtons
//
//  Created by Mikhail Andreev on 06.07.2023.
//

import UIKit

class ThreeHundredBucksViewController: UIViewController
{
	private lazy var imageView = UIImageView()

    override func viewDidLoad()
	{
        super.viewDidLoad()
		let image = UIImage(named: "billy")
		imageView.image = image
		imageView.contentMode = .scaleAspectFill
		view.addSubview(imageView)
    }

	override func viewWillLayoutSubviews()
	{
		super.viewWillLayoutSubviews()
		imageView.frame = view.frame
	}
}
