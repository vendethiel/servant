// noinspection NpmUsedModulesInstalled
import {argv} from "process";
import {readFileSync} from "fs";
import vm from "node:vm";

const filename = argv[2];
const variables = argv.slice(3);
const contextVariables = Object.fromEntries(variables.map(v => [v, {}]));
const data = readFileSync(filename);
const context = vm.createContext({
    "VERSION": 1,
    ...contextVariables
});
vm.runInContext(data.toString(), context, {filename});
const out = {};
variables.forEach(v => out[v] = context[v]);
console.log(JSON.stringify(out));