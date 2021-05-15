//
//  QuesrionViewController.swift
//  WordList
//
//  Created by Yu Kono on 2021/05/14.
//

import UIKit

class QuesrionViewController: UIViewController {
    
    //パーツ
    @IBOutlet var answerLabel : UILabel!
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var nextButton : UIButton!
    //回答したか・次の質問に行くかの判定
    var inAnswered : Bool = false
    //Userdefaultから取る配列
    var WordArray:[Dictionary<String,String>]=[]
    //現在の回答数
    var nowNumber : Int = 0
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        WordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        //問題のシャッフル
        WordArray.shuffle()
        questionLabel.text = WordArray[nowNumber]["english"]
    }

    @IBAction func nextButtonTapped () {
        //回答したか
        if inAnswered{
            //回答していたら次の問題へ
            nowNumber += 1
                answerLabel.text = ""
            
            //次の問題を表示するかどうか(もしnowNumberより単語収録数の方が多かったら)
            if nowNumber < WordArray.count{
                //次の問題を表示できる
                questionLabel.text = WordArray[nowNumber]["english"]
                //isAnsweredをfalseにする
                inAnswered = false
                //ボタンタイトルの変更
                nextButton.setTitle("答えを表示", for: .normal)
            }//もしもう単語のストックがなかったら
            else  {nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil )
               }
        }else {//答えを出す
                answerLabel.text = WordArray[nowNumber]["japanese"]
                //inAnsweredをtrueに
                inAnswered = true
                //ボタンのタイトルを変更
            nextButton.setTitle("次へ", for:.normal)
            }
            
        }
}

