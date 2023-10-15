//  Created by Axel Ancona Esselmann on 6/25/23.
//

import Foundation

public extension URL {
    func exists(in fileManager: FileManager = FileManager.default) -> Bool {
        fileManager.fileExists(atPath: self.relativePath)
    }

    @discardableResult
    func create(_ create: Bool = true, in fileManager: FileManager = FileManager.default) throws -> Self {
        guard !fileManager.fileExists(atPath: self.relativePath) else {
            return self
        }
        try fileManager.createDirectory(
            at: self,
            withIntermediateDirectories: true,
            attributes: nil
        )
        return self
    }

    static func appLibraryDirectory(in fileManager: FileManager = FileManager.default) throws -> URL {
        try fileManager.url(
            for: .libraryDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appendingPathComponent(Bundle.main.appName)
    }

    static func appLibraryDirectoryExists(in fileManager: FileManager = FileManager.default) throws -> Bool {
        try URL.appLibraryDirectory().exists(in: fileManager)
    }

    static func createAppLibraryDirectory(in fileManager: FileManager = FileManager.default) throws {
        let appLibraryDirectory = try URL.appLibraryDirectory()
        if try !appLibraryDirectoryExists() {
            try fileManager.createDirectory(
                at: appLibraryDirectory,
                withIntermediateDirectories: true,
                attributes: nil
            )
        }
    }

    static var devNull: URL {
        URL(fileURLWithPath: "/dev/null")
    }

    static var bitbucket: URL {
        devNull
    }

    static var blackhole: URL {
        devNull
    }
}
