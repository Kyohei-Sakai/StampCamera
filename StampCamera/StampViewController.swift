//
//  StampViewController.swift
//  StampCamera
//
//  Created by 酒井恭平 on 2016/07/09.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

//import Cocoa
import UIKit

class StampViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //画像を格納する配列
    var imageArray:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配列imageArrayに1~6.pngの画像データを格納
        for i in 1...6{
            imageArray.append(UIImage(named: "\(i).png")!)
            
        }
        
    }
    
    //コレクションビューのアイテム数を設定
    private func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //戻り値にimageArrayの要素数を設定
        return imageArray.count
        
    }
    
    //コレクションビューのセルを設定
    private func collectionView(collectioView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //UICollectionViewCellを使うための変数を作成
        let cell = collectioView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        //セルの中の画像を表示するImageViewのタグを指定
        let imageView = cell.viewWithTag(1) as! UIImageView
        //セルの中のImage Viewに配列の中の画像データを表示
        imageView.image = imageArray[indexPath.row]
        //設定したセルを戻り値に設定する
        return cell
        
    }
    
    //スタンプ選択画面を閉じるメソッド
    @IBAction func closeTapped(){
        
        //モーダルで表示した画面を閉じる
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //コレクションビューのセルが選択された時のメソッド
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        //Stampインスタンスを作成
        let stamp = Stamp()
        //stampにインデックスパスからスタンプ画像を設定
        stamp.image = imageArray[indexPath.row]
        //AppDelegateのインスタンスを取得
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //配列stampArrayにstampを追加
        appDelegate.stampArray.append(stamp)
        //新規スタンプ追加フラグをtrueに設定
        appDelegate.isNewStampAdded = true
        //スタンプ選択画面を閉じる
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    
}

