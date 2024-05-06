//
//  help.swift
//  nodefree
//
//  Created by 刘东旭 on 2024/4/14.
//

import Foundation

public class Help {
    var type: Int = 0
    public init(type: Int) {
        self.type = type
    }
    public func HomeDir() -> String {
        return NSHomeDirectory()
    }

    public func ClashDir() -> String {
        return NSHomeDirectory() + "/.config/clash/nodefree.yaml"
    }
    
    public func ClashUrlString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
         
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: currentDate)
         
        let year = components.year
        let month = components.month
        let day = components.day

        let mm = month! < 10 ? "0\(month!)":"\(month!)"
        let dd = day! < 10 ? "0\(day!)":"\(day!)"
        switch self.type {
        case 0:
            return "https://clashgithub.com/wp-content/uploads/rss/\(year!)"+mm+dd+".yml"
        case 1:
            return "https://nodefree.org/dy/\(year!)/"+mm+"/"+"/\(year!)"+mm+dd+".yaml"
        default:
            return "https://nodefree.org/dy/\(year!)/"+mm+"/"+"/\(year!)"+mm+dd+".yaml"
        }
        
    }
}
