//
//  ViewController.swift
//  HapticFeedbackSample
//
//  Created by Hari Kunwar on 1/8/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 
 Haptic feedbacks are small vibrations that convey message to user.
 
 //At this time, only the new Taptic Engine found in the iPhone 7 and iPhone 7 Plus support these APIs. Other devices
   silently ignore the haptic requests.
 
 -  The first rule of haptic feedback from the iOS Human Interface Guidelines: do not overuse it! You shouldn't send
    useless feedback to your users. If you do, they might decide to turn off this feature for their whole device.
 -  Because it can be disabled, don't use haptic feedback as your only method of feedback with your user.
 -  It may not be available on some devices, and the requests will silently be ignored on older devices that don't
    support it.
 
 How to Choose the Right Feedback
    
 -  UIImpactFeedbackGenerator provides a physical metaphor that complements the visual experience. For example, the user
    might feel a thud when a view slides into place or two objects collide. It has three variations: success, warning, 
    and failure.
 -  UINotificationFeedbackGenerator indicates that a task or action, such as depositing a check or unlocking a vehicle,
    has completed, failed, or produced a warning. It has three variations: light, medium, and heavy.
 -  UISelectionFeedbackGenerator indicates that the selection is actively changing. For example, the user feels light 
    taps while scrolling a picker wheel. This feedback is intended for communicating movement through a series of 
    discrete values, not making or confirming a selection.
 */

class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    fileprivate let pickerData = ["1", "2", "3", "4", "5"]
    fileprivate let impactGenerator = UIImpactFeedbackGenerator(style: UIImpactFeedbackStyle.light)
    fileprivate let notificationGenerator = UINotificationFeedbackGenerator()
    fileprivate let selectionGenerator = UISelectionFeedbackGenerator()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        impactGenerator.prepare()
        notificationGenerator.prepare()
        selectionGenerator.prepare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func impactAction(_ sender: Any) {
        if let switchControl = sender as? UISwitch {
            if switchControl.isOn {
                impactGenerator.impactOccurred()
            }
            else {
                impactGenerator.impactOccurred()
            }
        }
    }

    @IBAction func notificationAction(_ sender: Any) {
        if let switchControl = sender as? UISwitch {
            if switchControl.isOn {
                notificationGenerator.notificationOccurred(UINotificationFeedbackType.success)
            }
            else {
                notificationGenerator.notificationOccurred(UINotificationFeedbackType.error)
            }
        }
    }

}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Activate haptic feedback.
        selectionGenerator.selectionChanged()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
}
