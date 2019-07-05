//
//  ViewController.swift
//  LightApp
//
//  Created by  Джон Костанов on 04/07/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var lightOn = false
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn = !lightOn
        
        updateUI()
        
    

    }
    func updateUI() {
//        if lightOn {
//            view.backgroundColor = .white
//        } else {
//            view.backgroundColor = .blue
//        }
        
        let device = AVCaptureDevice.default(for: .video)
        
        if let device = device {
            do {
                try device.lockForConfiguration()
                device.torchMode = lightOn ? .on : .off
                device.unlockForConfiguration()
                view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            } catch {
                print(error)
            }
        } else {
               view.backgroundColor = lightOn ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

