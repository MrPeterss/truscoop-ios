//
//  Article.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import Foundation

struct ScoopResponse: Codable {
    let response: [Scoop]
}

struct Scoop: Hashable & Codable {
    let id: String
    let url: String
    let name: String
    let favicon: String
    let topImg: String
    let date: Date
    let summary: String
    let aiRating: String
    let userRating: Float
}

// From here https://stackoverflow.com/questions/46344963/swift-jsondecode-decoding-arrays-fails-if-single-element-decoding-fails
struct FailableDecodable<Base : Decodable> : Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}

let articles: [Scoop] = [
    Scoop(
        id: "1",
        url: "https://apple.com/",
        name: "The Future of Artificial Intelligence",
        favicon: "null",
        topImg: "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
        date: Date(),
        summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco labo. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco labo. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco labo. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco labo.",
        aiRating: "neutral",
        userRating: 4.5
    ),
    Scoop(
        id: "2",
        url: "https://example.com/article2",
        name: "Healthy Habits for a Productive Day",
        favicon: "placeholder_favicon",
        topImg: "null",
        date: Date(),
        summary: "Discover the habits that successful people follow for a productive lifestyle.",
        aiRating: "conservative",
        userRating: 4.0
    ),
    Scoop(
        id: "3",
        url: "https://example.com/article3",
        name: "Space Exploration: Journey to the Stars",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "An in-depth look at the latest developments in space exploration.",
        aiRating: "liberal",
        userRating: 4.8
    ),
    Scoop(
        id: "4",
        url: "https://example.com/article4",
        name: "Delicious and Healthy Recipes for Every Diet",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "Explore a collection of mouth-watering recipes suitable for various diets.",
        aiRating: "neutral",
        userRating: 4.2
    ),
    Scoop(
        id: "5",
        url: "https://example.com/article5",
        name: "Mindfulness Meditation: A Guide to Inner Peace",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "Learn the art of mindfulness meditation and its positive impact on mental well-being.",
        aiRating: "conservative",
        userRating: 4.6
    ),
    Scoop(
        id: "6",
        url: "https://example.com/article6",
        name: "Tech Gadgets That Will Change Your Life",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "Explore the latest and most innovative tech gadgets that are set to revolutionize daily life.",
        aiRating: "liberal",
        userRating: 4.7
    ),
    Scoop(
        id: "7",
        url: "https://example.com/article7",
        name: "The Impact of Climate Change on Global Ecosystems",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "Examining the consequences of climate change on biodiversity and ecosystems worldwide.",
        aiRating: "neutral",
        userRating: 4.9
    ),
    Scoop(
        id: "8",
        url: "https://example.com/article8",
        name: "Traveling on a Budget: Tips and Tricks",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "Discover cost-effective ways to travel and make the most of your adventures on a budget.",
        aiRating: "conservative",
        userRating: 4.1
    ),
    Scoop(
        id: "9",
        url: "https://example.com/article9",
        name: "The Art of Photography: Capturing Moments in Time",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "A journey into the world of photography, exploring techniques and visual storytelling.",
        aiRating: "liberal",
        userRating: 4.4
    ),
    Scoop(
        id: "10",
        url: "https://example.com/article10",
        name: "Fitness for Every Body: Embracing a Healthier Lifestyle",
        favicon: "null",
        topImg: "null",
        date: Date(),
        summary: "Tips and workouts for individuals of all fitness levels to achieve a healthier lifestyle.",
        aiRating: "neutral",
        userRating: 4.3
    )
]
