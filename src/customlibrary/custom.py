from AppiumLibrary import AppiumLibrary
from appium.webdriver.common.mobileby import MobileBy

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC


class custom(AppiumLibrary):
    def get_driver_instance(self):
        return self._current_application()
    def CustomWithAccessibilityID(self, element)->None:
        #wait for element in DOM
        self._current_application().implicitly_wait(3)
        #wait for condition of Element (make )
        WebDriverWait(self._current_application(), 10).until(EC.presence_of_element_located((MobileBy.ACCESSIBILITY_ID, element)))
        el = self._current_application().find_element(MobileBy.ACCESSIBILITY_ID,element)
        el.click()

        print(el)
    def CheckAppState(self,packageName):
        return  self._current_application().query_app_state(packageName)
    