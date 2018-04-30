//
//  ViewController.swift
//  ESP32_Websocket
//
//  Created by Maxwell on 30/4/18.
//  Copyright © 2018 UoM. All rights reserved.
//

import UIKit
import Starscream

class ViewController: UIViewController, WebSocketDelegate{
    func websocketDidConnect(socket: WebSocket) {
         print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocket is disconnected: \(String(describing: error?.localizedDescription))")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("get text from esp32: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("get data from esp32: \(data.count)")
    }
    
    var socket = WebSocket(url: URL(string: "http://192.168.4.1/")!)
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        socket.delegate = self
        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMessage(_ sender: Any) {
         socket.write(string: String(i))
        i = i + 1
    }
    
}

