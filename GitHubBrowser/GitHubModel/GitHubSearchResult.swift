// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

struct GitHubSearchResult<T: Codable>: Codable {
    let items: [T]
}
