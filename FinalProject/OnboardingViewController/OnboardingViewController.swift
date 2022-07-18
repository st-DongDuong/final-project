//
//  OnboardingViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/16/22.
//

import UIKit
class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var viewModel: OnboardingViewModel = OnboardingViewModel()
    var indexNumber: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        setupPageControl()
    }
    private func setupPageControl() {
        pageControl.numberOfPages = viewModel.numberPage()
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(2)
    }
    @IBAction func nextButton(_ sender: Any) {
        guard var currentIndex = collectionView.indexPathsForVisibleItems.first else { return }
        print(currentIndex)
        currentIndex.item += 1 // tn
        if currentIndex.item  < viewModel.numberPage() { // khi < số lương page
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.collectionView.scrollToItem(at: currentIndex, at: .centeredHorizontally, animated: true)
            }
        }
    }
    @IBAction func skipButtonTouchUpInside(_ sender: Any) {
        // TODO: Move register
    }
    func configureCollection() {
        let cellNib = UINib(nibName: "OnboardingCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "OnboardingCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
    }
}
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell",
                                                            for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        cell.updateOnboardingCell(data: viewModel.dataForItems(at: indexPath))
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // chạy nut theo page
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
