// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

public final class DataStore {
    private let apiClient = APIClient()
    
    public static let defaultFileName = "ReadingList"
    public static let fileExtension = "json"
    
    public let fileName: String
    public let bundle: Bundle
    
    private let decoder = JSONDecoder()
    private let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    public init(fileName: String = defaultFileName,
                bundle: Bundle = Bundle(for: DataStore.self)) {
        self.fileName = fileName
        self.bundle = bundle
        
        // TODO: Copy file from bundle to documents directory
    }
}

// MARK: - Persistence operations
extension DataStore {
    public func fetch() throws -> ReadingList {
        // FIXME: Use a data task to retrieve
        let data = try Data(contentsOf: templateFileURL)
        return try decoder.decode(ReadingList.self, from: data)
    }
    
    public func fetchWithCombine(_ handler: @escaping (ReadingList) -> Void) throws {
        apiClient.fetchReadingList(from: templateFileURL) { readingList in
            handler(readingList)
        }
    }
}

// MARK: - File URLs
extension DataStore {
    var templateFileURL: URL {
        bundle.url(forResource: fileName, withExtension: Self.fileExtension)!
    }
}
