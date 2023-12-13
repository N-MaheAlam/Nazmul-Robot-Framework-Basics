from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn


#this class will work as a library when we define with @library key word
#import this "from robot.api.deco import library" to use the library
@library
class PrintNazmul:

    def __init__(self):
        #This helps us to use the robot Framwork keywords for selneium in phython program
        self.useSelenium = BuiltIn().get_library_instance("SeleniumLibrary")
    #this method will work as a Key word in robot framework (Print Myname)
   # import this "from robot.api.deco import keyword" to define this method as key word
    @keyword
    def print_myName(self):
        print("My Name Nazmul Mahe Alam")


    @keyword
    def add_products_to_cart_and_checkout(self, productList):
        i = 1
        #It gets the web elements
        productsTitles = self.useSelenium.get_webelements("css:.card-title")
        for productTitle in productsTitles:
            #if product title is present in "productList"
            if productTitle.text in productList:
                # put the i value in below code
                # an integer can not be concatenate with strings thats why we sued "str" to treat
                #integer as a string
                self.useSelenium.click_button("xpath:(//*[@class ='card-footer'])["+str(i)+"]/button")

            i = i + 1