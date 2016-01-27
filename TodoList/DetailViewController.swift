//
//  DetailViewController.swift
//  TodoList
//
//  Created by Suriel.S on 3/29/15.
//  Copyright (c) 2015 ShallowSleep. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var haveFunButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo: TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoItem.delegate = self
        
        //EditTodo view
        if todo == nil {
            //navigationController?.title = "New Item" -------------no effect!!!!
            haveFunButton.selected = true
        } else {
            //navigationController?.title = "Edit Item" ------------no effect!!!!
            if todo?.image == "havefun-selected" {
                haveFunButton.selected = true
            } else if todo?.image == "shopping-selected" {
                shoppingButton.selected = true
            } else if todo?.image == "contact-selected" {
                contactButton.selected = true
            } else if todo?.image == "business-selected" {
                businessButton.selected = true
            }
            
            todoItem.text = todo?.title
            todoDate.date = (todo?.date)! //todoDate.setDate -------same effect??????
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func resetAllButton(){
        haveFunButton.selected = false
        shoppingButton.selected = false
        contactButton.selected = false
        businessButton.selected = false
    }
    @IBAction func haveFunTapped(sender: AnyObject) {
        resetAllButton()
        haveFunButton.selected = true
    }
    @IBAction func shoppingTapped(sender: AnyObject) {
        resetAllButton()
        shoppingButton.selected = true
    }
    @IBAction func contactTapped(sender: AnyObject) {
        resetAllButton()
        contactButton.selected = true
    }
    @IBAction func businessTapped(sender: AnyObject) {
        resetAllButton()
        businessButton.selected = true
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        //save data
        var image = ""
        if haveFunButton.selected {
            image = "havefun-selected"
        }else if shoppingButton.selected {
            image = "shopping-selected"
        }else if contactButton.selected {
            image = "contact-selected"
        }else if businessButton.selected {
            image = "business-selected"
        }
        let uuid = NSUUID().UUIDString
        
        if todo == nil {
            todo = TodoModel(id: uuid, image: image, title: todoItem.text, date: todoDate.date)
            todos.append(todo!)
        } else {
            todo?.image = image
            todo?.title = todoItem.text
            todo?.date = todoDate.date
        }
        

    }
 

    //MARK-UITextFieldDelegate
    //dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        todoItem.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
