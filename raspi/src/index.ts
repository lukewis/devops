import * as inquire from "inquirer";
import chalk from "chalk";

console.info(
    chalk.bgBlack.blue(`This application will help you configure a new SD card for a Raspberry pi.
It assumes that you've already loaded Raspbian onto the card.
Next, we'll configure wifi and ssh so that you can connect to the Pi when it first boots.`));
inquire.prompt([
    {
        type: "input",
        name: "ssid",
        message: "What is your wifi ssid?",
        default: "LC_Wedgewood"
    },
    {
        type: "password",
        name: "pwd",
        validate: (value) => !!value ? true : "A password is required",
        message: "What is your wifi password?"
    },
    {
        type: "password",
        name: "pwd_confirm",
        message: "Confirm password"
    }
]).then(answers => {
    if (!answers.pwd) {
        console.error(`You must supply a password`);
        return;
    }
    if (answers.pwd !== answers.pwd_confirm) {
        console.error(`Password mismatch`);
        return;
    }
    console.info(`Configuring the pi so that it will connect to ${answers.ssid} when it boots`);
});