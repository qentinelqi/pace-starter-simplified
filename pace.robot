# Tip 1: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation           Test suite for Pace starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

# Tip 2: The Settings section is where you define test suite level configuration.
#        Suite Setup and Teardown are actions that happen before and after a test suite run.
#        For first time users, we don't recommend to change them.
#        You may change chrome to firefox should you wish to test your application on Firefox.

*** Test Cases ***

# Tip 3: Test cases start from here. The structure of a test case is as follows:
#        Name of the test
#            [Documentation]    A short explanation of the test.
#            Test steps

Test the home page
    [Documentation]     Go to the shop homepage and verify text.
    GoTo                https://qentinelqi.github.io/shop/          # Tip 4: You can change this URL to test any other website.
    VerifyText          Find your spirit animal                     # Tip 5: Verify that the page contains the given text.

# Tip 6: Please note that the test case name starts at the beginning of the line.
#        Every test step starts with an indent of minimum two spaces.
#        Two or more spaces are also necessary between a PaceWord and its argument, and between two arguments.

Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify the menu items.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact

Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

# Pro Tip 1: Make sure that when each test case starts, your application is in a well-defined initial state.
#            The test cases above use GoTo with a fixed URL to set the initial application state, but it is
#            conventional to start each test case with the dedicated AppState PaceWord. The test case below
#            starts with AppState Home, where Home is an initial state defined in the Keywords section at
#            the end of the file. More initial states could be defined as needed.

Continue shopping
    [Documentation]     Add a second product to the cart.
    AppState            Home
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to cart
    ClickText           Continue shopping
    VerifyText          Fur, Inc.           # Check if we've exited the "cart" by looking for text in the footer.

*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

# Pro Tip 2: In this Keywords section, you could combine PaceWords to make your own keywords using the structure
#            shown above. The pro way is to define them in a separate file and import that file under Settings.
