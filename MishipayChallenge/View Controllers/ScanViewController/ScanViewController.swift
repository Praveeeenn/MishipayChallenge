//
//  ScanViewController.swift
//  MishipayChallenge
//
//  Created by apple on 13/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit
import Alamofire

class ScanViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScanner()
    }
    
    private func setupScanner() {
        // Create the scan settings and enabling some symbologies
        let settings = SBSScanSettings.default()
        let symbologies: Set<SBSSymbology> = [.ean8, .ean13, .qr, .aztec, .codabar, .code11, .code128, .code25, .code32, .code39, .code93, .datamatrix, .dotCode, .datamatrix, .fiveDigitAddOn, .fiveDigitAddOn, .gs1Databar, .gs1DatabarExpanded, .gs1DatabarLimited]
        for symbology in symbologies {
            settings.setSymbology(symbology, enabled: true)
        }
        settings.motionCompensationEnabled = true
        // Create the barcode picker with the settings just created
        let barcodePicker = SBSBarcodePicker(settings:settings)
        barcodePicker.overlayController.view.addSubview(self.getMishipayImageView(barcodePicker))
        // Add the barcode picker as a child view controller
        addChild(barcodePicker)
        view.addSubview(barcodePicker.view)
        barcodePicker.didMove(toParent: self)
        // Set the allowed interface orientations. The value UIInterfaceOrientationMaskAll is the
        // default and is only shown here for completeness.
        barcodePicker.allowedInterfaceOrientations = .all
        // Set the delegate to receive scan event callbacks
        barcodePicker.scanDelegate = self
        barcodePicker.startScanning()
    }
    
    
    func getMishipayImageView(_ barcodePicker: SBSBarcodePicker) -> UIImageView {
        //custome View
        let imageView: UIImageView = UIImageView(frame: CGRect(x: barcodePicker.view.center.x-75, y: barcodePicker.view.frame.minY+50, width: 150, height: 75))
        imageView.image = #imageLiteral(resourceName: "logo-white")
        return imageView
    }
    
}

extension ScanViewController: SBSScanDelegate {


    func barcodePicker(_ picker: SBSBarcodePicker, didScan session: SBSScanSession) {
        session.pauseScanning()
        let code = session.newlyRecognizedCodes[0]
        DispatchQueue.main.async {
            let codeString: String = String(Int(code.data ?? "0") ?? 0)
            Alamofire.request("\(API.LookupBaseURL)barcode=\(codeString)&formatted=y&key=\(API.LookupAPIKey)", method: .get).responseJSON(completionHandler: { (response) in
                print(response)
                do {
                    let product: RootProduct = try JSONDecoder().decode(RootProduct.self, from: response.data ?? Data())
                    if response.result.isSuccess {
                        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as! UINavigationController
                        let viewController: ProductViewController = navigationController.viewControllers[0] as! ProductViewController
                        viewController.product = product
                        self.present(navigationController, animated: true, completion: nil)
                    }
                } catch let error {
                    print(error)
                    let alert = UIAlertController(title: "ERROR", message: "Sorry we were unable to find item.\n Please Contact store staff for more information.\n Code: \(code.data ?? "") Read Successfully",
                        preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { _ in
                        picker.resumeScanning()
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    self.setupScanner()
                }
            })
        }
    }
}
