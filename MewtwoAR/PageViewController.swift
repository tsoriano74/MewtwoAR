//
//  PageViewController.swift
//  MewtwoAR
//
//  Created by Naomi Baudoin on 11.05.20.
//  Copyright © 2020 Abrège. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    // MARK: - Properties


    // MARK: - IBOutlets


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
    }
    

    // MARK: - Set Up


    // MARK: - IBActions


    // MARK: - Navigation


    // MARK: - Network Manager calls


    // MARK: - Extensions
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }

}
