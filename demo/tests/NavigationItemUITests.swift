/*
 *  Copyright (c) 2016 Spotify AB.
 *
 *  Licensed to the Apache Software Foundation (ASF) under one
 *  or more contributor license agreements.  See the NOTICE file
 *  distributed with this work for additional information
 *  regarding copyright ownership.  The ASF licenses this file
 *  to you under the Apache License, Version 2.0 (the
 *  "License"); you may not use this file except in compliance
 *  with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

import XCTest

class NavigationItemUITests: UITestCase {
    func testRightBarButtonItem() {
        let app = XCUIApplication()

        // Tap "Todo list" and make sure we navigate to that page.
        app.collectionViews["collectionView"].staticTexts["Todo list"].tap()
        XCTAssertTrue(app.navigationBars["Todo List"].exists)

        // Make sure the "Add" button is tappable, and that an action is fired from it.
        let alert = app.alerts["Add an item"]
        XCTAssertFalse(alert.exists)
        app.navigationBars["Todo List"].buttons["Add"].tap()
        XCTAssertTrue(alert.exists)

        // Dismiss the alert
        alert.buttons["Cancel"].tap()
        XCTAssertFalse(alert.exists)
    }
}
