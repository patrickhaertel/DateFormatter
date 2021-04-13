//
//  TimeSincePost.swift
//  GoogleSignInTest
//
//  Created by Patrick Haertel on 11/24/20.
//

import Foundation

class TimeSincePost: NSObject {
    func getTimeSince(dateString: String) -> String {
        let publishedDate = dateString
        
        let userCalendar = Calendar.current

        let timeSince = userCalendar.dateComponents([.year, .day, .hour, .minute, .second], from: getDateFrom(date: publishedDate), to: Date())

        var timeSinceString: String

        if timeSince.year != 0 {
            timeSinceString = "\(timeSince.year!) yrs ago"
        } else if timeSince.day != 0 {
            timeSinceString = "\(timeSince.day!) days ago"
        } else if timeSince.hour != 0 {
            timeSinceString = "\(timeSince.hour!) hrs ago"
        } else if timeSince.minute != 0 {
            timeSinceString = "\(timeSince.minute!) mins ago"
        } else if timeSince.second != 0 {
            timeSinceString = "\(timeSince.second!) secs ago"
        } else {
            timeSinceString = "0"
        }
        
        return timeSinceString
    }
    
    func getDateFrom(date: String) -> Date {
        var finalDate = Date()
        
        let seperators = CharacterSet(charactersIn: "-T:Z")
        let seperatedDate : [String] = date.components(separatedBy: seperators)
        
        var dateComponents = DateComponents()
        dateComponents.year = Int(seperatedDate[0])
        dateComponents.month = Int(seperatedDate[1])
        dateComponents.day = Int(seperatedDate[2])
        dateComponents.hour = Int(seperatedDate[3])
        dateComponents.minute = Int(seperatedDate[4])
        dateComponents.second = Int(seperatedDate[5])
        dateComponents.timeZone = TimeZone(abbreviation: "GMT")
        
        let userCalendar = Calendar.current
        finalDate = userCalendar.date(from: dateComponents)!
        
        return finalDate
    }

}
