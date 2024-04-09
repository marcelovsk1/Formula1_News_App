import Foundation

class NewsManager {
    func getCircuits(completion: @escaping (Result<CircuitsResponse, Error>) -> Void) {
        fetchData(from: "http://ergast.com/api/f1/circuits.json", completion: completion)
    }
    
    func getConstructors(completion: @escaping (Result<ConstructorsResponse, Error>) -> Void) {
        fetchData(from: "http://ergast.com/api/f1/constructors.json", completion: completion)
    }
    
    func getDrivers(completion: @escaping (Result<DriversResponse, Error>) -> Void) {
        fetchData(from: "http://ergast.com/api/f1/drivers.json", completion: completion)
    }
    
    func getRaceResults(completion: @escaping (Result<RaceResultsResponse, Error>) -> Void) {
        fetchData(from: "http://ergast.com/api/f1/current/last/results.json", completion: completion)
    }
    
    private func fetchData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(T.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct CircuitsResponse: Decodable {
    var Circuits: String
}

struct ConstructorsResponse: Decodable {
    var Constructors: String
}

struct DriversResponse: Decodable {
    var Drivers: String
}

struct RaceResultsResponse: Decodable {
    var RaceResults: String
}
