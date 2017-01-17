//
//  ViewController.swift
//  lbelvale2016
//
//  Created by lbelvalle on 10/13/2016.
//  Copyright (c) 2016 lbelvalle. All rights reserved.
//

import UIKit
import lbelvale2016

class ViewController: UIViewController {

    let articleManager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let art1 = articleManager.newArticle()
        art1.title = "article 1"
        art1.content = "blabla"
        art1.language = "fr"
        let art2 = articleManager.newArticle()
        art2.title = "article 2"
        art2.content = "blabla"
        art2.language = "en"
        articleManager.save()
        let frart = articleManager.getArticles(withLang: "en")
        print("fr article")
        print(frart)
        print("\n\n")
        let art1bis = articleManager.getArticles(containString: "article 1")
        print("contain with string")
        print(art1bis)
        print("\n\n")
        print("allArticle")
        let ret = articleManager.getAllArticles()
        for article in ret {
            print(article)
        }
        print("\n\n")
        print("remove 1 article + allArticle")
        articleManager.removeArticle(ret.first!)
        let ret2 = articleManager.getAllArticles()
        for none in ret2 {
            print(none)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

