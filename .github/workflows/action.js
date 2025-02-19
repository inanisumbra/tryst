const core = require("@actions/core");
const puppeteer = require("puppeteer-core");
const io = require("@actions/io");
const os = require("os");
const path = require("path");
const moment = require("moment");

function urlStringBuilder() {
    const end = moment().format("YYYY-MM-DD");
    const start = end.subtract(7, 'days').format("YYYY-MM-DD");
    return {
      url: `https://wakatime.com/@44c6aa7b-8fe0-4a2d-984b-2196f658cef9/projects/xpgicchoiw?start=${start}&end=${end}`,
      start,
      end
    }
}

function getChromePath() {
  let browserPath;

  if (os.type() === "Windows_NT") {
    // Chrome is usually installed as a 32-bit application, on 64-bit systems it will have a different installation path.
    const programFiles =
      os.arch() === "x64"
        ? process.env["PROGRAMFILES(X86)"]
        : process.env.PROGRAMFILES;
    browserPath = path.join(
      programFiles,
      "Google/Chrome/Application/chrome.exe"
    );
  } else if (os.type() === "Linux") {
    browserPath = "/usr/bin/google-chrome";
  } else if (os.type() === "Darwin") {
    browserPath =
      "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome";
  }

  if (browserPath && browserPath.length > 0) {
    return path.normalize(browserPath);
  }

  throw new TypeError(`Cannot run action. ${os.type} is not supported.`);
}

(async () => {
  try {
    await io.mkdirP(`${process.env.GITHUB_WORKSPACE}/screenshots/`);

  
    const {url, start, end} = urlStringBuilder();
  

    const timestamp = new Date().getTime();
    const width = 940;
    const height = 5000;
    const screenshotName = `WakaTime_${start}-${end}`;

    const browser = await puppeteer.launch({
      executablePath: getChromePath(),
      defaultViewport: { width, height },
    });
    const page = await browser.newPage();
    await page.goto(url, {
      waitUntil: "networkidle2",
    });
    await page.waitFor(3000);
    await page.screenshot({
      fullPage,
      path: `${process.env.GITHUB_WORKSPACE}/screenshots/${screenshotName}.png`,
    });
    await browser.close();

    core.exportVariable("TIMESTAMP", timestamp);
  } catch (error) {
    core.setFailed(`Failed to run action. ${error}`);
    process.exit(1);
  }
})();
