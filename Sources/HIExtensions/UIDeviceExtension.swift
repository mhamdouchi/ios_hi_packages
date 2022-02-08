//
//  UIDeviceExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit
import AVFoundation
import CoreHaptics

public extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    static var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.filter{ $0.isKeyWindow }.first?.safeAreaInsets.bottom ?? 0
        
        return bottom > 0
    }
    
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    static func playHapticImpact(with type: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: type).impactOccurred()
    }
    
    static func playHapticFeedback(with type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
}
