//
//  Constants.swift
//  MnB
//
//  Created by MacOS on 15/05/2023.
//

import Foundation
import UIKit

struct Constants{
    
    static let DEFAULT_USER_STORE_KEY = "userInformation"
    public static let KEY_USERID = "userId"
    public static let KEY_USER_PASS = "user_pass"
    public static let KEY_USER_NAME = "name"
    public static let KEY_EMAIL = "email"
    public static let KEY_PHONE = "phone"
    public static let KEY_USER_FIRST_NAME = "user_fname"
    public static let KEY_USER_LAST_NAME = "user_lname"
    public static let KEY_DB_VERSION = "db_ver"
    public static let KEY_WELCOMED = "welcomed"
    public static let KEY_QUESTINNAIRE_DONE = "questionnaire"
    public static let KEY_SIGNUP_COMPLETE = "login_done"
    public static let KEY_USER_PHOTO = "user_photo"
    public static let KEY_DEVICE_ID = "uuid"
    public static let KEY_TOKEN = "token"
    public static let KEY_PROFILE = "profile"
    public static let KEY_ACCOUNT_STATUS = "status"
    public static let KEY_IS_LOGGED_IN = "is_logged_in"
    public static let KEY_IS_TRANSACTING = "is_transacting"
    public static let DEFAULT_COUNTRY = "default_country"
    
    public static let KEY_SERVICE_ERROR = "service-error"
    public static let KEY_APPID = "appid"
    
    //API Errors
    public static let KEY_API_ERROR = "APIError - Request Failed ->"
    public static let KEY_INVALID_DATA = "Invalid Data"
    public static let KEY_RESPONSE_UNSUCCESSFUL = "APIError - Response Unsuccessful status code ->"
    public static let KEY_JSON_DECODING_ERROR = "APIError - JSON decoding Failure"
    public static let KEY_JSON_CONVERSION_ERROR = "APIError - JSON Conversion Failure ->"
    public static let KEY_DECODING_TASK_ERROR = "APIError - decodingtask failure with error ->"
    public static let KEY_PARAMETER_ENCODING_ERROR = "APIError - post parameters failure ->"
    public static let KEY_REQUEST_FAILED = "Request Failed with no response description"
   
    
    //Other Errors
    public static let KEY_CONFIG_READ_ERROR = "Config Read Error ::"
    public static let KEY_LOCATION_ERROR = "Location Error ->"
    public static let KEY_GOOGLE_PLACE_ERROR = "Google  Places Location Error ->"
    public static let KEY_APP_DELEGATE_ERROR = "SceneDelegate is not UIApplication.shared.delegate"
    public static let KEY_ROOT_CONTROLLER_ERROR = "There is no root controller"
    public static let KEY_COREDATA_PERSISTENT_STORE_ERROR = "Failed to Load Persistence Store>>>"
    
    
    //Resources
    public static let KEY_CONFIG_FILE = "config"
    public static let KEY_PLIST_FILE = "plist"
    
    //Date Formats
    public static let KEY_DEFAULT_DATEFORMATTER = "yyyy-MM-dd HH:mm:ss"
    public static let KEY_DAY_DATEFORMATTER = "EEEE, MMM d"
    
    
    //headers
    public static let KEY_CONTENT_TYPE_LABEL = "Content-Type"
    public static let KEY_CONTENT_TYPE_HEADER = "application/json"
    public static let KEY_AUTHORIZATION_LABEL = "Authorization"
    
    //colors
    public static let tint_color = UIColor(red: 25.0/255, green: 95.0/255, blue: 226.0/255, alpha: 1.0)
}
