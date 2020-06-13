//
//  Movie_DBTests.swift
//  Movie DBTests
//
//  Created by Indra on 10/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import XCTest
import Moya
@testable import Movie_DB


class Movie_DBTests: XCTestCase {
    
    var stubbingProvider : MoyaProvider<MovieDBService>!
    
    override func setUp() {
        super.setUp()
        
        stubbingProvider =  MoyaProvider<MovieDBService>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin()])
    }
    
    
    func customEndpointClosure(_ target: MovieDBService) -> Endpoint {
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    
    func testPopularMovies() {
        
        stubbingProvider.request(.popular) { result in
            
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(MovieAPIResults.self, from: moyaResponse.data)
                    self.waitForExpectations(timeout: 5) { (error) in
                        XCTAssertNotNil(results.movies)
                    }
                }catch let err{
                    print(err)
                }
                
            case let .failure(moyaError):
                XCTFail("There's an error, \(moyaError)")
            }
        }
        
    }
    
    
    func testUpComingMovies() {
        
        stubbingProvider.request(.upcoming) { result in
            
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(MovieAPIResults.self, from: moyaResponse.data)
                    self.waitForExpectations(timeout: 5) { (error) in
                        XCTAssertNotNil(results.movies)
                    }
                }catch let err{
                    print(err)
                }
                
            case let .failure(moyaError):
                XCTFail("There's an error, \(moyaError)")
            }
        }
        
    }
    
    
    func testTopRatingMovies() {
        
        stubbingProvider.request(.topRated) { result in
            
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(MovieAPIResults.self, from: moyaResponse.data)
                    self.waitForExpectations(timeout: 5) { (error) in
                        XCTAssertNotNil(results.movies)
                    }
                }catch let err{
                    print(err)
                }
                
            case let .failure(moyaError):
                XCTFail("There's an error, \(moyaError)")
            }
        }
        
    }
    
    func testNowPlayingMovies() {
        
        stubbingProvider.request(.nowPlaying) { result in
            
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(MovieAPIResults.self, from: moyaResponse.data)
                    self.waitForExpectations(timeout: 5) { (error) in
                        XCTAssertNotNil(results.movies)
                    }
                }catch let err{
                    print(err)
                }
                
            case let .failure(moyaError):
                XCTFail("There's an error, \(moyaError)")
            }
        }
    }
    
    func testReviews() {
        stubbingProvider.request(.reviews(id: 297761)) { result in
            
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(ReviewAPIResults.self, from: moyaResponse.data)
                    self.waitForExpectations(timeout: 5) { (error) in
                        XCTAssertNotNil(results.reviews)
                    }
                }catch let err{
                    print(err)
                }
                
            case let .failure(moyaError):
                XCTFail("There's an error, \(moyaError)")
            }
        }
    }
    
    func testMovieDetail(){
        let expectation = self.expectation(description: "request")
        stubbingProvider.request(.detail(id: 550)) { result in
            switch result {
            case let .success(moyaResponse):
                do{
                    let movie = try JSONDecoder().decode(Movie.self, from: moyaResponse.data)
                    XCTAssertNotNil(movie)
                }catch let err {
                    print(err)
                }
            case let .failure(moyaError):
                print("There's an error, \(moyaError)")
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0){ error in
            if let error = error {
                XCTFail("timeout errored: \(error)")
            }
        }
        
    }
    
}
