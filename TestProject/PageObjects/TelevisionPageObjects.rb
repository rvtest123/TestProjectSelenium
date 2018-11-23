module TelevisionPageObjects
#All the xpaths used in the script TelevisionPage  
  
  Xpath_ToplevelMenu="//*[@data-which-id='global-navigation']//*[@data-which-id='gn-top-level-menu']//ul[@data-which-id='gn-top-level-menu-list']//li[@data-which-id='gn-top-level-menu-list-item'][@string]//a//span"
  Xpath_TVHomeELink="//*[@data-test-element='masthead-container']//ul[@data-test-element='breadcrumb-container']//li/a/span[contains(text(),'TV & home entertainment')]"
  Xpath_CompareBtn="//*[@class='page-container']//ul[@data-test-element='product-list']//li[1]//button"
  Xpath_ComparePopup="//*[@class='cont-products-compare active']"
  Xpath_model="//*[@class='page-container']//ul[@data-test-element='product-list']//li[1]//*[@data-which-id='manufacturer-model']"
  Xpath_modelMf="#{Xpath_ComparePopup}//a//span[1]"
  Xpath_modelno="#{Xpath_ComparePopup}//a//span[2]"
  
  #method to replace a dynamic keyword in the xpath
  def TelevisionPageObjects.ReplaceString(xpath, replacingWord, originalWord = "@string")
      return xpath.gsub originalWord, replacingWord
  end 
  
  
  
end