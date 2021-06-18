const { Given, When, Then, After } = require('@cucumber/cucumber');
//const { decode } = require('punycode');

const LoginPage = require('../pageobjects/login.page');
const SecurePage = require('../pageobjects/secure.page');
const fs = require('fs-extra')

const pages = {
    login: LoginPage
}

Given(/^I am on the (\w+) page$/, async (page) => {
    await pages[page].open()
});

When(/^I login with (\w+) and (.+)$/, async (username, password) => {
    await LoginPage.login(username, password)
});

Then(/^I should see a flash message saying (.*)$/, async (message) => {
    await expect(SecurePage.flashAlert).toBeExisting();
    await expect(SecurePage.flashAlert).toHaveTextContaining(message);
});

After((scenario) => {
    //const path =  '.tmp/screenshots/'+Date.now()+'.png';
    const path =  '.tmp/screenshots/Error.png';
    if(scenario.result.status == 6){
        browser.saveScreenshot(path);
        const cucumberJson = require('wdio-cucumberjs-json-reporter').default;
        const data = fs.readFileSync(path);
        if (data) {
            const base64Image = Buffer.from(data, 'binary').toString('base64')
            cucumberJson.attach(base64Image, 'image/png');
        }
        
    }
});


