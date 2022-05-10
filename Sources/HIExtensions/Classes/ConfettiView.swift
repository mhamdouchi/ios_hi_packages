//
//  ConfettiView.swift
//
//
//  Created by Mohamed Hamdouchi on 5/10/22.
//

import QuartzCore
import UIKit

public class ConfettiView: UIView {
    public enum ConfettiType: CustomDebugStringConvertible {
        case confetti
        case triangle
        case star
        case diamond
        case custom(UIImage)

        public var debugDescription: String {
            switch self {
                case .confetti: return "confetti"
                case .triangle: return "triangle"
                case .star: return "star"
                case .diamond: return "diamond"
                case .custom: return "custom"
            }
        }
    }

    override public var bounds: CGRect {
        didSet {
            updateEmitterFromBounds()
        }
    }

    /// The colors available for the confetti. This property has a default value of multiple colors.
    public var colors = [
        UIColor(red: 0.95, green: 0.40, blue: 0.27, alpha: 1.0),
        UIColor(red: 1.00, green: 0.78, blue: 0.36, alpha: 1.0),
        UIColor(red: 0.48, green: 0.78, blue: 0.64, alpha: 1.0),
        UIColor(red: 0.30, green: 0.76, blue: 0.85, alpha: 1.0),
        UIColor(red: 0.58, green: 0.39, blue: 0.55, alpha: 1.0),
    ]

    /// The intensity refers to how many particles are generated and how quickly they fall.
    /// Set the intensity of the confetti with the .intensity property by passing in a value between `0` and `1`.
    /// The default intensity is `0.5`.
    public var intensity: Float = 0.5 {
        didSet {
            // clamp the intensity
            intensity = min(max(intensity, 0.0), 1.0)
            updateEmitterCells()
        }
    }

    /// Pick one of the preconfigured types of confetti or create your own by providing a custom image.
    /// This property defaults to the `.confetti` type.
    public var type: ConfettiType = .confetti {
        didSet {
            updateEmitterCells()
        }
    }

    /// Whether the view is currently emitting additional confetti.
    public var isActive: Bool {
        emitterLayer.birthRate > 0
    }

    private lazy var emitterLayer: CAEmitterLayer = { [self] in
        let emitter = CAEmitterLayer()
        emitter.emitterShape = .line
        emitter.birthRate = 0 // start disabled
        return emitter
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        addEmitterLayer()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        addEmitterLayer()
    }

    /// Starts emitting cells.
    public func startConfetti() {
        emitterLayer.birthRate = 1
    }

    /// Stops emitting cells, any cells that are alive will remain until their lifetime expires.
    public func stopConfetti() {
        emitterLayer.birthRate = 0
    }
}

private extension ConfettiView {
    func addEmitterLayer() {
        layer.addSublayer(emitterLayer)
        updateEmitterFromBounds()
        updateEmitterCells()
    }

    func updateEmitterFromBounds() {
        emitterLayer.emitterPosition = CGPoint(x: bounds.size.width / 2.0, y: -40)
        emitterLayer.emitterSize = CGSize(width: bounds.size.width, height: 1)
    }

    func updateEmitterCells() {
        emitterLayer.emitterCells = colors.compactMap(confettiWithColor(color:))
    }

    func confettiWithColor(color: UIColor) -> CAEmitterCell? {
        guard let image = imageForType(type: type) else {
            print("Unable to locate image \(type.debugDescription) in bundle")
            return nil
        }

        let confetti = CAEmitterCell()
        confetti.birthRate = 6.0 * intensity
        confetti.lifetime = 14.0 * intensity
        confetti.lifetimeRange = 0
        confetti.color = color.cgColor
        confetti.velocity = CGFloat(350.0 * intensity)
        confetti.velocityRange = CGFloat(80.0 * intensity)
        confetti.emissionLongitude = CGFloat(Double.pi)
        confetti.emissionRange = CGFloat(Double.pi)
        confetti.spin = CGFloat(3.5 * intensity)
        confetti.spinRange = CGFloat(4.0 * intensity)
        confetti.scaleRange = CGFloat(intensity)
        confetti.scaleSpeed = CGFloat(-0.1 * intensity)
        confetti.contents = image.cgImage
        return confetti
    }

    func imageForType(type: ConfettiType) -> UIImage? {
        let fileName: String

        switch type {
            case .confetti:
                fileName = "confetti"

            case .triangle:
                fileName = "triangle"

            case .star:
                fileName = "star"

            case .diamond:
                fileName = "diamond"

            case let .custom(customImage):
                return customImage
        }

        return UIImage(named: fileName)
    }
}
