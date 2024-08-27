//
//  ConvertedInSDKModule.swift
//  ConvertedInSDKRN
//
//  Created by Minh Vo on 23/8/24.
//
import ConvertedinMobileSDK
@objc(ConvertedInSDKModule)
class ConvertedInSDKModule: NSObject {

 @objc(addEvent:location:date:)
 func addEvent(_ name: String, location: String, date: NSNumber) -> Void {
   // Date is ready to use!
 }
  
  @objc
  func initializeSDK(_ pixelId: String, storeUrl: String) {
      print("🚀 initializeSDK with pixelId: \(pixelId) and storeUrl: \(storeUrl)")
      ConvertedinMobileSDK.configure(pixelId: pixelId, storeUrl: storeUrl)
  }
  
  @objc
  func identifyUser(_ email: String, countryCode: String, phone: String) {
    print("🚀 Converted identifyUser email: \(email)")
    print("🚀 Converted identifyUser countryCode: \(countryCode)")
    print("🚀 Converted identifyUser phone: \(phone)")
    ConvertedinMobileSDK.identifyUser(email: email, countryCode: countryCode, phone: phone)
  }
  
  @objc
  func registerEvent() {
    print("🚀 Converted registerEvent ")
    ConvertedinMobileSDK.registerEvent()
  }
  
  @objc
  func viewContentEvent(_ currency: String, total: NSNumber, products: [[String: Any]]) {
    print("🚀 Converted Products viewContentEvent:")
    let convertedProducts = products.map { productDict in
        ConvertedinMobileSDK.ConvertedinProduct(
            id: productDict["id"] as? Int,
            quantity: productDict["quantity"] as? Int,
            name: productDict["name"] as? String
        )
    }
    print("🚀 Converted Products viewContentEvent: \(convertedProducts) \(total.intValue)")
    
    ConvertedinMobileSDK.viewContentEvent(currency: currency, total: total.intValue, products: convertedProducts)
  }
  
  @objc
  func addToCartEvent(_ currency: String, total: NSNumber, products: [[String: Any]]) {
    let convertedProducts = products.map { productDict in
        ConvertedinMobileSDK.ConvertedinProduct(
            id: productDict["id"] as? Int,
            quantity: productDict["quantity"] as? Int,
            name: productDict["name"] as? String
        )
    }
    print("🚀 Converted Products addToCartEvent: \(convertedProducts) \(total.intValue)")
    
    ConvertedinMobileSDK.addToCartEvent(currency: currency, total: total.intValue, products: convertedProducts)
  }
  
  @objc
  func initiateCheckoutEvent(_ currency: String, total: NSNumber, products: [[String: Any]]) {
    let convertedProducts = products.map { productDict in
        ConvertedinMobileSDK.ConvertedinProduct(
            id: productDict["id"] as? Int,
            quantity: productDict["quantity"] as? Int,
            name: productDict["name"] as? String
        )
    }
    print("🚀 Converted Products initiateCheckoutEvent: \(convertedProducts)")
    print("🚀 Converted Products initiateCheckoutEvent total.intValue: \(total.intValue)")
    
    ConvertedinMobileSDK.initiateCheckoutEvent(currency: currency, total: total.intValue, products: convertedProducts)
  }
  
  @objc
  func purchaseEvent(_ currency: String, total: NSNumber, products: [[String: Any]]) {
    let convertedProducts = products.map { productDict in
        ConvertedinMobileSDK.ConvertedinProduct(
            id: productDict["id"] as? Int,
            quantity: productDict["quantity"] as? Int,
            name: productDict["name"] as? String
        )
    }
    print("🚀 Converted Products purchaseEvent: \(convertedProducts) \(total.intValue)")
    
    ConvertedinMobileSDK.purchaseEvent(currency: currency, total: total.intValue, products: convertedProducts)
  }
}
