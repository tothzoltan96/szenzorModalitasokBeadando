//
//  qrCodeReaderViewController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit
import AVFoundation

// QRCodeReaderViewController class
class QRCodeReaderViewController: UIViewController {
    
    // Variables
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession = AVCaptureSession()
        AVCaptureDevice.requestAccess(for: .video) { response in
            if response {
                // acces granted
                DispatchQueue.main.asyncAfter(deadline: .now(), execute:  {
                    
                    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
                        self.failed()
                        return
                    }
                    let videoInput: AVCaptureDeviceInput
                    
                    do {
                        videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
                    } catch {
                        self.failed()
                        return
                    }
                    
                    if (self.captureSession.canAddInput(videoInput)) {
                        self.captureSession.addInput(videoInput)
                    } else {
                        self.failed()
                        return
                    }
                    
                    let metadataOutput = AVCaptureMetadataOutput()
                    
                    if (self.captureSession.canAddOutput(metadataOutput)) {
                        self.captureSession.addOutput(metadataOutput)
                        
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
                    } else {
                        self.failed()
                        return
                    }
                    
                    self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
                    self.previewLayer.frame = self.view.layer.bounds
                    self.previewLayer.videoGravity = .resizeAspectFill
                    self.view.layer.addSublayer(self.previewLayer)
                    self.captureSession.startRunning()
                })
            } else {
                // go back to medicines
            }
        }
    }
    
    // Functions
    func failed() {
        let alert = UIAlertController(title: "Scanner not supported", message: "Please use a device with a camera. Because this device does not support scanning a code", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if(captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

// AVCaptureMetadataOutputObjectsDelegate protocol implement here
extension QRCodeReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            found(code: stringValue)
        } else {
            print("Not able to read the code! Please try again or be keep your device on Bar Code or Scanner Code!")
        }
         
        dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
    }
}
