module UtilsTestScript
  
#Utility to take screenshot in a webpage  Parameters required: driver object
def UtilsTestScript.TakeScreenshot(driver)
  
  if(driver.nil? || driver == "")
      return false
  end
  #Location to store the screenshots
  strLocation =  "C:/TestProject/Images/"
  #Image name should be in the format YYYYMMDD_HH:MM:SS
  imgName=Time.now.strftime('%Y-%m-%d_%H-%M-%S')+".png"
  
  screenshotName=strLocation+imgName
  
  driver.screenshot.save screenshotName
  
end
end