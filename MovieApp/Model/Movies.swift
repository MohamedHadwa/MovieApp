//
//  Movies.swift
//  MovieApp
//
//  Created by Mohamed Hadwa on 06/03/2023.
//

import Foundation

import Foundation
class Movies: Codable {
    var status: Stat?
    var statusMessage: String?
    var data: DataClass?
    var meta: Meta?

    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage
        case data
        case meta
    }

    init(status: Stat?, statusMessage: String?, data: DataClass?, meta: Meta?) {
        self.status = status
        self.statusMessage = statusMessage
        self.data = data
        self.meta = meta
    }
}

// MARK: - DataClass
class DataClass: Codable {
    var movieCount, limit, pageNumber: Int?
    var movies: [Movie]?

    enum CodingKeys: String, CodingKey {
        case movieCount
        case limit
        case pageNumber
        case movies
    }

//    init(movieCount: Int?, limit: Int?, pageNumber: Int?, movies: [Movie]?) {
//        self.movieCount = movieCount
//        self.limit = limit
//        self.pageNumber = pageNumber
//        self.movies = movies
//    }
}

// MARK: - Movie
class Movie: Codable {
    var id: Int?
    var url: String?
    var imdbCode, title, titleEnglish, titleLong: String?
    var slug: String?
    var year: Int?
    var rating: Double?
    var runtime: Int?
    var genres: [String]?
    var summary, descriptionFull, synopsis, ytTrailerCode: String?
    var language: String?
    var mpaRating: String?
    var backgroundImage, backgroundImageOriginal, smallCoverImage, mediumCoverImage: String?
    var largeCoverImage: String?
    var state: Stat?
    var torrents: [Torrent]?
    var dateUploaded: String?
    var dateUploadedUnix: Int?

    enum CodingKeys: String, CodingKey {
            case id, url
            case imdbCode = "imdb_code"
            case title
            case titleEnglish = "title_english"
            case titleLong = "title_long"
            case slug, year, rating, runtime, genres, summary
            case descriptionFull = "description_full"
            case synopsis
            case ytTrailerCode = "yt_trailer_code"
            case language
            case mpaRating = "mpa_rating"
            case backgroundImage = "background_image"
            case backgroundImageOriginal = "background_image_original"
            case smallCoverImage = "small_cover_image"
            case mediumCoverImage = "medium_cover_image"
            case largeCoverImage = "large_cover_image"
            case state, torrents
            case dateUploaded = "date_uploaded"
            case dateUploadedUnix = "date_uploaded_unix"
        }

//    init(id: Int?, url: String?, imdbCode: String?, title: String?, titleEnglish: String?, titleLong: String?, slug: String?, year: Int?, rating: Double?, runtime: Int?, genres: [String]?, summary: String?, descriptionFull: String?, synopsis: String?, ytTrailerCode: String?, language: String?, mpaRating: MpaRating?, backgroundImage: String?, backgroundImageOriginal: String?, smallCoverImage: String?, mediumCoverImage: String?, largeCoverImage: String?, state: Stat?, torrents: [Torrent]?, dateUploaded: String?, dateUploadedUnix: Int?) {
//        self.id = id
//        self.url = url
//        self.imdbCode = imdbCode
//        self.title = title
//        self.titleEnglish = titleEnglish
//        self.titleLong = titleLong
//        self.slug = slug
//        self.year = year
//        self.rating = rating
//        self.runtime = runtime
//        self.genres = genres
//        self.summary = summary
//        self.descriptionFull = descriptionFull
//        self.synopsis = synopsis
//        self.ytTrailerCode = ytTrailerCode
//        self.language = language
//        self.mpaRating = mpaRating
//        self.backgroundImage = backgroundImage
//        self.backgroundImageOriginal = backgroundImageOriginal
//        self.smallCoverImage = smallCoverImage
//        self.mediumCoverImage = mediumCoverImage
//        self.largeCoverImage = largeCoverImage
//        self.state = state
//        self.torrents = torrents
//        self.dateUploaded = dateUploaded
//        self.dateUploadedUnix = dateUploadedUnix
//    }
}

//enum MpaRating: String, Codable {
//    case empty = ""
//    case mpaRatingPG13 = "PG-13"
//    case pg13 = "PG13"
//    case r = "R"
//}

enum Stat: String, Codable {
    case ok = "ok"
}

// MARK: - Torrent
class Torrent: Codable {
    var url: String?
    var hash: String?
    var quality: String?
    var type: TypeEnum?
    var seeds, peers: Int?
    var size: String?
    var sizeBytes: Int?
    var dateUploaded: String?
    var dateUploadedUnix: Int?

    enum CodingKeys: String, CodingKey {
        case url, hash, quality, type, seeds, peers, size
        case sizeBytes
        case dateUploaded
        case dateUploadedUnix
    }

//    init(url: String?, hash: String?, quality: Quality?, type: TypeEnum?, seeds: Int?, peers: Int?, size: String?, sizeBytes: Int?, dateUploaded: String?, dateUploadedUnix: Int?) {
//        self.url = url
//        self.hash = hash
//        self.quality = quality
//        self.type = type
//        self.seeds = seeds
//        self.peers = peers
//        self.size = size
//        self.sizeBytes = sizeBytes
//        self.dateUploaded = dateUploaded
//        self.dateUploadedUnix = dateUploadedUnix
//    }
}

//enum Quality: String, Codable {
//    case the1080P = "1080p"
//    case the720P = "720p"
//}

enum TypeEnum: String, Codable {
    case bluray = "bluray"
    case web = "web"
}

// MARK: - Meta
class Meta: Codable {
    var serverTime: Int?
    var serverTimezone: String?
    var apiVersion: Int?
    var executionTime: String?

    enum CodingKeys: String, CodingKey {
        case serverTime
        case serverTimezone
        case apiVersion
        case executionTime
    }

//    init(serverTime: Int?, serverTimezone: String?, apiVersion: Int?, executionTime: String?) {
//        self.serverTime = serverTime
//        self.serverTimezone = serverTimezone
//        self.apiVersion = apiVersion
//        self.executionTime = executionTime
//    }
}
