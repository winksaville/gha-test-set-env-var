const core = require('@actions/core');
const github = require('@actions/github');

try {
    const env_name = core.getInput('env-name');
    if(env_name == "") {
        throw "env-name is empty";
    }
    const env_value = core.getInput('env-value');
    core.exportVariable(env_name, env_value);
} catch (error) {
    core.setFailed(error);
}
