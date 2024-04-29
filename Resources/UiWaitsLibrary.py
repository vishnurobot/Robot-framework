import traceback

from typing import Union

from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from robot.api import logger
from selenium.common.exceptions import *
from selenium.webdriver.remote.webelement import WebElement


class UiWaitsLibrary:
    ROBOT_LIBRARY_SCOPE = "Global"
    ROBOT_LIBRARY_DOC_FORMAT = "REST"

    def __init__(self):
        self.driver = None

    @staticmethod
    def get_by_locator(locator_type='xpath'):
        locator_type = locator_type.lower()
        match locator_type:
            case "xpath":
                return By.XPATH
            case "css":
                return By.CSS_SELECTOR
            case "id":
                return By.ID
            case "name":
                return By.NAME
            case "class":
                return By.CLASS_NAME
            case "tag_name":
                return By.TAG_NAME
            case "link":
                return By.LINK_TEXT
            case "partial_link":
                return By.PARTIAL_LINK_TEXT

    @keyword('util:wait for windows count equals')
    def wait_for_number_of_windows(self, num_windows=1, timeout=10):
        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        try:
            wait = WebDriverWait(driver, timeout=timeout)
            wait.until(expected_conditions.number_of_windows_to_be(num_windows))
        except RuntimeError:
            logger.error(traceback.print_stack())

    @keyword('util:wait for title')
    def wait_for_title(self, title_contains='Worldline Application', timeout=60):
        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        try:
            wait = WebDriverWait(driver, timeout=timeout)
            wait.until(expected_conditions.title_contains(title_contains))
        except RuntimeError:
            logger.error(traceback.print_stack())

    @keyword('util:wait for alert')
    def wait_for_alert_to_present(self, timeout=10):
        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        try:
            wait = WebDriverWait(driver, timeout=timeout)
            wait.until(expected_conditions.alert_is_present())
        except RuntimeError:
            logger.error(traceback.print_stack())

    @keyword('util:select drop down by value')
    def select_dropdown_by_value(self, weblement: WebElement, value):
        try:
            select = Select(weblement)
            select.select_by_value(value)
        except RuntimeError:
            logger.error(traceback.print_stack())

    @keyword('util:select drop down by index')
    def select_dropdown_by_index(self, weblement: WebElement, index):
        try:
            select = Select(weblement)
            select.select_by_index(int(index))
        except RuntimeError:
            logger.error(traceback.print_stack())

    @keyword('util:wait until element clickable and click')
    def wait_for_element_to_be_clickable_and_click(self, locator: Union[WebElement, None, str], locator_type='xpath'):
        global by_locator
        locator_type = locator_type.lower()
        if locator_type == 'xpath':
            by_locator = By.XPATH
        elif locator_type == 'css':
            by_locator = By.CSS_SELECTOR
        elif locator_type == 'id':
            by_locator = By.ID

        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        element = driver.find_element(by_locator, locator)
        for _ in range(3):
            try:
                element = WebDriverWait(driver, 10,
                                        ignored_exceptions=[NoSuchElementException, StaleElementReferenceException,
                                                            ElementNotVisibleException,
                                                            ElementClickInterceptedException,
                                                            ElementNotSelectableException]).until(
                    expected_conditions.element_to_be_clickable(element))
                element.click()
                return
            except StaleElementReferenceException:
                continue
            except Exception as e:
                logger.error(f"An error occurred: {str(e)}")
                break

    @keyword('util:wait until element clickable')
    def wait_for_element_to_be_clickable(self, locator: Union[WebElement, None, str], locator_type='xpath'):
        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        by_locator_type = self.get_by_locator(locator_type=locator_type)

        wait = WebDriverWait(driver, 10, poll_frequency=0.2,
                             ignored_exceptions=[NoSuchElementException, StaleElementReferenceException,
                                                 ElementNotVisibleException,
                                                 ElementClickInterceptedException,
                                                 ElementNotSelectableException])
        wait.until(expected_conditions.element_to_be_clickable((by_locator_type, locator)))

    @keyword('util:wait until element clickable')
    def wait_for_element_to_be_clickable(self, locator: Union[WebElement, None, str], locator_type='xpath'):
        driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
        by_locator_type = self.get_by_locator(locator_type=locator_type)

        wait = WebDriverWait(driver, 10, poll_frequency=0.2,
                             ignored_exceptions=[StaleElementReferenceException])
        wait.until(expected_conditions.element_to_be_clickable((by_locator_type, locator)))
