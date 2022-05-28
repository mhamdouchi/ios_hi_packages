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

    public var colors: [UIColor] = [UIColor.colorWithHex(0xF26645),
                                    UIColor.colorWithHex(0xFFC75C),
                                    UIColor.colorWithHex(0x7AC7A3),
                                    UIColor.colorWithHex(0x4CC2D9),
                                    UIColor.colorWithHex(0x94638C)]

    public var intensity: Float = 0.5 {
        didSet {
            // clamp the intensity
            intensity = min(max(intensity, 0.0), 1.0)
            updateEmitterCells()
        }
    }

    public var type: ConfettiType = .confetti {
        didSet {
            updateEmitterCells()
        }
    }

    public var isActive: Bool {
        emitterLayer.birthRate > 0
    }

    private lazy var emitterLayer: CAEmitterLayer = { [self] in
        let emitter = CAEmitterLayer()

        emitter.emitterShape = .line
        emitter.birthRate = 0

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

    public func startConfetti() {
        emitterLayer.birthRate = 1
    }

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
        guard let image = imageForType(type: type) else { return nil }

        let confetti = CAEmitterCell()

        confetti.birthRate = 6.0 * intensity
        confetti.lifetime = 14.0 * intensity
        confetti.lifetimeRange = 0
        confetti.color = color.cgColor
        confetti.velocity = CGFloat(350.0 * intensity)
        confetti.velocityRange = CGFloat(80.0 * intensity)
        confetti.emissionLongitude = CGFloat(Double.pi)
        confetti.emissionRange = CGFloat(1)
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

        return UIImage(named: fileName, in: nil, compatibleWith: traitCollection)
    }
}
