//
//  StoryboardsAssembly.swift
//  ViperApp
//
//  Created by Bondar Yaroslav on 29/09/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//
import DipApplication

final class StoryboardsAssembly: BaseCoreAssembly {
    
    /// set in Info.plist !!!
    let storyboardTag = "Main"
    
    var initialStoryboard: UIStoryboard {
        return resolve(tag: storyboardTag)
    }

    init(withRoot root: RootCoreAssembly, systemInfrastructure: SystemInfrastructureAssembly) {
        super.init(withRoot: root)
        container.register(.singleton, tag: storyboardTag) { UIStoryboard(name: self.storyboardTag, bundle: $0) }
        bootstrap()
    }
}
