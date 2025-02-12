//
//  EVReflectionNumbersTests.swift
//  EVReflection
//
//  Created by Edwin Vermeer on 11/26/15.
//  Copyright © 2015 evict. All rights reserved.
//


import XCTest
@testable import EVReflection

/**
 Testing EVReflection
 */
class EVReflectionNumbersTests: XCTestCase {
    
    /**
     For now nothing to setUp
     */
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        EVReflectionClass.setBundleIdentifier(TestObject.self)
    }
    
    /**
     For now nothing to tearDown
     */
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    /**
     Test the conversion from string to number and from number to string
     */
    func testTypeDict() {
        let i: Int32 = 1
        let s: String = "2"
        let dictOriginal: NSMutableDictionary = NSMutableDictionary()
        dictOriginal.setValue(s, forKey: "myInt")
        dictOriginal.setValue(NSNumber(value: i as Int32), forKey: "myString")
        let a = TestObject4(dictionary: dictOriginal)
        XCTAssertEqual(a.myString, "1", "myString should contain 1")
        XCTAssertEqual(a.myInt, 2, "myInt should contain 2")
    }
    
    func testTypeDictAllString() {
        let dict = ["myString":"1", "myInt":"2", "myFloat":"2.1", "myBool":"1", "myNSNumber":"bogus"]
        let a = TestObject4(dictionary: dict as NSDictionary)
        XCTAssertEqual(a.myString, "1", "myString should contain 1")
        XCTAssertEqual(a.myInt, 2, "myInt should contain 2")
        XCTAssertEqual(a.myFloat, 2.1, "myFloat should contain 2.1")
        XCTAssertEqual(a.myBool, true, "myBool should contain true")
        XCTAssertEqual(a.myNSNumber, 0, "myNSNumber should contain 2")
    }
    
    func testTypeDict2AllNumeric() {
        let dict = ["myString":1, "myInt":2, "myFloat":2.1, "myBool":1]
        let a = TestObject4(dictionary: dict as NSDictionary)
        XCTAssertEqual(a.myString, "1", "myString should contain 1")
        XCTAssertEqual(a.myInt, 2, "myInt should contain 2")
        XCTAssertEqual(a.myFloat, 2.1, "myFloat should contain 2.1")
        XCTAssertEqual(a.myBool, true, "myBool should contain true")
    }
    
    func testObjectWithArray() {
        let json = "{\"myString\":\"str\", \"list\":[{\"myString\":\"str1\"}]}"
        let a = TestObject4(json: json)
        XCTAssertEqual(a.myString, "str", "myString should be str")
        XCTAssertEqual(a.list.count, 1, "We should have 1 item in the list")
        
        let json2 = "{\"myString\":\"str\", \"list\":[{\"myString\":\"str1\"}]}"
        let b = TestObject4(json: json2)
        XCTAssertEqual(b.myString, "str", "myString should be str")
        XCTAssertEqual(b.list.count, 1, "We should have 1 item in the list")
    }
    
    
    /**
     Test various large number conversions to NSNumber
     */
    func testNSNumber() {
        let test1 = NSNumber(value: Double(Int.max) as Double)
        let (value1, _, _) = EVReflectionClass.valueForAny("", key: "", anyValue: test1)
        XCTAssert(value1 as? NSNumber == NSNumber(value: Double(Int.max) as Double), "Values should be same for type NSNumber")
        
        let test2: Float = 458347970560
        let (value2, _, _) = EVReflectionClass.valueForAny("", key: "", anyValue: test2)
        XCTAssert(value2 as? NSNumber == NSNumber(value: 458347970560 as Float), "Values should be same for type Float")
        
        let test3: Double = 458347970560
        let (value3, _, _) = EVReflectionClass.valueForAny("", key: "", anyValue: test3)
        XCTAssert(value3 as? NSNumber == NSNumber(value: 458347970560 as Double), "Values should be same for type Double")
        
        let test4: Int64 = Int64.max
        let (value4, _, _) = EVReflectionClass.valueForAny("", key: "", anyValue: test4)
        XCTAssert(value4 as? NSNumber == NSNumber(value: Int64.max as Int64), "Values should be same for type Int64")
        
        let test5: Int32 = Int32.max
        let (value5, _, _) = EVReflectionClass.valueForAny("", key: "", anyValue: test5)
        XCTAssert(value5 as? NSNumber == NSNumber(value: Int32.max as Int32), "Values should be same for type Int32")
        
        let test6: Int = Int.max
        let (value6, _, _) = EVReflectionClass.valueForAny("", key: "", anyValue: test6)
        XCTAssert(value6 as? NSNumber == NSNumber(value: Int.max as Int), "Values should be same for type Int64")
    }
}
