//
//  NewsItem.swift
//  Models
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public struct NewsItem {
	public let image: String // String for mock data, in real app use Data?
	public let source: String
	public let title: String
	public let timePublication: String
	public let text: String?
	public let link: String?

	private let identifier = UUID()

	// MARK: Life Cycle

	init(
		image: String,
		source: String,
		title: String,
		timePublication: String,
		text: String?,
		link: String?
	) {
		self.image = image
		self.source = source
		self.title = title
		self.timePublication = timePublication
		self.text = text
		self.link = link
	}
}

// MARK: Setup Hashable Protocol

extension NewsItem: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(identifier)
	}

	public static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.identifier == rhs.identifier
	}
}

// MARK: Mock Data

// swiftlint:disable all
public extension NewsItem {
	static func makeTopStoriesMock(isOnlyOneItem: Bool) -> [Self] {
		let topStories = [
			NewsItem(
				image: "oak",
				source: "Por Paige McClanahan",
				title: "Iceland tourism prepares for a return from other country to homes",
				timePublication: "31 October 12: 56",
				text:
				"""
				Since March, even with the support of the government, the staff of Olafsdottir has been reduced from 140 to only 16 employees. The hotel, which has more than 200 rooms, typically has an occupancy rate of more than 75 percent, but fell to 11 percent in September.

				” It has caused a lot of feelings, " Olafsdottir said, adding that, even after reducing its operations to a minimum, the hotel continues to accumulate debts. "But the thing is, I think we're all in the same situation.”
				Tourism is experiencing an unprecedented recession around the world, but several factors make Iceland particularly vulnerable to the collapse of the industry: geographical isolation, a small national population, strict border measures and an economy that —after an extraordinary tourism boom that has lasted a decade— has ended up relying heavily on foreign tourists. A recent wave of coronavirus cases has increased the challenges for Iceland.

				However, despite the low visitor numbers, Iceland is positioned for a significant recovery in tourism following the pandemic. The government will invest more than dólares 12 million in infrastructure for tourism, while improving roads and ports across the country. To keep the tourism industry afloat in the short term, the government will also invest more than dólares 9 million in a program that distributes free travel coupons among citizens and residents of Iceland. In late spring, an advertising campaign aimed at domestic tourists was launched; an international version will be unveiled as soon as the travel restrictions are over.
				""",
				link: "https://www.nytimes.com/es/2020/10/31/espanol/el-turismo-de-islandia-se-prepara-para-un-regreso.html"),
			NewsItem(
				image: "box",
				source: "The New York Times",
				title: "Fights in Front of Fans Test Boxing’s Business in the Pandemic Era",
				timePublication: "30 October 11:44",
				text: nil,
				link: nil),
		]

		if isOnlyOneItem {
			return topStories.dropLast()
		} else {
			return topStories
		}
	}

