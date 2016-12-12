//
//  PageViewController.swift
//  Photoshare
//
//  Created by André da Silva on 12/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var VCarr: [UIViewController] = {
        return [self.VCInstance(name: "MapView"), self.VCInstance(name: "OptionsView"), self.VCInstance(name: "CameraView")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let MapView = VCarr.first {
            setViewControllers([MapView], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCarr.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return VCarr.last
        }
        
        guard VCarr.count > previousIndex else {
            return nil
        }
        
        return VCarr[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCarr.index(of: viewController) else {
            return nil
        }
    
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCarr.count else {
            return VCarr.first
        }
        
        guard VCarr.count > nextIndex else {
            return nil
        }
        
        return VCarr[nextIndex]
    }

    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCarr.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCarr.index(of: firstViewController) else {
            return 0
        }
        return firstViewControllerIndex
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}