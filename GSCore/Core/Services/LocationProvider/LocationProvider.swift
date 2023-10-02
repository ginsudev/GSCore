import Foundation
import CoreLocation
import Combine

public final class LocationProvider: NSObject, CLLocationManagerDelegate {
    private var bag: Set<AnyCancellable> = []
    private let locationManager: CLLocationManager
    
    private let locationSubject = PassthroughSubject<CLLocation?, Never>()
    
    public var locationPublisher: AnyPublisher<CLLocation?, Never> {
        locationSubject.eraseToAnyPublisher()
    }

    public override init() {
        // Need to fake as another app, because SpringBoard never asks for location permissions.
        self.locationManager = .init(effectiveBundleIdentifier: "com.apple.weather")
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    public func set(isUpdatingLocation: Bool) {
        if isUpdatingLocation {
            self.locationManager.startUpdatingLocation()
        } else {
            self.locationManager.stopUpdatingLocation()
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationSubject.send(locations.last)
    }
}
