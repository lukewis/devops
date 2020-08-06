import * as inquire from "inquirer";
import df from "node-df";
import witools from "wireless-tools";
import nodewifi from "node-wifi";
import { ObjectUtils } from "./utils/object-utils";

interface IWifiAnswers {
    ssid: string;
    ssidOther?: string;
    pwd: string;
    pwd_confirm: string;
}
const wifiName = (key: keyof IWifiAnswers) => key.toString();

interface ISdCardAnswers {
    volume: string;
}
const sdCardName = (key: keyof ISdCardAnswers) => key.toString();

export const Questions = {
    ask: (): Promise<IWifiAnswers&ISdCardAnswers> => {
        return new Promise<IWifiAnswers&ISdCardAnswers>((resolve, reject) => {
            console.info(`Searching for wifi networks...`);
            nodewifi.init({iface: null});
            nodewifi.scan((error: any, networks: any[]) => {
                if (error) {
                    reject(error);
                } else {
                    const otherChoice = "Other...";
                    const msg = "What is your wifi ssid?";
                    inquire.prompt<IWifiAnswers>([
                        {
                            type: "list",
                            name: wifiName("ssid"),
                            choices: [...networks.map(p => p.ssid), otherChoice],
                            message: msg,
                            default: networks[0]
                        },
                        {
                            type: "input",
                            name: wifiName("ssidOther"),
                            message: msg,
                            when: (ans) => {
                                console.info("Should ask:");
                                ObjectUtils.printObj(ans);
                                return ans.ssid === otherChoice;
                            }
                        },
                        {
                            type: "password",
                            name: wifiName("pwd"),
                            validate: (value) => !!value ? true : "A password is required",
                            message: "What is your wifi password?"
                        },
                        {
                            type: "password",
                            name: wifiName("pwd_confirm"),
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
                        df((error, response) => {
                            if(error) {
                                console.error(`There was a problem reading drive information: ${error}`);
                                process.exit(-1);
                            }
                            inquire.prompt<ISdCardAnswers>([
                                {
                                    type: "list",
                                    name: sdCardName("volume"),
                                    choices: response.map(p => p.mount),
                                    message: "Where is your sd card located?"
                                }
                            ]).then(sdAnswers => {
                                resolve({
                                    ...answers,
                                    ...sdAnswers
                                });
                            }).catch(e => reject(e));
                        })
                    }).catch(e => reject(e));
                }
            });
        });
    }
}