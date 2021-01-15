//
//  TodaySections.swift
//  Models
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import UIKit

public enum TodaySections: CaseIterable {
	case topStories
	case otherTopStories
	case science
	case otherScience
	case technology
	case otherTechnology
}

// MARK: Setup Strings

public extension TodaySections {
	var string: String {
		switch self {
		case .topStories, .otherTopStories: return "Top Stories"
		case .science, .otherScience: return "Science"
		case .technology, .otherTechnology: return "Technology"
		}
	}
}

// MARK: Setup UIColor

public extension TodaySections {
	var color: UIColor {
		switch self {
		case .topStories, .otherTopStories: return .systemPink
		case .science, .otherScience: return .systemIndigo
		case .technology, .otherTechnology: return .systemGreen
		}
	}
}
