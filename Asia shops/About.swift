//
//  About.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 09.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class About: UIViewController, AboutViewDelegate, MFMailComposeViewControllerDelegate{
    
    @IBOutlet var Open: UIBarButtonItem!
    weak var aboutView : AboutView!
    
    override func loadView() {
        super.loadView();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Open.target=self.revealViewController()
        Open.action=Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view=UIView(frame: CGRectMake(0 , 50, self.view.frame.width, self.view.frame.height))
        self.view.backgroundColor=UIColor.whiteColor();
        let av = AboutView(frame: CGRectMake(0 , 0, self.view.frame.width, self.view.frame.height))
        av.autoresizingMask = UIViewAutoresizing.FlexibleWidth;
        av.delegate=self
        self.view.addSubview(av)
        self.aboutView = av
        
        //self.navigationController?.navigationBar.barTintColor=UIColor.redColor()
    }
    override func viewWillLayoutSubviews() {
        
    }
    //MARK: AboutViewDelegate
    func showAlert(){
        // insert UIAlertController with TextField code here..
        var subjectTextField: UITextField?
        var textTextField: UITextField?
        
        let alertController = UIAlertController(title: "Napište mi", message: "Máte nejaké připomínky k aplikaci, nefunguje vám něco? Popište detailně svůj problém a já se jím budu zabývat a snažit se vše napravit.", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Odeslat", style: .Default, handler: { (action) -> Void in
            if subjectTextField?.text=="" || textTextField?.text==""{
                print("nektera pole jsou prazdna")
            }
            else {
               self.sendEmial(subjectTextField!.text, text: textTextField!.text)
               print("Uživatel odeslal zprávu")
            }
        })
        let cancel = UIAlertAction(title: "Zrušit", style: .Cancel) { (action) -> Void in
            print("Uživatel zrušil odeslání zprávy.")
        }
        alertController.addAction(ok)
        alertController.addAction(cancel)
        alertController.addTextFieldWithConfigurationHandler{ (subj) -> Void in
            subjectTextField=subj
            subjectTextField?.placeholder="Předmět"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Enter the textfiled customization code here.
            textTextField = textField
            textTextField?.placeholder = "Text vaší zprávy"
        }
        presentViewController(alertController, animated: true, completion: nil)
    }
    func sendEmial(predmet:String?, text:String?){
        let mailComposeViewController = configuredMailComposeViewController(predmet,text: text)
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    func configuredMailComposeViewController(predmet:String?, text:String?) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["lukas.pechac@me.com"])
        mailComposerVC.setSubject("Asia Shops: "+predmet!)
        mailComposerVC.setMessageBody(text!, isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let al = UIAlertController(title: "Email se nepodařilo odeslat.", message: "Vaše zařízení nepodporuje odesílání emailu.  Zkontrolujte nastavení vašeho emailového klienta v zařízení a zkuste to znovu.", preferredStyle: .Alert)
        let submit = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in })
        al.addAction(submit)
        presentViewController(al, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

}