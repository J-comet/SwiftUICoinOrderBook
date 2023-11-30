//
//  UserDefaultsGroup.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/30.
//

import Foundation

extension UserDefaults {
    static var groupShared: UserDefaults {
        let appGroupID = "group.comet.SwiftUICoinOrderBook"
        return UserDefaults(suiteName: appGroupID)!
    }
}

