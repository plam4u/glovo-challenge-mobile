//
//  AppCoordinator.swift
//  GlovoMaps
//
//  Created by Andrés Pizá Bückmann on 09/02/2019.
//  Copyright © 2019 Andrés Pizá Bückmann. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let coordinator = CheckLocationPermissionsCoordinator(window: window, delegate: self)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    func finish() {}

    private func showMap() {
        // TODO
    }

    private func showCityList() {
        let coordinator = CityListCoordinator()
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

protocol AppCoordinatorDelegate: class {
    func didGetLocationPermissions(from coordinator: Coordinator)
    func didSelectCityList(from coordinator: Coordinator)
}

extension AppCoordinator: AppCoordinatorDelegate {
    func didGetLocationPermissions(from coordinator: Coordinator) {
        removeChildCoordinator(coordinator)
        showMap()
    }

    func didSelectCityList(from coordinator: Coordinator) {
        removeChildCoordinator(coordinator)
        showCityList()
    }
}
