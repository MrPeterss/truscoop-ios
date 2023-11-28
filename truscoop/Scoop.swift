//
//  Article.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import Foundation

struct Scoop: Hashable {
    let id: String
    let url: String
    let name: String
    let favicon: String
    let top_img: String
    let date: Date
    let summary: String
    let ai_rating: String
    let user_rating: Float
}

let articles: [Scoop] = [
    Scoop(
        id: "1",
        url: "https://apple.com/",
        name: "The Future of Artificial Intelligence",
        favicon: "placeholder_favicon",
        top_img: "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
        date: Date(),
        summary: "Exploring the potential advancements and challenges in the field of AI.",
        ai_rating: "Central",
        user_rating: 4.5
    ),
    Scoop(
        id: "2",
        url: "https://example.com/article2",
        name: "Healthy Habits for a Productive Day",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image2.jpg",
        date: Date(),
        summary: "Discover the habits that successful people follow for a productive lifestyle.",
        ai_rating: "Right",
        user_rating: 4.0
    ),
    Scoop(
        id: "3",
        url: "https://example.com/article3",
        name: "Space Exploration: Journey to the Stars",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image3.jpg",
        date: Date(),
        summary: "An in-depth look at the latest developments in space exploration.",
        ai_rating: "Left",
        user_rating: 4.8
    ),
    Scoop(
        id: "4",
        url: "https://example.com/article4",
        name: "Delicious and Healthy Recipes for Every Diet",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image4.jpg",
        date: Date(),
        summary: "Explore a collection of mouth-watering recipes suitable for various diets.",
        ai_rating: "Central",
        user_rating: 4.2
    ),
    Scoop(
        id: "5",
        url: "https://example.com/article5",
        name: "Mindfulness Meditation: A Guide to Inner Peace",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image5.jpg",
        date: Date(),
        summary: "Learn the art of mindfulness meditation and its positive impact on mental well-being.",
        ai_rating: "Right",
        user_rating: 4.6
    ),
    Scoop(
        id: "6",
        url: "https://example.com/article6",
        name: "Tech Gadgets That Will Change Your Life",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image6.jpg",
        date: Date(),
        summary: "Explore the latest and most innovative tech gadgets that are set to revolutionize daily life.",
        ai_rating: "Left",
        user_rating: 4.7
    ),
    Scoop(
        id: "7",
        url: "https://example.com/article7",
        name: "The Impact of Climate Change on Global Ecosystems",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image7.jpg",
        date: Date(),
        summary: "Examining the consequences of climate change on biodiversity and ecosystems worldwide.",
        ai_rating: "Central",
        user_rating: 4.9
    ),
    Scoop(
        id: "8",
        url: "https://example.com/article8",
        name: "Traveling on a Budget: Tips and Tricks",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image8.jpg",
        date: Date(),
        summary: "Discover cost-effective ways to travel and make the most of your adventures on a budget.",
        ai_rating: "Right",
        user_rating: 4.1
    ),
    Scoop(
        id: "9",
        url: "https://example.com/article9",
        name: "The Art of Photography: Capturing Moments in Time",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image9.jpg",
        date: Date(),
        summary: "A journey into the world of photography, exploring techniques and visual storytelling.",
        ai_rating: "Left",
        user_rating: 4.4
    ),
    Scoop(
        id: "10",
        url: "https://example.com/article10",
        name: "Fitness for Every Body: Embracing a Healthier Lifestyle",
        favicon: "placeholder_favicon",
        top_img: "https://example.com/image10.jpg",
        date: Date(),
        summary: "Tips and workouts for individuals of all fitness levels to achieve a healthier lifestyle.",
        ai_rating: "Central",
        user_rating: 4.3
    )
]
