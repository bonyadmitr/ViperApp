//
//  AppDelegatesAssembly.swift
//  ViperApp
//
//  Created by Bondar Yaroslav on 29/09/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import DipApplication

// swiftlint:disable delegate
final class AppDelegatesAssembly: BaseLaunchAssembly {
    var appDelegate: AppDelegate {
        return resolve()
    }
    
    init(root: RootLaunchAssembly, storyboards: StoryboardsAssembly) {
        super.init(withCollaborator: root)
        
        container.register { MainLaunchRouter(window: $0, storyboard: storyboards.initialStoryboard) as LaunchRouter }
        container.register { AppDelegate(mainRouter: $0) }
        container.register { AppDelegateProxy() }
            .resolvingProperties { (_, proxy) in
                proxy.handlers = [
                    self.appDelegate
                ]
        }
    }
}
// swiftlint:enable delegate
