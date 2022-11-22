//
//  User.swift
//  homeWork2.6
//
//  Created by Алексей Исаев on 22.11.2022.
//

struct User {
    
    let login: String
    let password: String
    
    let person: Person
}

struct Person {
    let name: String
    let surname: String
    let birthday: String
    let work: String
    let hobby: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension User {
    
    static func getUser() -> User {
        
        User(
            login: "User",
            password: "Password",
            person: .init(
                name: "Alexey",
                surname: "Isaev",
                birthday: "03.03.1991",
                work: "NLMK",
                hobby: "football")
            )
    }
}
