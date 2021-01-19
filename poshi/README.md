# Poshi

## Learn Poshi

1. Follow the tutorial in https://qa-compendium.readthedocs.io/en/latest/poshi/index-poshi.html. Your portal is already located at ***/home/me/dev/projects/liferay-portal***.

1. Understanding and explaining what the following scripts do (level: 4.1 to 4.4 = easy, 4.5 to 4.8 = moderate)

Go to https://github.com/liferay/liferay-portal/tree/master/modules/apps/app-builder/app-builder-test/src/testFunctional/tests 

Some of these tests are available in ```AppBuilder.testcase``` or ```shared/SharedAppBuilder.testcase```

    1. test ValidateEmptyStateOfAppsListingScreen
    1. test AddSimpleFormViewWithDateField
    1. test DeleteFormViewThroughActionMenu
    1. test FormViewSearchByTerm
    1. test AddSimpleTableView
    1. test CreateRemoveUpdateDeleteEntriesOfStandaloneApp

1. How to speed up your test execution (tip):
    1. Go to the portal home;
    1. Create the following file: test.<your-user-name>.properties
    1. Add the following code snippet: 
    ```
    timeout.explicit.wait=10
    test.assert.console.errors=false
    ````

    Default timeout.explicit.wait is 120 seconds - this is the time poshi will wait for an element.
    Default assert console error is true - reading log makes poshi slower.

1. Running an existing test:
    1. Launch the portal;
    1. Go to the portal home;
    1. Run ***ant -f build-test.xml run-selenium-test -Dtest.class=FILE#TEST_METHOD*** where ***FILE*** is the name of the file where the ***TEST_METHOD*** is located
    1. Example: ***ant -f build-test.xml run-selenium-test -Dtest.class=AppBuilder#AddSimpleFormViewWithDateField***

1. Steps to create a new test
    1. Go to portal-web/test/functional/com/liferay/portalweb/tests/
    1. Create a folder sample
    1. Create a file MyTestFile.testcase
    1. Add the following code snippet:

```
    @component-name = "app-builder"
    definition {
        property testray.main.component.name = "App Builder";

        setUp {
            TestCase.setUpPortalInstance();

            User.firstLoginPG();

            Navigator.openURL();
        }

        tearDown {
            User.logoutAndLoginPG(
                userLoginEmailAddress = "test@liferay.com",
                userLoginFullName = "Test Test");
        }

        @description = "Access Portal Global Menu and validate CONFIGURATION string at Control Panel"
        @priority = "5"
        test ValidateConfigurationStringAtControlPanel {


        }

        @description = "Set Screen size to custom and validate values"
        @priority = "5"
        test SetScreenSizeAndValidateValues {


        }
    }

```

    1. Open the terminal and execute the following command: ***ant -f build-test.xml run-selenium-test -Dtest.class=MyTestFile#ValidateConfigurationStringAtControlPanel***
    or
    ant -f build-test.xml run-selenium-test -Dtest.class=MyTestFile#SetScreenSizeAndValidateValues
    1. Implement the tests (next topic)

1. Creating sample tests (based on file created in the previous topic) 
    1. Validating a string
    1. Open the portal;
    1. Open the Global Menu (top right corner - );
    1. Switch to Control Panel option;
    1. Assert "CONFIGURATION" section is shown.

Inputting values
Open the portal;
Open the Simulation menu (top right corner - );
Change the Screen Size to Custom;
Set the Height (px) to 1920 px  and Width (px) to 1080 px;
Close the Simulation menu;
Reopen the Simulation menu;
Assert the values previously set are persisted.

