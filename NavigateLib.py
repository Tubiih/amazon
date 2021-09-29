import playwright.sync_api as pw

from robot.api import logger

class NavigateLib:

    def __init__(self):
        self.url = 'https://www.etteplan.com/fi'
        self.headless = False
        self.pw_process = None
        self.browser: pw.Browser = None
        self.context: pw.BrowserContext = None
        self.page: pw.Page = None

    def open_browser_to_etteplan(self):
        logger.info('Opening browser')
        self.pw_process = pw.sync_playwright().start()
        self.browser = self.pw_process.chromium.launch(headless=self.headless)
        self.context = self.browser.new_context()
        self.page = self.context.new_page()
        self.page.goto(self.url)
        logger.info('Browser opened')


    def verify_etteplan_title(self):
        page_title = self.page.title()
        if not 'Erilainen suunnittelutoimisto' in page_title:
            raise AssertionError(f'Incorrect page. Expected "Erilainen suunnittelutoimisto", got {page_title!r}')
        else:
            logger.info('Correct page title')

    def navigate_to_about_us(self):
        self.page.click('text=Tietoa meistä')
        
    def verify_page_content(self):
        self.page.text_content('text=Etteplanin tarina')

    def cleanup(self):
        self.browser = self.browser.close()
        self.pw_process = self.pw_process.stop()
        self.context = None
        self.page = None

        
