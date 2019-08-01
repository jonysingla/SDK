//
//  ViewController.swift
//  MindDemo
//
//  Created by Jony on 31/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit
import TPKeyboardAvoidingSwift
import SkyFloatingLabelTextField

import MINDPayments

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtTotalAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var txtTax: SkyFloatingLabelTextField!
    @IBOutlet weak var txtGratiuity: SkyFloatingLabelTextField!
    @IBOutlet weak var txtDiscount: SkyFloatingLabelTextField!
    @IBOutlet weak var txtBalanceAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPaidAmount: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCardNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCCExp: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCVV: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btniDynampUncheckBox: UIButton!
    @IBOutlet weak var btneDynamoUncheckBox: UIButton!
    var paidAmount : Int! = 0
    let minValue : Int! = 0
    var cardTypePaymentMode : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtBalanceAmount.isUserInteractionEnabled = false
        creditCardCheckout()
        balance()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        print("paidAmount  \(paidAmount ?? 0)")
        if (paidAmount == 0) {
            CustomAlert.sharedInstance.alert(view: self, title: "Error", message: "Please enter some amount")
        }
        else {
            
            let transInfo = ["paidAmount": paidAmount ?? 0, "txtCardNumber": txtCardNumber.text ?? 0, "txtCVV": txtCVV.text ?? 0, "txtCCExp": txtCCExp.text ?? 0, "cardTypePaymentMode": cardTypePaymentMode] as [String : Any]
            print("transInfo \(transInfo)")
            let dict: Dictionary = Payments.transInfo(transInfo: transInfo)
            print("AFTER transInfo \(dict)")
            
            print(transInfo["paidAmount"] ?? 0)
            print(transInfo["txtCardNumber"] ?? 0)
            print(transInfo["txtCVV"] ?? 0)
            print(transInfo["txtCCExp"] ?? 0)
            print(transInfo["cardTypePaymentMode"] ?? "cardTypePaymentMode")
        }
    }
    
    //MARK:- Here calling SDK Method
    func creditCardCheckout() {
        let sum = Payments.add(left: 10, right: 15)
        print("sum \(sum)")
        
    }
    
    func balance() {
        let balnace = Payments.subtract(left: 40, right: 20)
        print("balnace \(balnace)")
        
    }
    
    @IBAction func btniDynamoUncheckBoxAction(_ sender: Any) {
        if btniDynampUncheckBox.isSelected == true {
            btniDynampUncheckBox.setImage(UIImage(named: "uncheckIcon"), for: UIControl.State.normal)
            txtfieldIsHidden(chkValue: true)
            btniDynampUncheckBox.isSelected = false
        }
        else {
            if btneDynamoUncheckBox.isSelected == true {
                CustomAlert.sharedInstance.alert(view: self, title: "Error", message: "You can't select multiple payment mode at a time")
            } else {
                txtfieldIsHidden(chkValue: false)
                cardTypePaymentMode = "iDynamo Card"
                btniDynampUncheckBox.setImage(UIImage(named: "checkedIcon"), for: UIControl.State.normal)
                btniDynampUncheckBox.isSelected = true
            }
        }
    }
    
    @IBAction func btneDynamoCheckBoxAction(_ sender: Any) {
        if btneDynamoUncheckBox.isSelected == true {
            if btniDynampUncheckBox.isSelected == true {
                CustomAlert.sharedInstance.alert(view: self, title: "Error", message: "You can't select multiple payment mode at a time")
            } else {
                txtfieldIsHidden(chkValue: true)
                btneDynamoUncheckBox.setImage(UIImage(named: "uncheckIcon"), for: UIControl.State.normal)
                btneDynamoUncheckBox.isSelected = false
            }
        }
            
        else {
            if btniDynampUncheckBox.isSelected == true {
                CustomAlert.sharedInstance.alert(view: self, title: "Error", message: "You can't select multiple payment mode at a time")
            } else {
                txtfieldIsHidden(chkValue: false)
                cardTypePaymentMode = "eDynamo Card"
                btneDynamoUncheckBox.setImage(UIImage(named: "checkedIcon"), for: UIControl.State.normal)
                btneDynamoUncheckBox.isSelected = true
            }
            
        }
    }
    
    //MARK:- Text field delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (txtTotalAmount.text?.count != 0) {
            let totalAmount : Int = Int(txtTotalAmount.text!) ?? 0
            let taxAmount : Int = Int(txtTax.text!) ?? 0
            let gratiuityAmount : Int = Int(txtGratiuity.text!) ?? 0
            let discountAmount : Int = Int(txtDiscount.text!) ?? 0
            
            paidAmount = totalAmount + taxAmount + gratiuityAmount - discountAmount
            txtBalanceAmount.text = String(paidAmount)
            txtPaidAmount.text = String(paidAmount)
        }

        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(textField.text! == txtCardNumber.text)
        {
            let maxLength = 15
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        else if(textField.text! == txtCCExp.text)
        {
            let maxLength = 4
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        else if(textField.text! == txtCVV.text)
        {
            let maxLength = 3
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return true
    }
    
    
    func txtfieldIsHidden(chkValue : Bool) {
        txtPaidAmount.isHidden = chkValue
        txtCardNumber.isHidden = chkValue
        txtCCExp.isHidden = chkValue
        txtCVV.isHidden = chkValue
    }
    


}

