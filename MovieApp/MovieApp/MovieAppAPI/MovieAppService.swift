//
//  MovieAppService.swift
//  MovieApp
//
//  Created by gokalp.koksal on 11.08.2022.
//

import Foundation
import Alamofire

protocol MovieAppServiceProtocol {
    func getGenreList(completion: @escaping (AFResult<GenreResponse>) -> Void)
    func getArtists(completion: @escaping (AFResult<ArtistsResponse>) -> Void)
    func getPopularMovies(completion: @escaping (AFResult<MoviesResponse>) -> Void)
    func getUpcomingMovies(completion: @escaping (AFResult<MoviesResponse>) -> Void)
    func getRecentMovies(completion: @escaping (AFResult<MoviesResponse>) -> Void)
}

final class MovieAppService: MovieAppServiceProtocol {
    
    private let apiKey = "dc190303aea87bdf6e4faa3d59de8c59"
    private let baseUrl = "https://api.themoviedb.org/3"
    
    func getGenreList(completion: @escaping (AFResult<GenreResponse>) -> Void) {
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
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getArtists(completion: @escaping (AFResult<ArtistsResponse>) -> Void) {
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
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPopularMovies(completion: @escaping (AFResult<MoviesResponse>) -> Void) {
        let path = "movie/popular"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(MoviesResponse.self, from: data)
                    let response = MoviesResponse(movies: results.movies)
                    completion(.success(response))
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUpcomingMovies(completion: @escaping (AFResult<MoviesResponse>) -> Void) {
        let path = "movie/upcoming"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(MoviesResponse.self, from: data)
                    let response = MoviesResponse(movies: results.movies)
                    completion(.success(response))
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRecentMovies(completion: @escaping (AFResult<MoviesResponse>) -> Void) {
        let path = "movie/now_playing"
        let urlString = getUrlString(for: path)
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(MoviesResponse.self, from: data)
                    let response = MoviesResponse(movies: results.movies)
                    completion(.success(response))
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getUrlString(for path: String) -> String {
        return baseUrl + "/" + path + "?" + "api_key=" + apiKey
    }
}
