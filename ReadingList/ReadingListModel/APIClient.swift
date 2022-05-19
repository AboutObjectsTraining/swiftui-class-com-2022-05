// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

extension String: Error { }

struct APIClient {
    
    public static func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
    public static func fetchReadingList(from url: URL) async throws -> ReadingList {
        let data = try await fetchData(from: url)
        
        guard let readingList = try? JSONDecoder().decode(ReadingList.self, from: data) else {
            throw "Unable to decode reading list."
        }
        
        return readingList
    }
    
}

