//
//  SceneDelegate.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let vc1 = MainViewController()
        let vc2 = EditViewController()
        let vc3 = CollectionViewController()
        let vc4 = ReoderingViewController()
        let vc5 = SeriesOnViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        let tab = UITabBarController()
        tab.viewControllers = [nav1, nav2, nav3, nav4, nav5]
        tab.selectedIndex = 4
        
        nav1.tabBarItem.title = "T/C"
        nav1.tabBarItem.image = UIImage(systemName: "house")

        nav2.tabBarItem.title = "T"
        nav2.tabBarItem.image = UIImage(systemName: "house")
        
        nav3.tabBarItem.title = "C1"
        nav3.tabBarItem.image = UIImage(systemName: "house")
        
        nav4.tabBarItem.title = "C2"
        nav4.tabBarItem.image = UIImage(systemName: "house")
        
        nav5.tabBarItem.title = "C3"
        nav5.tabBarItem.image = UIImage(systemName: "house")
        
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

