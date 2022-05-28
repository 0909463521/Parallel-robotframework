from AppiumLibrary import AppiumLibrary


class custom(AppiumLibrary):
    def get_driver_instance(self):
        return self._current_application()
    def CustomWithAccessibilityID(self, element):
       el =  self._current_application().find_element_by_accessibility_id(element)
       el.click()
       print(element)