//
//  ExerciseInfo.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-08.
//

import SwiftUI
import SwiftData

@Model
class ExerciseInfo {
    var name: String
    var details: String
    var userNotes: String?
    
    @Relationship
    var movementPattern: MovementPattern?
    
    init(name: String, details: String, userNotes: String? = nil, movementPattern: MovementPattern? = nil) {
        self.name = name
        self.details = details
        self.userNotes = userNotes
        self.movementPattern = movementPattern
    }
}

extension ExerciseInfo {
    static var defaults: [ExerciseInfo] {
        [
            .init(name: "Cable Cross Overs", details: "A chest exercise using cable machines. Bring the cables together in front of you, targeting the chest."),
            .init(name: "Straight Knee Machine Calf Raises", details: "A calf exercise using a machine. Rise onto your toes with straight knees to target the calf muscles."),
            .init(name: "Cambered Bar Bench Press", details: "A bench press variation using a cambered bar. Engages stabilizing muscles with the curved bar."),
            .init(name: "Chest Supported Rows", details: "A back exercise with chest support. Pull weights towards you in a horizontal rowing motion."),
            .init(name: "Chinup", details: "An upper-body exercise where you pull your body up to a bar with an underhand grip."),
            .init(name: "Chinup Grip Pulldowns", details: "A lat exercise using a cable machine with an underhand grip. Emulates the chin-up motion."),
            .init(name: "Clapping Pushups", details: "A plyometric push-up variation. Push explosively off the ground, clap hands, and return to the starting position."),
            .init(name: "Close Grip Slingshot", details: "A bench press variation using a slingshot. Emphasizes triceps engagement and lockout strength."),
            .init(name: "Closegrip Bench Press", details: "A bench press variation with a close grip. Targets triceps and inner chest."),
            .init(name: "Closegrip Pushup", details: "A push-up variation with hands closer together. Targets triceps and inner chest."),
            .init(name: "Concentration Curls", details: "An isolated bicep exercise. Sit on a bench, stabilize your elbow, and curl the weight with one arm."),
            .init(name: "3\" Conventional Block Pull", details: "A deadlift variation starting from a 3-inch block. Focus on hip and back extension."),
            .init(name: "1\" Conventional Deficit Deadlift", details: "A deadlift variation with a 1-inch deficit. Emphasizes increased range of motion."),
            .init(name: "Conventional Deadlift", details: "A classic deadlift. Lift the barbell from the ground with a hip hinge motion."),
            .init(name: "Conventional Deadlift (Technique)", details: "A deadlift with a focus on technique. Lift the barbell from the ground with proper form and control."),
            .init(name: "Cool Squat", details: "A squat variation with a unique stance or setup. Focus on controlled movement and muscle engagement."),
            .init(name: "Couch Stretch", details: "A stretching exercise targeting the hip flexors and quadriceps. Use a couch or elevated surface for support."),
            .init(name: "5 Count Pause Bench Press", details: "A bench press variation with a 5-second pause at the bottom. Emphasizes strength off the chest."),
            .init(name: "3 Count Pause Bench Press", details: "A bench press variation with a 3-second pause at the bottom. Enhances control and muscle engagement.")
        ]
    }
}
