// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

//
//struct GitHubSearchResult<T: Codable>: Codable {
//    let items: [T]
//}

public struct GitRepository: Codable, Identifiable, Equatable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case htmlUrl = "html_url"
        case starsCount = "stargazers_count"
        case forksCount = "forks"
    }
    
    public let id: Int
    public let name: String
    public let description: String?
    public let htmlUrl: URL
    public let starsCount: Int
    public let forksCount: Int
    
    public init(id: Int, name: String, description: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.htmlUrl = URL(string: "https://www.github.com")!
        self.starsCount = 0
        self.forksCount = 0
    }
}
