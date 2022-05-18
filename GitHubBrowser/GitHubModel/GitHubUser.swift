// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

public struct GitHubUser: Decodable
{
    enum CodingKeys: String, CodingKey {
        case login
        case name
        case publicReposCount = "public_repos"
        case avatarUrl = "avatar_url"
    }
    
    public let login: String
    public let name: String
    public let publicReposCount: Int
    public let avatarUrl: String
}

extension HTTPURLResponse {
    var isValid: Bool { return statusCode == 200 }
}

extension URL {
    init?(gitHubUserName: String) {
        self.init(string: "https://api.github.com/users/\(gitHubUserName)")
    }
    
    init?(gitHubQuery query: String, pageSize: Int, pageNumber: Int) {
        self.init(string: "https://api.github.com/search/repositories?" +
                  "q=\(query)" +
                  "&sort=stars&per_page=\(pageSize)" +
                  "&page=\(pageNumber)")
    }
}
