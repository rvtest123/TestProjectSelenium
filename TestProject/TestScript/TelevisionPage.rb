require 'watir-webdriver'
require File.expand_path(File.dirname(__FILE__) + '/../Utils/UtilsTestScript.rb')
require File.expand_path(File.dirname(__FILE__) + '/../PageObjects/TelevisionPageObjects.rb')
#script to check a few functionalities in the Television landing page
def TelevisionPage()
  
  
  begin
  
      #Chromedriver location
      Selenium::WebDriver::Chrome.driver_path = File.expand_path('C:\\TestProject\\ChromeDriver\\chromedriver.exe')
      
      #Open a Chrome browser
      driver = Watir::Browser.new :chrome
      
      #Navigate to the url
      driver.goto "https://www.which.co.uk/reviews/televisions"
      sleep 4
      #Maximize the Chrome window
      driver.window.maximize 
      sleep 1
      #get page title
      oPageTitle=driver.title
      UtilsTestScript.TakeScreenshot(driver)
      #Check that the page title is Television reviews - Which?
      if(oPageTitle != "Television reviews - Which?")   
        puts"Title of the webpage is not 'Television reviews - Which?'. "  
        #Utility to take screenshot   
        UtilsTestScript.TakeScreenshot(driver)
        return false
      end
      
      #Scenario 1
      #Check if the top level menu items are displayed as expected
      ############################################################
      
      #Expected Toplevel menu items       
      array_toplevelmenu=["Technology","Home & garden","Money","Baby & child","Cars & travel","Campaigns","Services","More from Which?"]
      
      for i in 0 ... array_toplevelmenu.length
          #Xpath_ToplevelMenu returns all the elements in the top level menu.
          xpath_menuitems=TelevisionPageObjects.ReplaceString(TelevisionPageObjects::Xpath_ToplevelMenu,"#{i+1}")
          #Waits(for 5 seconds) until the object is returned
          isMenuItemPresent = Watir::Wait.until(5){driver.element(:xpath => xpath_menuitems)}
          if(isMenuItemPresent.present?)
              #Get the text of the menuitem
              menuItem=isMenuItemPresent.text
              puts "#{menuItem}"
              #compare the text retrived to the array
              if(array_toplevelmenu[i] != menuItem)
                  puts"Top level menu item '#{array_toplevelmenu[i]}' is not displayed in the web page."
                  UtilsTestScript.TakeScreenshot(driver) 
              end
          else
             puts"Not able to get the reference of top level menu item #{array_toplevelmenu[i]}."
             UtilsTestScript.TakeScreenshot(driver)
          end
  
      end
  
      #Scenario 2
      #Check if 'TV & home entertainment' link is displayed in the page
      ############################################################      
      isLinkPresent = Watir::Wait.until(5){driver.element(:xpath => TelevisionPageObjects::Xpath_TVHomeELink)}
      if !(isLinkPresent.present?)      
        puts"'TV & home entertainment' link is not displayed in the page"
        UtilsTestScript.TakeScreenshot(driver)
      end
  
      #Scenario 3
      #For the first product displayed in the page,make sure that Compare button is displayed.
      #Click on it and verify that the Compare popup shows up with the same product name.
      ############################################################     
      
      #Check if Compare button is present inside the first product description  
      isButtonPresent = Watir::Wait.until(5){driver.element(:xpath => TelevisionPageObjects::Xpath_CompareBtn)}
      if (isButtonPresent.present?)      
         #Click on Compare button
         isButtonPresent.click
         UtilsTestScript.TakeScreenshot(driver)
         #Check if Compare popup is displayed
         isPopupPresent = Watir::Wait.until(5){driver.element(:xpath => TelevisionPageObjects::Xpath_ComparePopup)}
         if(isPopupPresent)
            #Get the model name from the product tile
            isModel = Watir::Wait.until(5){driver.element(:xpath => TelevisionPageObjects::Xpath_model)}            
            if(isModel)
                puts"#{isModel.text}"
            else
                puts"Not able to get the reference of the first product model name in the product list."
                UtilsTestScript.TakeScreenshot(driver)
            end
            
            #Check the manufacturer name in the Compare popup            
            checkPopupMf = Watir::Wait.until(5){driver.element(:xpath => TelevisionPageObjects::Xpath_modelMf)}     
            if(checkPopupMf)
                getPopupMf=checkPopupMf.text
                puts"#{getPopupMf}"
            else
                puts"Not able to get the reference of the product manufacturer name in the popup."
                UtilsTestScript.TakeScreenshot(driver)
            end
            #Check the model number in the Compare popup   
            checkPopupModel = Watir::Wait.until(5){driver.element(:xpath => TelevisionPageObjects::Xpath_modelno)}     
            if(checkPopupModel)
                getPopupModel=checkPopupModel.text
                 puts"#{getPopupModel}"
            else
                puts"Not able to get the reference of the product model name in the popup."
                UtilsTestScript.TakeScreenshot(driver)
            end
            #Check that product name matches in the Compare popup and the first product tile
            if(isModel.text != getPopupMf+" "+ getPopupModel)
                puts"Product name in the first tile doesn't match with the one displyed in Compare popup ."
                UtilsTestScript.TakeScreenshot(driver)
            end
            
         end
         
      end
      
  #rescue block to display any Exception that may happen    
  rescue Exception => e
     puts e
  ensure
     #Close the driver
     driver.quit
  end 
  
end
