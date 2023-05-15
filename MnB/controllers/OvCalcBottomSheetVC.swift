//
//  OvCalcBottomSheetVC.swift
//  MnB
//
//  Created by Morris Murega on 2/27/23.
//

import Foundation
import UIKit
import EventKit
import KDCalendar
class OlvCalcBottomSheetVC : UIViewController{
    @IBOutlet weak var calendarView: CalendarView!
    @IBOutlet weak var selected : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        self.navigationItem.title = "Ovulation Calculator"
        self.navigationItem.titleView?.tintColor = .blue
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        let today = Date()
    
        self.calendarView.selectDate(today)
        self.calendarView.setDisplayDate(today)
        
    }

}

extension OlvCalcBottomSheetVC{
    func setupStyle(){
        let style = CalendarView.Style()
        
        
        style.cellShape                = .bevel(8.0)
        style.cellColorDefault         = UIColor.clear
        style.cellColorToday           = UIColor(red:1.00, green:0.84, blue:0.64, alpha:1.00)
        style.cellSelectedBorderColor  = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        style.headerTextColor          = UIColor.blue
        
        style.cellTextColorDefault     = UIColor(red: 249/255, green: 180/255, blue: 139/255, alpha: 1.0)
        style.cellTextColorToday       = UIColor.orange
        style.cellTextColorWeekend     = UIColor(red: 237/255, green: 103/255, blue: 73/255, alpha: 1.0)
        style.cellColorOutOfRange      = UIColor(red: 249/255, green: 226/255, blue: 212/255, alpha: 1.0)
        
        style.headerBackgroundColor    = UIColor.white
        style.weekdaysBackgroundColor  = UIColor.white
        style.firstWeekday             = .sunday
        
        style.locale = Locale(identifier: "en_US")
        
        style.cellFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.headerFont = UIFont(name: "Helvetica", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
        style.weekdaysFont = UIFont(name: "Helvetica", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        
        calendarView.style = style
        calendarView.direction = .horizontal
        calendarView.multipleSelectionEnable = false
        calendarView.marksWeekends = true
    
        
        calendarView.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0)
    }
}


extension OlvCalcBottomSheetVC: CalendarViewDataSource {
    func headerString(_ date: Date) -> String? {
        return "Select the last day of your period"
    }
    
    
      func startDate() -> Date {
          
          var dateComponents = DateComponents()
          dateComponents.month = -1
          
          let today = Date()
          
          let threeMonthsAgo = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
          
          return threeMonthsAgo
      }
      
      func endDate() -> Date {
          
          var dateComponents = DateComponents()
        
          dateComponents.month = 12
          let today = Date()
          
          let twoYearsFromNow = self.calendarView.calendar.date(byAdding: dateComponents, to: today)!
          
          return twoYearsFromNow
    
      }
    
}

extension OlvCalcBottomSheetVC: CalendarViewDelegate {
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
        print("On Scrol: \(date)")
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
        print("Did Select: \(date)")
        self.selected.text = "\(date)"
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    
    func calendar(_ calendar: CalendarView, didSelectDate date : Date, withEvents events: [CalendarEvent]) {
           print("Did Select: \(date) with \(events.count) events")
           self.selected.text = "\(date)"
       }

       func calendar(_ calendar: CalendarView, didLongPressDate date : Date, withEvents events: [CalendarEvent]?) {
              print("No Actions")
       }
    
}


