//
//  Detection.swift
//  GitTest
//
//  Created by Radian Dhuha on 04/06/26.
//
//  Human detection state machine types and haptic trigger definitions.
import SwiftUI

// MARK: - Detection State

enum DetectionStat: String, CaseIterable, Sendable {
    case noHuman = "NO_HUMAN"
    case detected = "HUMAN_DETECTED"
    case centered = "HUMAN_CENTERED"
    case tooClose = "HUMAN_TOO_CLOSE"

    var displayName: String {
        switch self {
        case .noHuman: "No Human"
        case .detected: "Human Detected"
        case .centered: "Human Centered"
        case .tooClose: "Too Close!"
        }
    }

    var color: Color {
        switch self {
        case .noHuman: .gray
        case .detected: .green
        case .centered: .blue
        case .tooClose: .red
        }
    }

    var icon: String {
        switch self {
        case .noHuman: "person.slash"
        case .detected: "person.fill.checkmark"
        case .centered: "person.crop.circle.badge.checkmark"
        case .tooClose: "person.crop.circle.badge.exclamationmark"
        }
    }
}

// MARK: - Haptic Trigger

enum HapticTrigge: String, CaseIterable, Sendable {
    case humanDetected = "HUMAN_DETECTED"
    case humanLost = "HUMAN_LOST"
    case humanCentered = "HUMAN_CENTERED"
    case humanTooClose = "HUMAN_TOO_CLOSE"
    case randomTrigger = "RANDOM_TRIGGER"

    var displayName: String {
        switch self {
        case .humanDetected: "Human Detected"
        case .humanLost: "Human Lost"
        case .humanCentered: "Human Centered"
        case .humanTooClose: "Human Too Close"
        case .randomTrigger: "Random Trigger"
        }
    }

    var emoji: String {
        switch self {
        case .humanDetected: "✅"
        case .humanLost: "❌"
        case .humanCentered: "🎯"
        case .humanTooClose: "⚠️"
        case .randomTrigger: "🎲"
        }
    }
}

// MARK: - Trigger Log Entry

struct TriggerLogEntr: Identifiable, Sendable {
    let id = UUID()
    let timestamp: Date

    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: timestamp)
    }
}
