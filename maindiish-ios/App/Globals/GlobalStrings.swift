//
//  StringLiterals.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 18/10/2023.
//

import Foundation

struct GlobalStrings {
    
    struct Title {
        static let onboarding1 = "Learn New Cooking Techniques and Recipes"
        static let onboarding2 = "Upload Your Food Reels and Videos"
        static let onboarding3 = "Find and Save Inspiring Recipes"
        static let onboardingLetsGo = "Let's go!"
        static let login = "Log in"
        static let welcomeSignupButton = "Sign up by email or phone number"
        static let signUp = "Sign Up"
        static let emptyField = "Empty Field"
        static let invalidEmail = "Invalid Email"
        static let invalidPassword = "Invalid Password"
        static let mismatchedPasswords = "Password donot match"
        static let termsNotAgreed = "Terms & Condtions not agreed"
        static let error = "Error"
        static let alert = "Alert"
    }
    
    struct Message {
        static let onboarding1Description = "Discover and adopt innovative culinary methods and recipes to elevate your cooking skills and repertoire."
        static let onboarding2Description = "Share your culinary creations with the world by uploading engaging food videos and reels, capturing your passion and expertise."
        static let onboarding3Description = "Discover a treasure trove of mouthwatering recipes to fuel your culinary imagination and Save your favorites."
        static let createUserNameScreenMessage = "Tell Us more about\nyourself"
        static let fillInRequiredFields = "Please fill in required fields"
        static let enterValidEmail = "Enter a valid email address"
        static let passwordMustContain = "Password must be atleast 8 characters long, contain number, a lowercase letter, an uppercase letter, a special character e.g. @.[]/!"
        static let passwordsMustBeSame = "Passwords must be same"
        static let agreeToTerms = "agree to terms & conditions"
    }
    
    struct UserDefaultKey {
        static var getStarted = "isOnboarding"
        static var isLoggedIn = "isLoggedIn"
    }
    
}
