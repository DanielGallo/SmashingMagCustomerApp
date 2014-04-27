{
    "xdsVersion": "3.0.4",
    "frameworkVersion": "touch23",
    "internals": {
        "type": "Ext.app.Controller",
        "reference": {
            "name": "items",
            "type": "array"
        },
        "codeClass": null,
        "userConfig": {
            "designer|userClassName": "CustomerController"
        },
        "cn": [
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "mainView",
                    "selector": "mainview"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "customerList",
                    "selector": "mainview list"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "customerForm",
                    "selector": "customerform"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "customerMap",
                    "selector": "customermap"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "customerDetail",
                    "selector": "customerdetail"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "addButton",
                    "selector": "button[action=Add]"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "ref": "deleteButton",
                    "selector": "customerform button[action=Delete]"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "list",
                    "designer|targetType": "CustomerList",
                    "fn": "onListItemTap",
                    "implHandler": [
                        "// Create a new instance of the CustomerDetail view, passing in a title to show on the ",
                        "// navigation view’s toolbar, plus the record object to populate the form fields",
                        "var form = Ext.create(\"Customers.view.CustomerDetail\", {",
                        "    title: record.data.Name,",
                        "    record: record",
                        "});",
                        "",
                        "// Get the navigation view (MainView) and use its \"push\" method to show the ",
                        "// CustomerDetail view on screen",
                        "this.getMainView().push(form);"
                    ],
                    "name": "itemtap"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "[action=Save]",
                    "designer|targetType": "Ext.Button",
                    "fn": "onSaveTap",
                    "implHandler": [
                        "var me = this,",
                        "    form = this.getCustomerForm(),\t// Get the CustomerForm view",
                        "    values = form.getValues(),\t\t// Extract the values from the CustomerForm",
                        "    record = form.getRecord(),\t\t// Get the record object from the CustomerForm",
                        "    newRecord = record.phantom,\t\t// If phantom is true, then this is a new record",
                        "    store = Ext.data.StoreManager.lookup(\"Customers\");\t// Get the customers store",
                        "",
                        "// Start a type of client-side transaction",
                        "record.beginEdit();",
                        "",
                        "// Set the record values with the values from the form fields",
                        "record.set(values);",
                        "",
                        "// Check the record changes are valid, based on the validations specified on the ",
                        "// customer model",
                        "if (record.isValid()) {",
                        "    record.save({\t// Save the record. Fires off a PUT or POST request to the server  ",
                        "        success: function() {",
                        "            record.endEdit();\t// Commit the changes to the client-side record",
                        "",
                        "            if (newRecord) {",
                        "                store.add(record);\t// If this is a new record, add it to the store",
                        "            }",
                        "",
                        "            // Get the navigation view and remove the CustomerDetail view, thereby ",
                        "            // returning the user to the CustomerList view",
                        "            me.getMainView().pop();\t",
                        "        }",
                        "    });",
                        "}",
                        "else {",
                        "    // If the record changes aren't valid, cancel the edit but leave the form on ",
                        "    // screen for the user to tweak the values",
                        "    record.cancelEdit();",
                        "",
                        "    Ext.Msg.alert(\"Error\", \"There are errors with the record.\");",
                        "}"
                    ],
                    "name": "tap"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "[action=Delete]",
                    "designer|targetType": "Ext.Button",
                    "fn": "onDeleteTap",
                    "implHandler": [
                        "var me = this,",
                        "    form = this.getCustomerForm(),\t// Get the CustomerForm view",
                        "    record = form.getRecord();\t\t// Get the record object from the CustomerForm",
                        "",
                        "// Confirm deletion of the record with the user",
                        "Ext.Msg.confirm(\"Confirm deletion\", \"Are you sure you want to permanently delete this customer?\", function(buttonId) {",
                        "    if (buttonId == \"yes\") {",
                        "        record.erase({\t// Delete the record. Fires off a DELETE request to the server",
                        "            success: function(){",
                        "                // Upon successful deletion, remove the CustomerDetail view, thereby ",
                        "                // returning the user to the CustomerList view",
                        "                me.getMainView().pop();\t",
                        "            },",
                        "            failure: function(){",
                        "                Ext.Msg.alert(\"Linked data\", \"Unable to delete this customer because they have previous orders.\");",
                        "            }",
                        "        });",
                        "    }",
                        "});"
                    ],
                    "name": "tap"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "navigationview",
                    "designer|targetType": "MainView",
                    "fn": "onNavigationviewActiveItemChange",
                    "implHandler": [
                        "// Fires whenever the view is changed in the navigation view.",
                        "// If the view being shown is the customer list, show the Add button; otherwise, hide it.",
                        "if (value.xtype == \"customerlist\") {",
                        "    this.getAddButton().show();",
                        "} else {",
                        "    this.getAddButton().hide();",
                        "}"
                    ],
                    "name": "activeitemchange"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "[action=Add]",
                    "designer|targetType": "Ext.Button",
                    "fn": "onAddTap",
                    "implHandler": [
                        "// Fires when the user taps on the Add button to create a new customer.",
                        "    // Create a new instance of a customer record",
                        "var record = Ext.create(\"Customers.model.Customer\"),",
                        "    // Create a new instance of the CustomerDetail view, passing in a title to show on ",
                        "    // the navigation view's toolbar, plus the record object",
                        "    form = Ext.create(\"Customers.view.CustomerDetail\",\t",
                        "    {",
                        "        title: \"New Customer\",",
                        "        record: record",
                        "    });",
                        "",
                        "// Get the navigation view (MainView) and use its \"push\" method to show ",
                        "// the CustomerDetail view on screen",
                        "this.getMainView().push(form);"
                    ],
                    "name": "tap"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "tabpanel",
                    "designer|targetType": "CustomerDetail",
                    "fn": "onTabpanelActiveItemChange",
                    "implHandler": [
                        "// Fires when the user switches between the tabs on the CustomerDetail view.",
                        "var newView = value,\t// Get a reference to the view being shown",
                        "    record = container.getRecord();\t// Get the customer record object",
                        "",
                        "if (newView.xtype == \"customerchart\") {",
                        "    // If the view being shown is the CustomerChart, load the chart's store with the ",
                        "    // specified customer data. This will fire off a request to the order.php Web ",
                        "    // service to get the necessary data",
                        "    newView.getStore().load({",
                        "        params: { ",
                        "            CustomerID: record.data.ID",
                        "        }",
                        "    });",
                        "}"
                    ],
                    "name": "activeitemchange"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "map",
                    "designer|targetType": "CustomerMap",
                    "fn": "onMapRender",
                    "implHandler": [
                        "// Fired when the map is rendered",
                        "    // Create a new Google Maps Geocoder object, which will be used to look up the ",
                        "    // lat and long coordinates based on the customer's address",
                        "var geocoder = new google.maps.Geocoder(), ",
                        "    record = this.getCustomerDetail().getRecord(), // Get the customer record",
                        "    address = record.data.Address, // Extract the address from the customer record",
                        "    mapContainer = this.getCustomerMap(), // Get the customer map container",
                        "    map = mapContainer.getMap(); // Get the Google Map object within the container",
                        "",
                        "if (!record.phantom) {",
                        "    // If it's an existing record, perform a lookup of the user's address. This will ",
                        "    // return the lat and long coordinates if the address is valid",
                        "    geocoder.geocode({\"address\": address}, function(results, status) {",
                        "        if (status == google.maps.GeocoderStatus.OK) {",
                        "            // Lookup was successful, so add a new marker to the map",
                        "            var location = results[0].geometry.location;",
                        "    ",
                        "            var marker = new google.maps.Marker({",
                        "                map: map,",
                        "                position: location",
                        "            });",
                        "    ",
                        "            google.maps.event.addListenerOnce(map, \"bounds_changed\", function() {",
                        "                // Once the map has correctly sized itself (after becoming visible), ",
                        "                // set the center of the map to the customer's location.",
                        "                map.setCenter(location);",
                        "            });",
                        "        } else {",
                        "            // Lookup not successful, so show an error to the user",
                        "            Ext.Msg.alert(\"Invalid address\", \"Unable to locate this customer from the address provided.\");",
                        "        }",
                        "    });",
                        "}"
                    ],
                    "name": "maprender"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|controlQuery": "tabpanel",
                    "designer|targetType": "CustomerDetail",
                    "fn": "onTabpanelInitialize",
                    "implHandler": [
                        "// Fired when the customer details tab panel is initialized",
                        "var customerDetail = component, // The customer details tab panel ",
                        "    tabBarItems = customerDetail.getTabBar().items.items, // Get the tabs in the tab bar",
                        "    record = customerDetail.getRecord(), // Get the customer record from the tab panel",
                        "    newRecord = record.phantom; // If phantom is true, then this is a new record",
                        "",
                        "// Apply the record to the form in the tab panel. This populates the form fields ",
                        "// with values.",
                        "this.getCustomerForm().setRecord(record); ",
                        "",
                        "if (newRecord) {",
                        "    // For a new record, hide the last two tabs (the chart and map tabs)",
                        "    tabBarItems[1].hide();",
                        "    tabBarItems[2].hide();",
                        "    ",
                        "    // Also hide the delete button, because the record doesn't yet exist on the server",
                        "    this.getDeleteButton().hide();",
                        "}"
                    ],
                    "name": "initialize"
                }
            }
        ]
    },
    "linkedNodes": {},
    "boundStores": {},
    "boundModels": {}
}
