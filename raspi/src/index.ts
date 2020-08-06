import * as inquire from "inquirer";
import chalk from "chalk";
import * as fs from "fs";
import * as path from "path";
import * as df from "node-df";
import { Questions } from "./questions";
import { ObjectUtils } from "./utils/object-utils";



console.info(
    chalk.bgBlack.blue(`This application will help you configure a new SD card for a Raspberry pi.
It assumes that you've already loaded Raspbian onto the card.
Next, we'll configure wifi and ssh so that you can connect to the Pi when it first boots.`));
Questions.ask().then(answers => {
    console.info(`Configuring wifi...`);
    const fileName = "./wpa_supplicant.conf";
    fs.copyFileSync(path.join(__dirname, "..", fileName), path.join(answers.volume, fileName));
}).catch(e => console.error(e));