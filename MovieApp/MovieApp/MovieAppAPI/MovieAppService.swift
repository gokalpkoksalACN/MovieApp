//
//  MovieAppService.swift
//  MovieApp
//
//  Created by gokalp.koksal on 11.08.2022.
//

import Foundation
import Alamofire

protocol MovieGenreAPI {
    func getGenreList(completion: @escaping (Result<GenreResponse, Error>) -> Void)
}

protocol MovieArtistAPI {
    func getArtists(completion: @escaping (Result<ArtistsResponse, Error>) -> Void)
}

protocol MovieDiscoverAPI {
    func getPopularMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void)
    func getUpcomingMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void)
    func getRecentMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void)
}

protocol MovieDetailsAPI {
    func getMovieDetails(with id: Int, completion: @escaping (Result<Movie, Error>) -> Void)
}

final class MovieAppService: MovieGenreAPI, MovieArtistAPI, MovieDiscoverAPI, MovieDetailsAPI {
    
    private let apiKey = "dc190303aea87bdf6e4faa3d59de8c59"
    private let baseUrl = "https://api.themoviedb.org/3"
    
    func getGenreList(completion: @escaping (Result<GenreResponse, Error>) -> Void) {
        let path = "genre/movie/list"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(GenreResponse.self, from: data)
                    let response = GenreResponse(genres: results.genres)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getArtists(completion: @escaping (Result<ArtistsResponse, Error>) -> Void) {
        let path = "person/popular"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(ArtistsResponse.self, from: data)
                    let response = ArtistsResponse(artists: results.artists)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getPopularMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        let path = "movie/popular"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder.plainDateDecoder()
                    let results = try decoder.decode(MoviesResponse.self, from: data)
                    let response = MoviesResponse(movies: results.movies)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUpcomingMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        let path = "movie/upcoming"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder.plainDateDecoder()
                    let results = try decoder.decode(MoviesResponse.self, from: data)
                    let response = MoviesResponse(movies: results.movies)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRecentMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        let path = "movie/now_playing"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder.plainDateDecoder()
                    let results = try decoder.decode(MoviesResponse.self, from: data)
                    let response = MoviesResponse(movies: results.movies)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMovieDetails(with id: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let path = "movie/\(id)"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder.plainDateDecoder()
                    let movie = try decoder.decode(Movie.self, from: data)
                    completion(.success(movie))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func getUrlString(for path: String) -> String {
        return baseUrl + "/" + path + "?" + "api_key=" + apiKey
    }
}
