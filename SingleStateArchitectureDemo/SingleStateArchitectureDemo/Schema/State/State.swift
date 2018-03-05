//
//  State.swift
//  SingleStateArchitectureDemo
//
//  Created by Anthony Uccello on 2018-01-03.
//  Copyright © 2018 Anthony Uccello. All rights reserved.
//

import Foundation
import UIKit

class State
{    
    static var App:S_App!
    
    static func Initialize()
    {
        LoadState()
    }
    
    static func LoadState()
    {
        let file = "save.txt"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //reading
            do
            {
                let data = try Data(contentsOf: fileURL)
                deseralizeState(data: data)
            }
            catch
            {
                print("Load Error:")
                State.App = S_App()
            }
        }
    }
    
    private static func deseralizeState(data:Data?)
    {
        print("Deserializing")
        
        if (data == nil)
        {
            print("Bad data")
            return
        }
        
        let jsonDecoder = JSONDecoder()
        do
        {
            let serialziedState = try jsonDecoder.decode(SerializedState.self, from: data!)
            App = S_App()
            App.selectProduct = S_SelectProduct(shoeModels: MM_TypeToShoe.GetAll())
            App.selectProduct.savedSelection = serialziedState.savedProductSelection
            print("Loaded state with \(serialziedState.savedProductSelection.color) and size: \(serialziedState.savedProductSelection.size) and model: \(serialziedState.savedProductSelection.model)")
        } catch
        {
            print("Could not load")
            State.App = S_App()
            State.App.selectProduct = S_SelectProduct(shoeModels: MM_TypeToShoe.GetAll())
        }

    }
    
    static func SaveState()
    {
        let file = "save.txt"
        
        var state = SerializedState()
        state.savedProductSelection = State.App.selectProduct.savedSelection
        
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(state)
        print("Save data is \(data)")
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            do {
                try data.write(to: fileURL)
                print("State Saved")
            }
            catch {
                print("Error reading state")
            }
        }
    }
}
