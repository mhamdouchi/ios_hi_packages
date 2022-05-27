//
//  DoubleExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Double {
    enum FormatStyle {
        case currencyDisplay
        case currencyInput
        case minutesSeconds
        case number
        case percent
        case percentInput
        case standard
    }

    func format(with style: FormatStyle) -> String {
        let result: String

        switch style {
            case .currencyDisplay:
                result = formatCurrencyDisplay(self) ?? kEmptyString

            case .currencyInput:
                result = formatCurrencyInput(self) ?? kEmptyString

            case .minutesSeconds:
                result = formatMinutesSeconds(self)

            case .number:
                result = formatNumber(self) ?? kEmptyString

            case .percent:
                result = formatPercent(self) ?? kEmptyString

            case .percentInput:
                result = formatPercentInput(self) ?? kEmptyString

            case .standard:
                result = formatStandard(self) ?? kEmptyString
        }

        return result
    }
}

// MARK: - Private Methods
extension Double {
    private func formatCurrencyDisplay(_ value: Double) -> String? {
        var currency: String = kEmptyString

        let stringValue = value.toString()
        let values = stringValue.split(separator: ".")

        guard let decimal = values.first, let decimalInt = Int(decimal) else { return nil }

        let formattedDecimal = decimalInt.formatNumber()

        switch values.count {
            case 1:
                currency = "$\(formattedDecimal)"

            case 2:
                var floating = values.last!

                if decimalInt == 0 {
                    floating = floating.prefix(8)

                    switch floating.count {
                        case 1:
                            if floating == "0" {
                                floating = kEmptyStringSubSequence
                            } else {
                                floating.append("0")
                            }

                        case 2:
                            if floating == "00" {
                                floating = kEmptyStringSubSequence
                            }

                        default:
                            while floating.last == "0" {
                                floating.removeLast()
                            }
                    }
                } else {
                    switch floating.count {
                        case 1:
                            if floating == "0" {
                                floating = kEmptyStringSubSequence
                            } else {
                                floating.append("0")
                            }

                        default:
                            floating = floating.prefix(2)

                            if floating == "00" {
                                floating = kEmptyStringSubSequence
                            }
                    }
                }

                if !floating.isEmpty {
                    currency = "$\(formattedDecimal).\(floating)"
                } else {
                    currency = "$\(formattedDecimal)"
                }

            default:
                break
        }

        return currency
    }

    private func formatCurrencyInput(_: Double) -> String? {
        let numberFormatter = NumberFormatter()

        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2

        let formattedCurrency = "$\(numberFormatter.string(from: NSNumber(value: self))!)"

        return formattedCurrency
    }

    private func formatMinutesSeconds(_: Double) -> String {
        let time = NSInteger(self)

        let minutes = (time / 60) % 60
        let seconds = time % 60

        return String(format: "%0.2d:%0.2d", minutes, seconds)
    }

    private func formatNumber(_: Double) -> String? {
        let numberFormatter = NumberFormatter()

        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2

        let formattedCurrency = "\(numberFormatter.string(from: NSNumber(value: self))!)"

        return formattedCurrency
    }

    private func formatPercent(_ value: Double) -> String? {
        var percent: String = kEmptyString

        let stringValue = value.toString()
        let values = stringValue.split(separator: ".")

        guard let decimal = values.first, let decimalInt = Int(decimal) else { return nil }

        let formattedDecimal = decimalInt.formatNumber()

        switch values.count {
            case 1:
                percent = "\(formattedDecimal)%"

            case 2:
                var floating = values.last!

                if decimalInt == 0 {
                    switch floating.count {
                        case 1:
                            if floating == "0" {
                                floating = kEmptyStringSubSequence
                            } else {
                                floating.append("0")
                            }

                        case 2:
                            if floating == "00" {
                                floating = kEmptyStringSubSequence
                            }

                        default:
                            floating = floating.prefix(2)

                            if floating == "00" {
                                floating = "01"
                            }
                    }
                } else {
                    switch floating.count {
                        case 1:
                            if floating == "0" {
                                floating = kEmptyStringSubSequence
                            } else {
                                floating.append("0")
                            }

                        default:
                            floating = floating.prefix(2)

                            if floating == "00" {
                                floating = kEmptyStringSubSequence
                            }
                    }
                }

                if !floating.isEmpty {
                    percent = "\(formattedDecimal).\(floating)%"
                } else {
                    percent = "\(formattedDecimal)%"
                }

            default:
                break
        }

        return percent
    }

    private func formatPercentInput(_: Double) -> String? {
        let numberFormatter = NumberFormatter()

        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 0

        let formattedCurrency = "\(numberFormatter.string(from: NSNumber(value: self))!)%"

        return formattedCurrency
    }

    private func formatStandard(_ value: Double) -> String? {
        var standard: String = kEmptyString

        let stringValue = value.toString()
        let values = stringValue.split(separator: ".")
        guard let decimal = values.first, let decimalInt = Int(decimal) else { return nil }

        let formattedDecimal = decimalInt.formatNumber()

        switch values.count {
            case 1:
                standard = "\(formattedDecimal)"

            case 2:
                var floating = values.last!

                if decimalInt > 0 {
                    floating = floating.prefix(8)

                    switch floating.count {
                        case 1:
                            if floating == "0" {
                                floating = kEmptyStringSubSequence
                            } else {
                                floating.append("0")
                            }

                        case 2:
                            if floating == "00" {
                                floating = kEmptyStringSubSequence
                            }

                        default:
                            break
                    }
                } else {
                    switch floating.count {
                        case 1:
                            if floating == "0" {
                                floating = kEmptyStringSubSequence
                            } else {
                                floating.append("0")
                            }

                        default:
                            floating = floating.prefix(8)

                            if floating == "00" {
                                floating = kEmptyStringSubSequence
                            }
                    }
                }

                if !floating.isEmpty {
                    standard = "\(formattedDecimal).\(floating)"
                } else {
                    standard = "\(formattedDecimal)"
                }

            default:
                break
        }

        return standard
    }

    private func toString() -> String {
        let stringValue = String(format: "%.10f", self)

        let values = stringValue.split(separator: ".")

        guard let decimal = values.first, var floating = values.last else { return kEmptyString }

        while floating.count > 2, floating.last == "0" {
            floating.removeLast()
        }

        return "\(decimal).\(floating)"
    }
}