	static func makeOtherTopStoriesMock(isRemoveFirstItem: Bool) -> [Self] {
		var otherTopStories = [
			NewsItem(
				image: "box",
				source: "The New York Times",
				title: "Fights in Front of Fans Test Boxing’s Business in the Pandemic Era",
				timePublication: "30 October 11:44",
				text: nil,
				link: nil),
			NewsItem(
				image: "merlin",
				source: "CNN",
				title: "Some Older Voters Shift to Biden in Florida. Will It Be Enough for Him?",
				timePublication: "30 October 10:51",
				text: nil,
				link: "https://www.nytimes.com/2020/10/30/us/politics/florida-seniors-biden-trump.html"),
			NewsItem(
				image: "cars",
				source: "The New York Times",
				title: "The U.S. breaks the record for new cases in a day, tallying over 99,000",
				timePublication: "30 October 10:23",
				text: nil,
				link: "https://www.nytimes.com/live/2020/10/31/world/covid-19-coronavirus"),
			NewsItem(
				image: "connery",
				source: "BBC USA",
				title: "Sean Connery, James Bond",
				timePublication: "30 October 10:15",
				text: nil,
				link: "https://www.nytimes.com/2020/10/31/movies/sean-connery-dead.html"),
			NewsItem(
				image: "scream",
				source: "CNN Plus",
				title: "They Scream! We Scream!",
				timePublication: "30 October 10:10",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/movies/scream-horror.html"),
			NewsItem(
				image: "sam",
				source: "Music Station News",
				title: "Sam Smith Is Finding a Place Inside Queer Spaces",
				timePublication: "30 October 9:51",
				text: nil,
				link: "https://www.nytimes.com/2020/10/20/arts/music/sam-smith-favorites.html"),
			NewsItem(
				image: "trump",
				source: "CNN",
				title: "Trump will barnstorm Pennsylvania as both campaigns focus on the crucial state.",
				timePublication: "30 October 9:34",
				text: nil,
				link: "https://www.nytimes.com/live/2020/10/31/us/trump-biden-election"),
		]

		if isRemoveFirstItem == false {
			otherTopStories.removeFirst()
			return otherTopStories
		} else {
			return otherTopStories
		}
}

	static func makeScienceMock(isOnlyOneItem: Bool) -> [Self] {
		let scienceItems = [
			NewsItem(
				image: "master",
				source: "Sabrina Imbler",
				title: "They’re Calling You on the Squid Phone’",
				timePublication: "31 October 11:51",
				text: nil,
				link: "https://www.nytimes.com/2020/10/31/science/rams-head-squid-cephalopod.html"),
			NewsItem(
				image: "nasa",
				source: "The New York Times",
				title: "NASA’s Asteroid Mission Packs Away Its Cargo. Next Stop: Earth.",
				timePublication: "30 October 10:23",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/science/nasa-osirix-rex-mission.html"),
		]

		if isOnlyOneItem {
			return scienceItems.dropLast()
		} else {
			return scienceItems
		}
	}

	static func makeOtherScienceMock(isRemoveFirstItem: Bool) -> [Self] {
		var otherScienceItems = [
			NewsItem(
				image: "nasa",
				source: "The New York Times",
				title: "NASA’s Asteroid Mission Packs Away Its Cargo. Next Stop: Earth.",
				timePublication: "30 October 10:23",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/science/nasa-osirix-rex-mission.html"),
			NewsItem(
				image: "shark",
				source: "CNN",
				title: "Covid-19: England Sets Lockdown as Resurgent Virus Consumes Europe",
				timePublication: "30 October 10:23",
				text: nil,
				link: "https://www.nytimes.com/live/2020/10/31/world/covid-19-coronavirus"),
			NewsItem(
				image: "merlin",
				source: "CNN",
				title: "Some Older Voters Shift to Biden in Florida. Will It Be Enough for Him?",
				timePublication: "30 October 10:51",
				text: nil,
				link: "https://www.nytimes.com/2020/10/30/us/politics/florida-seniors-biden-trump.html"),
			NewsItem(
				image: "scream",
				source: "CNN Plus",
				title: "They Scream! We Scream!",
				timePublication: "30 October 10:10",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/movies/scream-horror.html"),
			NewsItem(
				image: "trump",
				source: "CNN",
				title: "Trump will barnstorm Pennsylvania as both campaigns focus on the crucial state.",
				timePublication: "30 October 9:34",
				text: nil,
				link: "https://www.nytimes.com/live/2020/10/31/us/trump-biden-election"),
			NewsItem(
				image: "sam",
				source: "Music Station News",
				title: "Sam Smith Is Finding a Place Inside Queer Spaces",
				timePublication: "30 October 9:51",
				text: nil,
				link: "https://www.nytimes.com/2020/10/20/arts/music/sam-smith-favorites.html"),
		]

		if isRemoveFirstItem == false {
			otherScienceItems.removeFirst()
			return otherScienceItems
		} else {
			return otherScienceItems
		}
	}

	static func makeTechnologyMock(isOnlyOneItem: Bool) -> [Self] {
		let technologyItems = [
			NewsItem(
				image: "rest",
				source: "The New York Times",
				title: "Big Tech Continues Its Surge Ahead of the Rest of the Economy",
				timePublication: "30 October 10:29",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/technology/apple-alphabet-facebook-amazon-google-earnings.html"),
			NewsItem(
				image: "grimes",
				source: "CNN",
				title: "The Future According to Grimes",
				timePublication: "30 October 10:11",
				text: nil,
				link: "https://www.nytimes.com/2020/10/28/style/self-care/grimes-AI-baby-sleep.html"),
		]

		if isOnlyOneItem {
			return technologyItems.dropLast()
		} else {
			return technologyItems
		}
	}

	static func makeOtherTechnologyMock(isRemoveFirstItem: Bool) -> [Self] {
		var makeOtherTechnologyMock = [
			NewsItem(
				image: "grimes",
				source: "CNN",
				title: "The Future According to Grimes",
				timePublication: "30 October 10:11",
				text: nil,
				link: "https://www.nytimes.com/2020/10/28/style/self-care/grimes-AI-baby-sleep.html"),
			NewsItem(
				image: "scream",
				source: "CNN Plus",
				title: "They Scream! We Scream!",
				timePublication: "30 October 10:10",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/movies/scream-horror.html"),
			NewsItem(
				image: "shark",
				source: "CNN",
				title: "Sharks Wash Up on Beaches, Stabbed by Swordfish",
				timePublication: "30 October 10:23",
				text: nil,
				link: "https://www.nytimes.com/live/2020/10/31/world/covid-19-coronavirus"),
			NewsItem(
				image: "merlin",
				source: "CNN",
				title: "Some Older Voters Shift to Biden in Florida. Will It Be Enough for Him?",
				timePublication: "30 October 10:51",
				text: nil,
				link: "https://www.nytimes.com/2020/10/30/us/politics/florida-seniors-biden-trump.html"),
			NewsItem(
				image: "nasa",
				source: "The New York Times",
				title: "NASA’s Asteroid Mission Packs Away Its Cargo. Next Stop: Earth.",
				timePublication: "30 October 10:23",
				text: nil,
				link: "https://www.nytimes.com/2020/10/29/science/nasa-osirix-rex-mission.html"),
		]

		if isRemoveFirstItem == false {
			makeOtherTechnologyMock.removeFirst()
			return makeOtherTechnologyMock
		} else {
			return makeOtherTechnologyMock
		}
	}
}
