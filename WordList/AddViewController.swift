//
//  AddViewController.swift
//  WordList
//
//  Created by Yu Kono on 2021/05/14.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField:UITextField!
    @IBOutlet var japaneseTextField:UITextField!

    var wordArray: [Dictionary<String,String>] = []
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配列を読み込んで起動
        if saveData.array(forKey:"WORD") != nil {
            wordArray = saveData.array(forKey: "WORD")as![Dictionary<String,String>]
        }
    }
    //保存ボタンが押された時
    @IBAction func seveWord(){
        //wordDictionaryに値を入れる
        let wordDictionary = ["english" : englishTextField.text!,
                              "japanese" : japaneseTextField.text!]
        //辞書を配列に追加する
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
        title:"保存完了",
        message: "単語の登録が完了しました",
        preferredStyle : .alert
        )
        alert.addAction(UIAlertAction(
                            title:"OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    }

   

}
