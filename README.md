# Simpler test for showing issue 416 on act

See [act](https://github.com/nektos/act) issue [#416](https://github.com/nektos/act/issues/416).

**I expected this to fail, but it currently doesn't. I believe the reason is that
docker-local-set-env-var is a local action and this causes a second the evaluation
of the enviroment variables via vmEnv.** Next I'm going to try to make docker-local-set-env-var
a "remote action" and see if it fails.

## Comparision of this repo and [act-failing-python-cache](https://github.com/winksaville/act-failing-python-cache/tree/dd1d0c498e08ad0a6f4cd3e8d7420a619688f56d).

Note both act-failing-python-cache.yml and set-env-var.yml workflows
were run using [winksaville/act](https://github.com/winksaville/act/tree/a5fc66fbd3843e05581f9b3c851735d4337f2a5f):
```
$ ~/prgs/nektos/forks/act/dist/local/act --version
act version 0.2.17-7-ga5fc66f
```

Notice that in `Run step2` we end up with the desired `value1=Linux-python-value1`
in this repo
```
   242	[test-set-env-var/test]   ⚙  ::set-env:: value1=Linux-python-value1
```

We also see a series of `WINK: Evaluated ret:`:
```
   181	[test-set-env-var/test] ⭐  Run step2
   182	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   183	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var actionPath="
   184	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   185	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   186	time="2020-11-19T16:10:07-08:00" level=debug msg="Read action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }} from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var/action.yml'"
   187	time="2020-11-19T16:10:07-08:00" level=debug msg="About to run action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }}"
   188	time="2020-11-19T16:10:07-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/docker-local-set-env-var containerActionDir=/github/workspace"
   189	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0004181a0} cmd=[${{ inputs.env-name }} ${{ inputs.env-value }}] entryPoint=[]"
   190	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   191	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   192	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   193	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   194	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
   195	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
   196	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
   197	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   198	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   199	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   200	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   201	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   202	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   203	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'inputs['env-name']' instead of 'inputs.env-name'"
   204	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-name']' val='${{ env.name1 }}'"
   205	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   206	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   207	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'inputs['env-value']' instead of 'inputs.env-value'"
   208	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-value']' val='${{ runner.os }}-python-${{ env.name1 }}'"
   209	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   210	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   211	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   212	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   213	[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-var:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var
```

But in `Run step2` of [act-failing-python-cache act-ga5fc66f.log](https://github.com/winksaville/act-failing-python-cache/blob/dd1d0c498e08ad0a6f4cd3e8d7420a619688f56d/act-ga5fc66f.log#L217)
we do NOT see these `WINK: Evaluated ret:` lines. Instead we see an error that `path` is empty:
```
   217	[python_cache/test] ⭐  Run step2
   218	time="2020-11-19T14:23:03-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:python_cache/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/act-failing-python-cache GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:ca084655394632c5afb4c7a5f78108b30d1d133e GITHUB_TOKEN: GITHUB_WORKFLOW:python_cache GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_KEY:Linux-python- INPUT_PATH: LD_LIBRARY_PATH:/opt/hostedtoolcache/Python/3.7.9/x64/lib PATH:/opt/hostedtoolcache/Python/3.7.9/x64:/opt/hostedtoolcache/Python/3.7.9/x64/bin:./node_modules/.bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.pub-cache/bin:/home/wink/prgs/flutter/flutter/bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.npm-globalX/bin:/home/wink/Android/Sdk/emulator:/home/wink/Android/Sdk/platform-tools:/home/wink/Android/Sdk/tools/bin:/home/wink/Android/Sdk/tools:/home/wink/bin:/home/wink/.cargo/bin:/opt/miniconda3/condabin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/cuda/bin:/opt/cuda/integration/nsight-compute:/opt/cuda/integration/nsight-systems:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl pythonLocation:/opt/hostedtoolcache/Python/3.7.9/x64] Cmd:[] Action:<nil>}"
   219	time="2020-11-19T14:23:03-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:python_cache/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/act-failing-python-cache GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:ca084655394632c5afb4c7a5f78108b30d1d133e GITHUB_TOKEN: GITHUB_WORKFLOW:python_cache GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_KEY:Linux-python- INPUT_PATH: LD_LIBRARY_PATH:/opt/hostedtoolcache/Python/3.7.9/x64/lib PATH:/opt/hostedtoolcache/Python/3.7.9/x64:/opt/hostedtoolcache/Python/3.7.9/x64/bin:./node_modules/.bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.pub-cache/bin:/home/wink/prgs/flutter/flutter/bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.npm-globalX/bin:/home/wink/Android/Sdk/emulator:/home/wink/Android/Sdk/platform-tools:/home/wink/Android/Sdk/tools/bin:/home/wink/Android/Sdk/tools:/home/wink/bin:/home/wink/.cargo/bin:/opt/miniconda3/condabin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/cuda/bin:/opt/cuda/integration/nsight-compute:/opt/cuda/integration/nsight-systems:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl pythonLocation:/opt/hostedtoolcache/Python/3.7.9/x64] Cmd:[] Action:<nil>} actionDir=/home/wink/.cache/act/actions-cache@v2 actionPath="
   220	time="2020-11-19T14:23:03-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:python_cache/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/act-failing-python-cache GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:ca084655394632c5afb4c7a5f78108b30d1d133e GITHUB_TOKEN: GITHUB_WORKFLOW:python_cache GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_KEY:Linux-python- INPUT_PATH: LD_LIBRARY_PATH:/opt/hostedtoolcache/Python/3.7.9/x64/lib PATH:/opt/hostedtoolcache/Python/3.7.9/x64:/opt/hostedtoolcache/Python/3.7.9/x64/bin:./node_modules/.bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.pub-cache/bin:/home/wink/prgs/flutter/flutter/bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.npm-globalX/bin:/home/wink/Android/Sdk/emulator:/home/wink/Android/Sdk/platform-tools:/home/wink/Android/Sdk/tools/bin:/home/wink/Android/Sdk/tools:/home/wink/bin:/home/wink/.cargo/bin:/opt/miniconda3/condabin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/cuda/bin:/opt/cuda/integration/nsight-compute:/opt/cuda/integration/nsight-systems:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl pythonLocation:/opt/hostedtoolcache/Python/3.7.9/x64] Cmd:[] Action:<nil>}"
   221	time="2020-11-19T14:23:03-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:python_cache/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/act-failing-python-cache GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:ca084655394632c5afb4c7a5f78108b30d1d133e GITHUB_TOKEN: GITHUB_WORKFLOW:python_cache GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_KEY:Linux-python- INPUT_PATH: LD_LIBRARY_PATH:/opt/hostedtoolcache/Python/3.7.9/x64/lib PATH:/opt/hostedtoolcache/Python/3.7.9/x64:/opt/hostedtoolcache/Python/3.7.9/x64/bin:./node_modules/.bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.pub-cache/bin:/home/wink/prgs/flutter/flutter/bin:/home/wink/.cargo/bin:/home/wink/go/bin:/home/wink/.npm-globalX/bin:/home/wink/Android/Sdk/emulator:/home/wink/Android/Sdk/platform-tools:/home/wink/Android/Sdk/tools/bin:/home/wink/Android/Sdk/tools:/home/wink/bin:/home/wink/.cargo/bin:/opt/miniconda3/condabin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/cuda/bin:/opt/cuda/integration/nsight-compute:/opt/cuda/integration/nsight-systems:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl pythonLocation:/opt/hostedtoolcache/Python/3.7.9/x64] Cmd:[] Action:<nil>}"
   222	[python_cache/test]   ☁  git clone 'https://github.com/actions/cache' # ref=v2
   223	[python_cache/test]   cloning https://github.com/actions/cache to /home/wink/.cache/act/actions-cache@v2
   224	[python_cache/test] Cloned https://github.com/actions/cache to /home/wink/.cache/act/actions-cache@v2
   225	[python_cache/test] Checked out v2
   226	time="2020-11-19T14:23:04-08:00" level=debug msg="Read action &{Cache GitHub Cache artifacts like dependencies and build outputs to improve workflow execution time map[key:{An explicit key for restoring and saving the cache true } path:{A list of files, directories, and wildcard patterns to cache and restore true } restore-keys:{An ordered list of keys to use for restoring the cache if no cache hit occurred for key false } upload-chunk-size:{The chunk size used to split up large files during upload, in bytes false }] map[cache-hit:{A boolean value to indicate an exact match was found for the primary key}] {node12 map[] dist/restore/index.js  [] []} {gray-dark archive}} from '/home/wink/.cache/act/actions-cache@v2/action.yml'"
   227	time="2020-11-19T14:23:04-08:00" level=debug msg="About to run action &{Cache GitHub Cache artifacts like dependencies and build outputs to improve workflow execution time map[key:{An explicit key for restoring and saving the cache true } path:{A list of files, directories, and wildcard patterns to cache and restore true } restore-keys:{An ordered list of keys to use for restoring the cache if no cache hit occurred for key false } upload-chunk-size:{The chunk size used to split up large files during upload, in bytes false }] map[cache-hit:{A boolean value to indicate an exact match was found for the primary key}] {node12 map[] dist/restore/index.js  [] []} {gray-dark archive}}"
   228	time="2020-11-19T14:23:04-08:00" level=debug msg="type=3 actionDir=/home/wink/.cache/act/actions-cache@v2 actionPath= Workdir=/home/wink/prgs/python/projects/act-failing-python-cache ActionCacheDir=/home/wink/.cache/act actionName=actions-cache@v2 containerActionDir=/actions"
   229	time="2020-11-19T14:23:04-08:00" level=debug msg="Removing /home/wink/.cache/act/actions-cache@v2/.gitignore before docker cp"
   230	[python_cache/test]   🐳  docker cp src=/home/wink/.cache/act/actions-cache@v2 dst=/actions/
   231	[python_cache/test] Exec command '[mkdir -p /actions/]'
   232	time="2020-11-19T14:23:04-08:00" level=debug msg="Writing tarball /tmp/act484812733 from /home/wink/.cache/act/actions-cache@v2"
   233	time="2020-11-19T14:23:04-08:00" level=debug msg="Stripping prefix:/home/wink/.cache/act/ src:/home/wink/.cache/act/actions-cache@v2"
   234	[python_cache/test] Extracting content from '/tmp/act484812733' to '/actions/'
   235	time="2020-11-19T14:23:04-08:00" level=debug msg="executing remote job container: [node /actions/actions-cache@v2/dist/restore/index.js]"
   236	[python_cache/test] Exec command '[node /actions/actions-cache@v2/dist/restore/index.js]'
   237	[python_cache/test]   ❓  ::save-state name=CACHE_KEY::Linux-python-
   238	[python_cache/test]   ❗  ::error::Input required and not supplied: path
```

Here is the full debug output:
```
wink@3900x:~/prgs/github-actions/tests/gha-test-set-env-var (main)
$ cat -n act-ga5fc66f.log 
     1	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading environment from /home/wink/prgs/github-actions/tests/gha-test-set-env-var/.env"
     2	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading secrets from "
     3	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading workflows from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.github/workflows'"
     4	time="2020-11-19T16:10:06-08:00" level=debug msg="Reading workflow '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.github/workflows/set-env-var.yml'"
     5	time="2020-11-19T16:10:06-08:00" level=debug msg="Planning event: push"
     6	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
     7	time="2020-11-19T16:10:06-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
     8	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
     9	time="2020-11-19T16:10:06-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    10	time="2020-11-19T16:10:06-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
    11	time="2020-11-19T16:10:06-08:00" level=debug msg="HEAD matches refs/heads/main"
    12	time="2020-11-19T16:10:06-08:00" level=debug msg="using github ref: refs/heads/main"
    13	time="2020-11-19T16:10:06-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    14	time="2020-11-19T16:10:06-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    15	time="2020-11-19T16:10:06-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    16	time="2020-11-19T16:10:06-08:00" level=debug msg="WINK: NewPlanExecutor jobName='test-set-env-var/test' ctx=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e61c0), key:\"dryrun\", val:false}"
    17	time="2020-11-19T16:10:06-08:00" level=debug msg="WINK: NewPlanExecutor ctx v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e61c0), key:\"dryrun\", val:false}"
    18	time="2020-11-19T16:10:06-08:00" level=debug msg="WINK: NewPlanExecutor ctx +v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e61c0), key:\"dryrun\", val:false}"
    19	time="2020-11-19T16:10:06-08:00" level=debug msg="WINK: NewPlanExecutor ctx #v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e61c0), key:\"dryrun\", val:false}"
    20	[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
    21	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    22	time="2020-11-19T16:10:06-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    23	time="2020-11-19T16:10:06-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    24	time="2020-11-19T16:10:06-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    25	time="2020-11-19T16:10:06-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
    26	time="2020-11-19T16:10:06-08:00" level=debug msg="HEAD matches refs/heads/main"
    27	time="2020-11-19T16:10:06-08:00" level=debug msg="using github ref: refs/heads/main"
    28	[test-set-env-var/test]   🐳  docker pull node:12.6-buster-slim
    29	time="2020-11-19T16:10:06-08:00" level=debug msg="Image exists? true"
    30	[test-set-env-var/test]   🐳  docker create image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    31	[test-set-env-var/test] Created container name=act-test-set-env-var-test id=715f3204aefe47f93034fd5f784c59b9215be8b1d713f1ed40d0c7233b9de9dd from image node:12.6-buster-slim
    32	[test-set-env-var/test] ENV ==> [RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
    33	[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    34	[test-set-env-var/test] Starting container: 715f3204aefe47f93034fd5f784c59b9215be8b1d713f1ed40d0c7233b9de9dd
    35	[test-set-env-var/test] Started container: 715f3204aefe47f93034fd5f784c59b9215be8b1d713f1ed40d0c7233b9de9dd
    36	time="2020-11-19T16:10:07-08:00" level=debug msg="Writing entry to tarball workflow/event.json len:2"
    37	time="2020-11-19T16:10:07-08:00" level=debug msg="Writing entry to tarball home/.act len:0"
    38	[test-set-env-var/test] Extracting content to '/github/'
    39	time="2020-11-19T16:10:07-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
    40	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true]"
    41	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_PYTHON-VERSION:3.7]"
    42	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
    43	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true]"
    44	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_PYTHON-VERSION:3.7]"
    45	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
    46	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_PYTHON-VERSION:3.7]"
    47	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
    48	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
    49	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_PYTHON-VERSION v=3.7 env[k]=3.7"
    50	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=3.7"
    51	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    52	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    53	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    54	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    55	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
    56	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
    57	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
    58	time="2020-11-19T16:10:07-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    59	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
    60	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    61	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    62	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    63	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    64	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
    65	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
    66	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
    67	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    68	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    69	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    70	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    71	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7])"
    72	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    73	time="2020-11-19T16:10:07-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
    74	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    75	[test-set-env-var/test] ⭐  Run step1
    76	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    77	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1 actionPath="
    78	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    79	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    80	time="2020-11-19T16:10:07-08:00" level=debug msg="Read action &{set-env-name1  Set enviornemt variable name1 to valu1 map[python-version:{Python version true }] map[] {docker map[]  Dockerfile [] [${{ inputs.python-version }}]} { }} from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1/action.yml'"
    81	time="2020-11-19T16:10:07-08:00" level=debug msg="About to run action &{set-env-name1  Set enviornemt variable name1 to valu1 map[python-version:{Python version true }] map[] {docker map[]  Dockerfile [] [${{ inputs.python-version }}]} { }}"
    82	time="2020-11-19T16:10:07-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1 actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/docker-local-set-env-name1 containerActionDir=/github/workspace"
    83	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:0xc00024cea0} cmd=[${{ inputs.python-version }}] entryPoint=[]"
    84	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    85	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    86	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    87	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
    88	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
    89	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
    90	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
    91	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    92	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    93	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    94	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    95	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7])"
    96	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    97	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'inputs['python-version']' instead of 'inputs.python-version'"
    98	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['python-version']' val='3.7'"
    99	[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1
   100	[test-set-env-var/test] Building image from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1'
   101	time="2020-11-19T16:10:07-08:00" level=debug msg="Creating archive for build context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1' with relative dockerfile 'Dockerfile'"
   102	[test-set-env-var/test] Creating image from context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1' with tag 'act-actions-docker-local-set-env-name1:latest'
   103	[test-set-env-var/test] Step 1/4 : FROM alpine:3.10
   104	[test-set-env-var/test] 
   105	[test-set-env-var/test]  ---> be4e4bea2c2e
   106	[test-set-env-var/test] Step 2/4 : COPY entrypoint.sh /entrypoint.sh
   107	[test-set-env-var/test] 
   108	[test-set-env-var/test]  ---> Using cache
   109	[test-set-env-var/test]  ---> 09c31ff1b03a
   110	[test-set-env-var/test] Step 3/4 : RUN chmod +x /entrypoint.sh
   111	[test-set-env-var/test] 
   112	[test-set-env-var/test]  ---> Using cache
   113	[test-set-env-var/test]  ---> 2d4de53386e5
   114	[test-set-env-var/test] Step 4/4 : ENTRYPOINT ["/entrypoint.sh"]
   115	[test-set-env-var/test] 
   116	[test-set-env-var/test]  ---> Using cache
   117	[test-set-env-var/test]  ---> 24a810818467
   118	[test-set-env-var/test] Unable to handle line: {"aux":{"ID":"sha256:24a8108184674a290f40a90e1855bf6791b55b66306d99315b7797c5a7b93695"}}
   119	[test-set-env-var/test] Successfully built 24a810818467
   120	[test-set-env-var/test] Successfully tagged act-actions-docker-local-set-env-name1:latest
   121	[test-set-env-var/test]   🐳  docker pull act-actions-docker-local-set-env-name1:latest
   122	time="2020-11-19T16:10:07-08:00" level=debug msg="Image exists? true"
   123	[test-set-env-var/test]   🐳  docker create image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
   124	[test-set-env-var/test] Created container name=act-test-set-e-0 id=c396cf055a7c051f8b5c5cde1f6c37100451207b8eab6267b0fc63fdd24fd78b from image act-actions-docker-local-set-env-name1:latest
   125	[test-set-env-var/test] ENV ==> [GITHUB_RUN_NUMBER=1 GITHUB_EVENT_PATH=/github/workflow/event.json ACT=true GITHUB_TOKEN= INPUT_PYTHON-VERSION=3.7 GITHUB_SHA=1363b989691eca01b6905c0b617427a820eec2ea GITHUB_WORKFLOW=test-set-env-var CI=true GITHUB_ACTOR=nektos/act HOME=/github/home GITHUB_EVENT_NAME=push GITHUB_RUN_ID=1 GITHUB_ACTIONS=true GITHUB_REPOSITORY=winksaville/gha-test-set-env-var GITHUB_ACTION=0 GITHUB_WORKSPACE=/github/workspace GITHUB_REF=refs/heads/main RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
   126	[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
   127	[test-set-env-var/test] Starting container: c396cf055a7c051f8b5c5cde1f6c37100451207b8eab6267b0fc63fdd24fd78b
   128	[test-set-env-var/test]   | first-param=3.7
   129	[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
   130	[test-set-env-var/test] Started container: c396cf055a7c051f8b5c5cde1f6c37100451207b8eab6267b0fc63fdd24fd78b
   131	[test-set-env-var/test] Return status: 0
   132	[test-set-env-var/test] Removed container: c396cf055a7c051f8b5c5cde1f6c37100451207b8eab6267b0fc63fdd24fd78b
   133	[test-set-env-var/test]   ✅  Success - step1
   134	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:0xc00024cea0} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1]"
   135	time="2020-11-19T16:10:07-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
   136	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true name1:value1]"
   137	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   138	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
   139	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true name1:value1]"
   140	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   141	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   142	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }} name1:value1]"
   143	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   144	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   145	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=name1 v=value1 env[k]=value1"
   146	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=value1"
   147	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-NAME v=${{ env.name1 }} env[k]=${{ env.name1 }}"
   148	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   149	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   150	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]="
   151	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-VALUE v=${{ runner.os }}-python-${{ env.name1 }} env[k]=${{ runner.os }}-python-${{ env.name1 }}"
   152	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   153	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   154	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   155	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   156	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=Linux-python-"
   157	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   158	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   159	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   160	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   161	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
   162	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
   163	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
   164	time="2020-11-19T16:10:07-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   165	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   166	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   167	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   168	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   169	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   170	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
   171	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
   172	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
   173	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   174	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   175	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   176	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   177	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   178	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   179	time="2020-11-19T16:10:07-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   180	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   181	[test-set-env-var/test] ⭐  Run step2
   182	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   183	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var actionPath="
   184	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   185	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   186	time="2020-11-19T16:10:07-08:00" level=debug msg="Read action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }} from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var/action.yml'"
   187	time="2020-11-19T16:10:07-08:00" level=debug msg="About to run action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }}"
   188	time="2020-11-19T16:10:07-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/docker-local-set-env-var containerActionDir=/github/workspace"
   189	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0004181a0} cmd=[${{ inputs.env-name }} ${{ inputs.env-value }}] entryPoint=[]"
   190	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   191	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   192	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   193	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   194	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
   195	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
   196	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
   197	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   198	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   199	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   200	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   201	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   202	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   203	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'inputs['env-name']' instead of 'inputs.env-name'"
   204	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-name']' val='${{ env.name1 }}'"
   205	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   206	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   207	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'inputs['env-value']' instead of 'inputs.env-value'"
   208	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-value']' val='${{ runner.os }}-python-${{ env.name1 }}'"
   209	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   210	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   211	time="2020-11-19T16:10:07-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   212	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   213	[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-var:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var
   214	[test-set-env-var/test] Building image from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var'
   215	time="2020-11-19T16:10:07-08:00" level=debug msg="Creating archive for build context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var' with relative dockerfile 'Dockerfile'"
   216	[test-set-env-var/test] Creating image from context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-var' with tag 'act-actions-docker-local-set-env-var:latest'
   217	[test-set-env-var/test] Step 1/4 : FROM alpine:3.10
   218	[test-set-env-var/test] 
   219	[test-set-env-var/test]  ---> be4e4bea2c2e
   220	[test-set-env-var/test] Step 2/4 : COPY entrypoint.sh /entrypoint.sh
   221	[test-set-env-var/test] 
   222	[test-set-env-var/test]  ---> Using cache
   223	[test-set-env-var/test]  ---> 78dd491bb1c5
   224	[test-set-env-var/test] Step 3/4 : RUN chmod +x /entrypoint.sh
   225	[test-set-env-var/test] 
   226	[test-set-env-var/test]  ---> Using cache
   227	[test-set-env-var/test]  ---> 795db4cae209
   228	[test-set-env-var/test] Step 4/4 : ENTRYPOINT ["/entrypoint.sh"]
   229	[test-set-env-var/test] 
   230	[test-set-env-var/test]  ---> Using cache
   231	[test-set-env-var/test]  ---> 38eb35b73656
   232	[test-set-env-var/test] Unable to handle line: {"aux":{"ID":"sha256:38eb35b73656292c582bc24f1d9c1d4e16b8b9068ec0cacc665b5bb50e4a8214"}}
   233	[test-set-env-var/test] Successfully built 38eb35b73656
   234	[test-set-env-var/test] Successfully tagged act-actions-docker-local-set-env-var:latest
   235	[test-set-env-var/test]   🐳  docker pull act-actions-docker-local-set-env-var:latest
   236	time="2020-11-19T16:10:07-08:00" level=debug msg="Image exists? true"
   237	[test-set-env-var/test]   🐳  docker create image=act-actions-docker-local-set-env-var:latest entrypoint=[] cmd=["value1" "Linux-python-value1"]
   238	[test-set-env-var/test] Created container name=act-test-set-e-1 id=9b006316c3476a8f7fa438fee9a3bb09d4bc187acb54104fbcb862ab2c357b39 from image act-actions-docker-local-set-env-var:latest
   239	[test-set-env-var/test] ENV ==> [GITHUB_EVENT_PATH=/github/workflow/event.json GITHUB_RUN_ID=1 GITHUB_EVENT_NAME=push GITHUB_REPOSITORY=winksaville/gha-test-set-env-var GITHUB_SHA=1363b989691eca01b6905c0b617427a820eec2ea CI=true GITHUB_WORKSPACE=/github/workspace INPUT_ENV-VALUE=Linux-python- HOME=/github/home ACT=true GITHUB_ACTIONS=true GITHUB_WORKFLOW=test-set-env-var GITHUB_ACTION=1 GITHUB_REF=refs/heads/main name1=value1 GITHUB_RUN_NUMBER=1 INPUT_ENV-NAME= GITHUB_ACTOR=nektos/act GITHUB_TOKEN= RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
   240	[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-var:latest entrypoint=[] cmd=["value1" "Linux-python-value1"]
   241	[test-set-env-var/test] Starting container: 9b006316c3476a8f7fa438fee9a3bb09d4bc187acb54104fbcb862ab2c357b39
   242	[test-set-env-var/test]   ⚙  ::set-env:: value1=Linux-python-value1
   243	[test-set-env-var/test] Started container: 9b006316c3476a8f7fa438fee9a3bb09d4bc187acb54104fbcb862ab2c357b39
   244	[test-set-env-var/test] Return status: 0
   245	[test-set-env-var/test] Removed container: 9b006316c3476a8f7fa438fee9a3bb09d4bc187acb54104fbcb862ab2c357b39
   246	[test-set-env-var/test]   ✅  Success - step2
   247	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0004181a0} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1 value1:Linux-python-value1]"
   248	time="2020-11-19T16:10:07-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
   249	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true name1:value1 value1:Linux-python-value1]"
   250	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[]"
   251	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
   252	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true name1:value1 value1:Linux-python-value1]"
   253	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[]"
   254	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   255	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true name1:value1 value1:Linux-python-value1]"
   256	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   257	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   258	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=name1 v=value1 env[k]=value1"
   259	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=value1"
   260	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=value1 v=Linux-python-value1 env[k]=Linux-python-value1"
   261	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=Linux-python-value1"
   262	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   263	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   264	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   265	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   266	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
   267	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
   268	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
   269	time="2020-11-19T16:10:07-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1]"
   270	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   271	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   272	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   273	time="2020-11-19T16:10:07-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   274	time="2020-11-19T16:10:07-08:00" level=debug msg="Found revision: 1363b989691eca01b6905c0b617427a820eec2ea\n"
   275	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD points to '1363b989691eca01b6905c0b617427a820eec2ea'"
   276	time="2020-11-19T16:10:07-08:00" level=debug msg="HEAD matches refs/heads/main"
   277	time="2020-11-19T16:10:07-08:00" level=debug msg="using github ref: refs/heads/main"
   278	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1 value1:Linux-python-value1]"
   279	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1 value1:Linux-python-value1])"
   280	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   281	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1]"
   282	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1])"
   283	time="2020-11-19T16:10:07-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   284	time="2020-11-19T16:10:07-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   285	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   286	[test-set-env-var/test] ⭐  Run done
   287	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   288	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: setupShellCommand sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   289	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   290	time="2020-11-19T16:10:07-08:00" level=debug msg="Wrote command 'echo Done' to 'workflow/2'"
   291	time="2020-11-19T16:10:07-08:00" level=debug msg="Writing entry to tarball workflow/2 len:9"
   292	[test-set-env-var/test] Extracting content to '/github/'
   293	[test-set-env-var/test] Exec command '[bash --noprofile --norc -eo pipefail /github/workflow/2]'
   294	[test-set-env-var/test]   | Done
   295	[test-set-env-var/test]   ✅  Success - done
   296	time="2020-11-19T16:10:07-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:1363b989691eca01b6905c0b617427a820eec2ea GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[bash --noprofile --norc -eo pipefail /github/workflow/2] Action:<nil>} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1 value1:Linux-python-value1]"
   297	[test-set-env-var/test] Removed container: 715f3204aefe47f93034fd5f784c59b9215be8b1d713f1ed40d0c7233b9de9dd
   298	[test-set-env-var/test]   🐳  docker volume rm act-test-set-env-var-test```
