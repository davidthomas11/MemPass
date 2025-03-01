//
//  SeedViewController.swift
//  MemPass
//
//  Created by David Thomas on 2015-12-11.
//  Copyright © 2015 Dave Anthony Thomas. All rights reserved.
//

import UIKit
import AVFoundation

public class SeedViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    @IBOutlet weak var QRImage: UIImageView!
    var memPass:MemPass = MemPass.sharedInstance()
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    lazy var reader = QRCodeReaderViewController(metadataObjectTypes: [AVMetadataObjectTypeQRCode])

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        refreshQR()
        
        //self.view.backgroundColor = UIColor.radialGradiant(UIColor.colorFromHex("#292d33"), toColor: UIColor.colorFromHex("#3fb2ee"), withHeight: self.view.bounds.height, withWidth: self.view.bounds.width)
        
        
    }
    
    public override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = false
        
        self.navigationItem.title = "Seed"
        
        self.navigationController?.navigationBar.tintColor =
            UIColor.colorFromHex("#EF6340")
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scan QR", style: UIBarButtonItemStyle.Plain, target: self, action: "scanQR")
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.colorFromHex("#EF6340")
        
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value: "SeedView")
        
        let builder = GAIDictionaryBuilder.createScreenView()
        tracker.send(builder.build() as [NSObject : AnyObject])
        
    }
    
    public func reader(reader: QRCodeReaderViewController, didScanResult result: String) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.navigationController?.navigationBarHidden = false
        
        
        memPass.reSeed(result)
        refreshQR()
    }
    
    public func readerDidCancel(reader: QRCodeReaderViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.navigationController?.navigationBarHidden = false
        
    }
    
    func scanQR() {
        
        guard QRCodeReader.isAvailable() else {
            
            let alert = UIAlertController(title: "Camera Unavailable",
                message: "Device camera unavailable. Allow access in your general settings.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.colorFromHex("#ffcc00")
            
            return
        }
        // Retrieve the QRCode content
        // By using the delegate pattern
        reader.delegate = self
        
        // Or by using the closure pattern
        reader.completionBlock = { (result: String?) in
            print(result)
        }
        
        // Presents the reader as modal form sheet
        reader.modalPresentationStyle = .FormSheet
        presentViewController(reader, animated: true, completion: nil)
    }
    
    func refreshQR() {
        let qr = QRCode(memPass.memPassSyncKey())
        QRImage.image = qr?.image
    }
    
    @IBAction func close(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func showSeed(sender: AnyObject) {
    
        let alert = UIAlertController(title: "Seed", message: memPass.memPassSyncKey(), preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        alert.view.tintColor = UIColor.colorFromHex("#ffcc00")
        
    }
    
    override public func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func copyToClipboard(sender: AnyObject) {
    
        UIPasteboard.generalPasteboard().string = memPass.memPassSyncKey()
        self.view.makeToast("Seed copied to clipboard")
    }
    
    @IBAction func reSeed(sender: AnyObject) {
        
        let confirm = UIAlertController(title: "ReSeed", message: "Warning! This will change all your passwords. Reseed your passwords?", preferredStyle: UIAlertControllerStyle.Alert)

        
        
        confirm.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            [weak self]_ in
            
            self?.memPass.reSeed()
            self?.refreshQR()
            
            }))
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        confirm.addAction(cancel)
        
        self.presentViewController(confirm, animated: true, completion: nil)
        
        confirm.view.tintColor = UIColor.colorFromHex("#ffcc00")
        
    }
}
