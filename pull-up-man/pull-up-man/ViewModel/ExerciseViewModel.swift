//
//  ExerciseViewModel.swift
//  pull-up-man
//
//  Created by Young Soo Hwang on 2022/03/03.
//

import Foundation
import SensorKit

let toSecondsOffset:Double = -1 * 24 * 60 * 60;
let minute:Double = 60;
let hour:Double = minute * 60;
let fromDate = NSDate().addingTimeInterval(toSecondsOffset - 48*hour);
let toDate = NSDate().addingTimeInterval(toSecondsOffset - hour);

var device:SRDevice?;

class SensorKitDelegate: NSObject {
    
}

extension SensorKitDelegate: SRSensorReaderDelegate {
    
    func sensorReaderDidStopRecording(_ reader: SRSensorReader) {
        print("----sensorReaderDidStopRecording");
    }
    func sensorReaderWillStartRecording(_ reader: SRSensorReader) {
        print("----sensorReaderWillStartRecording");
    }
    func sensorReader(_ reader: SRSensorReader, fetching fetchRequest: SRFetchRequest, didFetchResult result: SRFetchResult<AnyObject>) -> Bool {
        print("++++++++++sensorReader fetch");
        print(result.sample)
        return true;
    }
    
    func sensorReader(_ reader: SRSensorReader, didChange authorizationStatus: SRAuthorizationStatus) {
        print("----0000 sensorReader authorizationStatus: ");
    }
    
    func sensorReader(_ reader: SRSensorReader, fetchDevicesDidFailWithError error: Error) {
        print("----00000 sensorReader fetchDevicesDidFailWithError: ");
    }
    func sensorReader(_ reader: SRSensorReader, didFetch devices: [SRDevice]) {
        print("----sensorReader didFetch devices: ");
        device = devices[0]
        print("device \(String(describing: device))")
    }
    func sensorReader(_ reader: SRSensorReader, didCompleteFetch fetchRequest: SRFetchRequest) {
        print("----sensorReader didCompleteFetch: ");
    }
    func sensorReader(_ reader: SRSensorReader, stopRecordingFailedWithError error: Error) {
        print("----sensorReader stopRecordingFailedWithError: ");
    }
    func sensorReader(_ reader: SRSensorReader, startRecordingFailedWithError error: Error) {
        print("----sensorReader startRecordingFailedWithError: ");
    }
    func sensorReader(_ reader: SRSensorReader, fetching fetchRequest: SRFetchRequest, failedWithError error: Error) {
        print("----00000 sensorReader fetching failedWithError: ");
    }
    
}


class SensorKitManager {
    let reader = SRSensorReader(sensor:  .keyboardMetrics)
    let sensorKitDelegate = SensorKitDelegate();
    
    func checkToSetDelegate() {
        if (self.reader.delegate == nil) {
            print("setting delegate")
            self.reader.delegate = self.sensorKitDelegate;
         }
    }
    
    func startRecording() {
        self.checkToSetDelegate();
        self.reader.startRecording();
    }
    
    func stopRecording() {
        self.checkToSetDelegate();
        self.reader.stopRecording();
    }
    
    func request() {
        self.checkToSetDelegate();
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print("from: \(dateFormatter.string(from: fromDate as Date))")

        print("requesting access to sensor kit; authorization status: \(self.reader.authorizationStatus)")
        if (self.reader.authorizationStatus != .authorized) {
            SRSensorReader.requestAuthorization(sensors: [.keyboardMetrics] ) { (error: Error?) -> Void in
                if let error = error { fatalError( "Sensor authorization failed due to: \(error)" ) }
                
                print("requested to start recording keyboardMetrics; authorization status: \(self.reader.authorizationStatus)")
                self.startRecording();
                self.fetchDevices();
            }
        } else {
            print("already authorized")
            self.startRecording();
            self.fetchDevices();
        }
    }
    
    func fetchDevices() {
        self.reader.fetchDevices();
        
    }
    
    func fetch() {
        self.checkToSetDelegate();
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let request = SRFetchRequest();
        request.from = fromDate.srAbsoluteTime;
        request.to = toDate.srAbsoluteTime;
//        request.from = SRAbsoluteTime(91400845.26107958);
//        request.to = SRAbsoluteTime(91442042.712850332);
        if let value = device {
            request.device = value;
        } else {
            print("fetching devices")
            self.fetchDevices();
        }
        print("authorizationStatus: \(self.reader.authorizationStatus.rawValue)");
        print("3 from: \(dateFormatter.string(from: NSDate(srAbsoluteTime: request.from) as Date)) to: \(dateFormatter.string(from: NSDate(srAbsoluteTime: request.to) as Date))) device: \(request.device.name)")

        self.reader.fetch(request)
    }
}
