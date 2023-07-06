//
//  Button.swift
//  ThreeButtons
//
//  Created by Mikhail Andreev on 06.07.2023.
//

import UIKit

class Button: UIButton
{
	override func tintColorDidChange()
	{
		super.tintColorDidChange()
		configuration?.baseBackgroundColor = tintAdjustmentMode == .dimmed ? .systemGray2 : .systemMint
		configuration?.baseForegroundColor = tintAdjustmentMode == .dimmed ? .systemGray3 : .white
	}
}
