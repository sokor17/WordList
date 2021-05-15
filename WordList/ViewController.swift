//
//  ViewController.swift
//  WordList
//
//  Created by Yu Kono on 2021/05/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //最初に戻ってくるためのメソッド
    @IBAction func back (sender:UIStoryboardSegue){
        
    }

    //スタートボタンを押した時の処理
    @IBAction func startButtonTapped(){
        //定義
        let saveData=UserDefaults.standard
        //分岐
        if saveData.array(forKey: "WORD") != nil {
            //もし配列(単語登録)があったら
            if saveData.array(forKey: "WORD")!.count > 0{
                performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        } else {
            //もし配列(単語登録)がなかったら
            let alert = UIAlertController(
                title:"単語",
                message: "まずは「単語一覧」をタップして単語登録してください",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                                title:"OK",
                                style: .default,
                handler: nil
            ))
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    
    
}

