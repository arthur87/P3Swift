//
//  P3.swift
//  P3
//
//  Created by asakawa on 2015/05/15.
//  Copyright (c) 2015 asakawa. All rights reserved.
//

import Foundation

class P3: NSObject {
    static let p = P3()

    enum P3_LOG_LEVEL: String {
        case Default = "0"
        case Error = "1"
        case Warn = "2"
        case Info = "3"
    }

    private var url = "http://localhost:3000/api"
    private var enable = true

    func url(url: String) {
        self.url = url
    }

    func enable(enable: Bool) {
        self.enable = enable
    }

    func p(object: AnyObject) {
        self.sendRequest(object, title: "", level: .Default)
    }

    func p(object: AnyObject, title: String) {
        self.sendRequest(object, title: title, level: .Default)
    }

    func error(object: AnyObject) {
        self.sendRequest(object, title: "", level: .Error)
    }

    func error(object: AnyObject, title: String) {
        self.sendRequest(object, title: title, level: .Error)
    }

    func warn(object: AnyObject) {
        self.sendRequest(object, title: "", level: .Warn)
    }

    func warn(object: AnyObject, title: String) {
        self.sendRequest(object, title: title, level: .Warn)
    }

    func info(object: AnyObject) {
        self.sendRequest(object, title: "", level: .Info)
    }

    func info(object: AnyObject, title: String) {
        self.sendRequest(object, title: title, level: .Info)
    }

    private func sendRequest(object: AnyObject, title: String, level: P3_LOG_LEVEL) {
        if self.enable == false {
            return
        }

        let request = NSMutableURLRequest(URL: NSURL(string: self.url)!)
        let createdAt = NSDate().dateByAddingTimeInterval(0)
        let description = object.description

        let params = [
            "created_at": createdAt.description,
            "title": title,
            "description": description,
            "level": level.rawValue
        ] as Dictionary<String, String>

        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: nil)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) in


        }
    }
}

typealias p = P3
