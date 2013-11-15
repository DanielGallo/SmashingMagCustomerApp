{
    "xdsVersion": "3.0.0",
    "frameworkVersion": "touch23",
    "internals": {
        "type": "Ext.app.Controller",
        "reference": {
            "name": "items",
            "type": "array"
        },
        "codeClass": null,
        "userConfig": {
            "designer|userClassName": "Customer"
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
                        "// Create a new instance of the CustomerDetail view, passing in a title to show on the Navigation View's toolbar, plus the record object to populate the form fields",
                        "var form = Ext.create(\"Customers.view.CustomerDetail\", {",
                        "    title: record.data.Name,",
                        "    record: record",
                        "});",
                        "",
                        "// Get the Navigation View (MainView) and use its \"push\" method to show the CustomerDetail view on screen",
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
                        "    store = Ext.data.StoreManager.lookup(\"Customers\");\t// Get the Customers Store",
                        "",
                        "// Start a type of client side transaction",
                        "record.beginEdit();",
                        "",
                        "// Set the record values with the values from the form fields",
                        "record.set(values);",
                        "",
                        "// Check the record changes are valid, based on the Validations specified on the Customer Model",
                        "if (record.isValid()) {",
                        "    record.save({\t// Save the record. Fires off a PUT or POST request to the server",
                        "        success: function() {",
                        "            record.endEdit();\t// Commit the changes to the client side record",
                        "",
                        "            if (newRecord) {",
                        "                store.add(record);\t// If this is a new record, add it to the Store",
                        "            }",
                        "",
                        "            me.getMainView().pop();\t// Get the Navigation View and remove the CustomerDetail view, therefore returning the user to the CustomerList view",
                        "        }",
                        "    });",
                        "}",
                        "else {",
                        "    record.cancelEdit();\t// If the record changes aren't valid, cancel the edit but leave the form on screen for the user to tweak the values",
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
                        "Ext.Msg.confirm(\"Confirm deletion\", \"Are you sure you want to permanently delete this Customer?\", function(buttonId) {",
                        "    if (buttonId == \"yes\") {",
                        "        record.erase({\t// Delete the record. Fires off a DELETE request to the server",
                        "            success: function(){",
                        "                me.getMainView().pop();\t// On successful deletion remove the CustomerDetail view, therefore returning the user to the CustomerList view",
                        "            },",
                        "            failure: function(){",
                        "                Ext.Msg.alert(\"Linked data\", \"Unable to delete this Customer as they have previous Orders.\");",
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
                        "// Fires whenever the view is changed within the Navigation View.",
                        "// If the view being shown is the Customer List, show the Add button, otherwise hide it",
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
                        "// Fires when the user taps on the Add button to create a new Customer.",
                        "var record = Ext.create(\"Customers.model.Customer\"),\t// Create a new instance of a Customer record",
                        "    form = Ext.create(\"Customers.view.CustomerDetail\",\t// Create a new instance of the CustomerDetail view, passing in a title to show on the Navigation View's toolbar, plus the record object",
                        "    {",
                        "        title: \"New Customer\",",
                        "        record: record",
                        "    });",
                        "",
                        "// Get the Navigation View (MainView) and use its \"push\" method to show the CustomerDetail view on screen",
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
                        "var newView = value,\t// Get a reference to the view that's being shown",
                        "    record = container.getRecord();\t// Get the Customer record object",
                        "",
                        "if (newView.xtype == \"customerchart\") {",
                        "\t// If the view being shown is the CustomerChart, load the chart's Store with the specified Customer data.  This will fire off a request to the order.php web service to get the necessary data",
                        "    newView.getStore().load({",
                        "        params: {",
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
                        "var geocoder = new google.maps.Geocoder(), // Create a new Google Maps Geocoder object - will be used for looking up the lat/lng coordinates based on the Customer's address",
                        "    record = this.getCustomerDetail().getRecord(), // Get the Customer record",
                        "    address = record.data.Address, // Extract the Address from the Customer record",
                        "    mapContainer = this.getCustomerMap(), // Get the Customer Map container",
                        "    map = mapContainer.getMap(); // Get the Google Map object within the container",
                        "",
                        "if (!record.phantom) {",
                        "    // If an existing record, perform a lookup of the user's address. This will return the lat/lng coordinates if the address is valid",
                        "    geocoder.geocode({\"address\": address}, function(results, status) {",
                        "        if (status == google.maps.GeocoderStatus.OK) {",
                        "            // Lookup was successful, so add a new marker to the map",
                        "            var location = results[0].geometry.location;",
                        "",
                        "            var marker = new google.maps.Marker({",
                        "                map: map,",
                        "                position: location",
                        "            });",
                        "",
                        "            google.maps.event.addListenerOnce(map, \"bounds_changed\", function() {",
                        "                // Once the map has correctly sized itself (after becoming visible), set the center of the map to the Customer's location.",
                        "                map.setCenter(location);",
                        "            });",
                        "        } else {",
                        "            // Lookup not successful, so show an error to the user",
                        "            Ext.Msg.alert(\"Invalid address\", \"Unable to locate this Customer from the provided address.\");",
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
                        "// Fired when the Customer Details Tab Panel is initialized",
                        "var customerDetail = component, // The Customer Details Tab Panel",
                        "    tabBarItems = customerDetail.getTabBar().items.items, // Get the tabs within the tab bar",
                        "    record = customerDetail.getRecord(), // Get the Customer Record from the Tab Panel",
                        "    newRecord = record.phantom; // If phantom is true, then this is a new record",
                        "",
                        "this.getCustomerForm().setRecord(record); // Apply the Record to the Form within the Tab Panel. This populates the form fields with values.",
                        "",
                        "if (newRecord) {",
                        "    // For a new record, hide the last two tabs (the Chart and Map tabs)",
                        "    tabBarItems[1].hide();",
                        "    tabBarItems[2].hide();",
                        "",
                        "    // Also hide the Delete button, as the record doesn't yet exist on the server",
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