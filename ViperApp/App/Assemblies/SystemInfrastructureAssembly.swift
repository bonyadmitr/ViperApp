//
//  SystemInfrastructureAssembly.swift
//  ViperApp
//
//  Created by Bondar Yaroslav on 20/09/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import DipApplication

final class SystemInfrastructureAssembly: BaseCoreAssembly {
    
    override init(withRoot collaborator: RootCoreAssembly) {
        super.init(withRoot: collaborator)
        container.register(.eagerSingleton) { UIWindow(frame: UIScreen.main.bounds) }
        container.register(.eagerSingleton) { Bundle.main }
//        container.register(.eagerSingleton) { UserDefaults.standard }
    }
}
