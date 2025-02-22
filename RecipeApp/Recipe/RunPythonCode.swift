//
//  RunPythonCode.swift
//  Recipe App
//
//  Created by Annie Z on 2/22/25.
//

import Foundation
import PythonKit

//need to get the user info


func runPythonCode(preferences: [String: Any]) -> Void{
    let sys = Python.import("sys")
    sys.path.append("~/Users/annie/Downloads/Hackathon/Hackathon/Recipe App/App/Recipe/")
    let file = Python.import("backend")
    //output will be a json file of the text
    //change the preferences dict into a json string
    guard let preferencesJSON = try? JSONSerialization.data(withJSONObject:preferences) else {
            print("Error when converting preferences to JSON string")
        return
        }
    
    //need to use url and respond to request from backend
    guard let backendUrl = URL(string:"http://localhost:10005/generate_recipe") else {
        print("URL is invalid")
        return
    }
    
    //need to send the right info through POST to request
    var request = URLRequest(url: backendUrl)
    
    request.httpMethod = "POST"
    
    request.httpBody = preferencesJSON

    let session = URLSession.shared
    session.dataTask(with:request){(data, response, error) in
        print(String(data: data!, encoding: .utf8)!)
    }.resume()
    
    //can add the other part to change to json string
    //let response = file.getRecipe()
    //print(response)
    //return response
}

