//
//  OnboardingView.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/16/22.
//

import UIKit

class WeatherViewController: ParentView {
       
    var viewModel: OnboardingViewModel = OnboardingViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
        setupPageControl()
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = viewModel.numberPage()
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(2)
        guard var currentIndex = collectionView.indexPathsForVisibleItems.first else { return }
        print(currentIndex)
        currentIndex.item += 1 // tn
        if currentIndex.item  < viewModel.numberOfSection() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    func configureCollection() {
        let cellNib = UINib(nibName: "OnboardingCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "OnboardingCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
    }
    
}

extension WeatherViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        
        cell.updateOnboardingCell(data: viewModel.dataForItems(at: indexPath))
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {  //chạy nut theo page
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height:collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
}
