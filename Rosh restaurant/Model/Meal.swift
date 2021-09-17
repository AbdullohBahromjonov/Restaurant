//
//  MealView.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 4/5/21.
//

import SwiftUI
import UIKit

struct Meal: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var price: String
    var image: Image
    var calories: Int
    var liked: Bool
}
