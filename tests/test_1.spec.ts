import { test, expect } from '@playwright/test';

test('should navigate to another page after button click', async ({ page }) => {
    // Go to the Playwright homepage
    await page.goto('https://playwright.dev/');

    // Click the "Get started" button in the hero section
    await page.click('a.getStarted_Sjon'); // This is the actual class used for the "Get started" link

    // Expect to be on the docs/intro page
    await expect(page).toHaveURL('https://playwright.dev/docs/intro');
});