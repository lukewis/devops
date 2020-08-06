import chalk from "chalk";

export const ObjectUtils = {
    printObj: (obj: any) => {
        for (const key in obj) {
            console.info(`${key}: ${chalk.blue(obj[key].toString())}`);    
        }
    }
}