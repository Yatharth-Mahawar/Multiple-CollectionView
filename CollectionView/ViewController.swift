//
//  ViewController.swift
//  CollectionView
//
//  Created by Yatharth Mahawar on 1/27/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var frontCollectionView: UICollectionView!
    var arrData:[UIImage] = [#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1")]
    var arrData2:[UIImage] = [#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectioView {
            return arrData.count
        }
        else {
            return arrData2.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        if collectionView == self.collectioView {
            cell.cellImg.image = arrData[indexPath.row]
            
        }
        else {
            cell.cellImg.image = arrData2[indexPath.row]
            
        }
        return cell
    }


}

extension ViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectioView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        else {
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let imageInfo = GSImageInfo(image: arrData[indexPath.row], imageMode: .aspectFit)
            let transitionInfo = GSTransitionInfo(fromView: collectionView)
            let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
            present(imageViewer, animated: true, completion: nil)
    
}

}
