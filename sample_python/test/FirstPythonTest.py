import unittest
from selenium import webdriver
from time import sleep
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By


class FirstPythonTest(unittest.TestCase):

    driver = None

    def setUp(self):
        print("#### Before")
        self.driver = webdriver.Chrome()

    def tearDown(self):
        print("#### After")
        self.driver.quit()

    def testScanCodeRenew(self):
        self.driver.get("https://web.whatsapp.com/")

        qrcode_locator = (By.XPATH, "//div[@data-testid='qrcode']")
        wait = WebDriverWait(self.driver, timeout=5)
        scanCode = wait.until(EC.visibility_of_element_located(qrcode_locator))

        get_qr_code = lambda : scanCode.get_attribute("data-ref")
        old_code = get_qr_code()

        for index in range(3):
            sleep(60)
            new_code = get_qr_code()
            self.assertNotEqual(new_code, old_code)
            old_code = new_code

    def testHovers(self):
        self.driver.get("http://the-internet.herokuapp.com/hovers")

        avatar = self.driver.find_element(By.CLASS_NAME, 'figure')
        self.highlightElement(avatar, 5, "red");
        
        ActionChains(self.driver).move_to_element(avatar).perform()
        
        wait = WebDriverWait(self.driver, timeout=5)
        wait.until(EC.visibility_of_element_located((By.CLASS_NAME, 'figcaption')))

        caption = self.driver.find_element(By.CLASS_NAME, 'figcaption')
        self.highlightElement(avatar, 2, "blue");
        
        self.assertTrue(caption.is_displayed(), 'Caption element is NOT showed!')
      
    def highlightElement(self, element, duration, color):
        """This routine highlight WebElement for requested time."""
        original_style = element.get_attribute('style')
        self.driver.execute_script('arguments[0].setAttribute(arguments[1], arguments[2])', element, 'style', "border: 2px solid "+str(color)+"; border-style: dashed;")
        if int(duration) > 0:
            sleep(duration)
        self.driver.execute_script('arguments[0].setAttribute(arguments[1], arguments[2])', element, 'style', str(original_style))

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()