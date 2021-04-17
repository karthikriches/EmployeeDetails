//
//  DBManager.swift
//  Employee
//
//  Created by Karthik on 15/04/21.
//

import UIKit
import CoreData

class DBManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let shared = DBManager()
    
    private init() {
        
    }
    
    func createData(user:User) {
        let entity = UserEntity(context:context)
        entity.firstName =  user.firstname
        entity.lastName   = user.lastname
        entity.age =  user.age
        entity.address = user.address
        entity.birthday = user.birthday
        entity.contactperson = user.contactperson
        entity.email = user.email
        entity.cpmobileno = user.cpmobileno
        entity.id = Int32(user.id)
    
        do  {
           try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readData()->[User]{
        let request : NSFetchRequest = UserEntity.fetchRequest()
        var users =  [User]()
        do {
            let data = try context.fetch(request)
            for i in data {
                let firstname = i.value(forKey: "firstName") as! String
                let lastName = i.value(forKey: "lastName") as! String
                let age = i.value(forKey: "age") as! String
                let address = i.value(forKey: "address") as! String
                let birthday = i.value(forKey: "birthday") as! String
                let contactperson = i.value(forKey: "contactperson") as! String
                let email = i.value(forKey: "email") as! String
                let cpmobileno = i.value(forKey: "cpmobileno") as! String
                let id = i.value(forKey: "id") as! Int
                let user = User(id: id, firstname: firstname, lastname: lastName, birthday: birthday, age: age, email: email, mobileno: cpmobileno, address: address, contactperson: contactperson, cpmobileno: cpmobileno)
                users.append(user)
            }
        } catch  {
            
        }
    return users

    }
    
}
