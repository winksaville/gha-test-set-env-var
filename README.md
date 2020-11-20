# Simpler test for showing issue 416 on act

See [act](https://github.com/nektos/act) issue [#416](https://github.com/nektos/act/issues/416).

Finally, creating [winksaville/js-set-env-var](https://github.com/winksaville/gha-js-set-env-var)
I duplicated issue 416 with a "simple" test.

# With fix-issue-416

```
wink@3900x:~/prgs/nektos/forks/act (fix-issue-416)
$ git log --pretty=oneline -1
086fc08b810a3618f8c5ab3da9b7112dd601ac99 (HEAD -> fix-issue-416) WIP: Add simpler test
```

Here is the output:
```
wink@3900x:~/prgs/github-actions/tests/gha-test-set-env-var (main)
$ ~/prgs/nektos/forks/act/dist/local/act
[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
setupEnv: map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]
[test-set-env-var/test] ⭐  Run step1
[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1
[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
| first-param=3.7
[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
[test-set-env-var/test]   ✅  Success - step1
setupEnv: map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME:value1 INPUT_ENV-VALUE:Linux-python-value1 name1:value1]
[test-set-env-var/test] ⭐  Run step2
[test-set-env-var/test]   ☁  git clone 'https://github.com/winksaville/gha-js-set-env-var' # ref=main
[test-set-env-var/test]   🐳  docker cp src=/home/wink/.cache/act/winksaville-gha-js-set-env-var@main dst=/actions/
[test-set-env-var/test]   ⚙  ::set-env:: value1=Linux-python-value1
[test-set-env-var/test]   ✅  Success - step2
setupEnv: map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1]
[test-set-env-var/test] ⭐  Run done
| Done
[test-set-env-var/test]   ✅  Success - done
```

# Fails with debug-act-failing-python-cache

```
wink@3900x:~/prgs/nektos/forks/act (debug-act-failing-python-cache)
$ git log --pretty=oneline -1
86a8125f4e3179a42114be33d111ac3629d8fb3e (HEAD -> debug-act-failing-python-cache, origin/debug-act-failing-python-cache) Add debug NewGitCloneExecutor and CloneIfRequired
```

Here is the failing non-verbose and verbose logs
```
wink@3900x:~/prgs/github-actions/tests/gha-test-set-env-var (main)
$ ~/prgs/nektos/forks/act/dist/local/act
[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[test-set-env-var/test] ⭐  Run step1
[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1
[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
| first-param=3.7
[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
[test-set-env-var/test]   ✅  Success - step1
[test-set-env-var/test] ⭐  Run step2
[test-set-env-var/test]   ☁  git clone 'https://github.com/winksaville/gha-js-set-env-var' # ref=main
[test-set-env-var/test]   🐳  docker cp src=/home/wink/.cache/act/winksaville-gha-js-set-env-var@main dst=/actions/
[test-set-env-var/test]   ❗  ::error::env-name is empty
[test-set-env-var/test]   ❌  Failure - step2
Error: exit with `FAILURE`: 1

wink@3900x:~/prgs/github-actions/tests/gha-test-set-env-var (main)
$ ~/prgs/nektos/forks/act/dist/local/act -v > act-g86a8125-js-set-env-var.log 2>&1

wink@3900x:~/prgs/github-actions/tests/gha-test-set-env-var (main)
$ cat -n act-g86a8125-js-set-env-var.log 
     1	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading environment from /home/wink/prgs/github-actions/tests/gha-test-set-env-var/.env"
     2	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading secrets from "
     3	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading workflows from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.github/workflows'"
     4	time="2020-11-20T12:44:00-08:00" level=debug msg="Reading workflow '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.github/workflows/set-env-var.yml'"
     5	time="2020-11-20T12:44:00-08:00" level=debug msg="Planning event: push"
     6	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
     7	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
     8	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
     9	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    10	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
    11	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
    12	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
    13	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    14	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    15	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    16	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: NewPlanExecutor jobName='test-set-env-var/test' ctx=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    17	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: NewPlanExecutor ctx v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    18	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: NewPlanExecutor ctx +v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    19	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: NewPlanExecutor ctx #v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    20	[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
    21	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    22	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    23	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    24	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    25	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
    26	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
    27	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
    28	[test-set-env-var/test]   🐳  docker pull node:12.6-buster-slim
    29	time="2020-11-20T12:44:00-08:00" level=debug msg="Image exists? true"
    30	[test-set-env-var/test] Removed container: 8ce154d274cfb4c28d7f3517a0d519e59958e23247619f53e27648ca6b3d7121
    31	[test-set-env-var/test]   🐳  docker volume rm act-test-set-env-var-test
    32	[test-set-env-var/test]   🐳  docker create image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    33	[test-set-env-var/test] Created container name=act-test-set-env-var-test id=e61f15496fb94f5840d96fa975307263c1c31f4755707c363c76bdb4e3649777 from image node:12.6-buster-slim
    34	[test-set-env-var/test] ENV ==> [RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
    35	[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    36	[test-set-env-var/test] Starting container: e61f15496fb94f5840d96fa975307263c1c31f4755707c363c76bdb4e3649777
    37	[test-set-env-var/test] Started container: e61f15496fb94f5840d96fa975307263c1c31f4755707c363c76bdb4e3649777
    38	time="2020-11-20T12:44:00-08:00" level=debug msg="Writing entry to tarball workflow/event.json len:2"
    39	time="2020-11-20T12:44:00-08:00" level=debug msg="Writing entry to tarball home/.act len:0"
    40	[test-set-env-var/test] Extracting content to '/github/'
    41	time="2020-11-20T12:44:00-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
    42	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true]"
    43	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_PYTHON-VERSION:3.7]"
    44	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
    45	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true]"
    46	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_PYTHON-VERSION:3.7]"
    47	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
    48	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_PYTHON-VERSION:3.7]"
    49	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_PYTHON-VERSION v=3.7 env[k]=3.7"
    50	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=3.7"
    51	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
    52	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
    53	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    54	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    55	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    56	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    57	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
    58	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
    59	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
    60	time="2020-11-20T12:44:00-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    61	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
    62	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    63	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    64	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    65	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    66	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
    67	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
    68	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
    69	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    70	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    71	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    72	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    73	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7])"
    74	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    75	time="2020-11-20T12:44:00-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
    76	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    77	[test-set-env-var/test] ⭐  Run step1
    78	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    79	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1 actionPath="
    80	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    81	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    82	time="2020-11-20T12:44:00-08:00" level=debug msg="Read action &{set-env-name1  Set enviornemt variable name1 to valu1 map[python-version:{Python version true }] map[] {docker map[]  Dockerfile [] [${{ inputs.python-version }}]} { }} from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1/action.yml'"
    83	time="2020-11-20T12:44:00-08:00" level=debug msg="About to run action &{set-env-name1  Set enviornemt variable name1 to valu1 map[python-version:{Python version true }] map[] {docker map[]  Dockerfile [] [${{ inputs.python-version }}]} { }}"
    84	time="2020-11-20T12:44:00-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1 actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/docker-local-set-env-name1 containerActionDir=/github/workspace"
    85	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:0xc0000c3380} cmd=[${{ inputs.python-version }}] entryPoint=[]"
    86	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    87	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    88	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    89	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
    90	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
    91	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
    92	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
    93	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    94	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    95	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    96	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    97	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7])"
    98	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    99	time="2020-11-20T12:44:00-08:00" level=debug msg="Evaluating 'inputs['python-version']' instead of 'inputs.python-version'"
   100	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['python-version']' val='3.7'"
   101	[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1
   102	[test-set-env-var/test] Building image from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1'
   103	time="2020-11-20T12:44:00-08:00" level=debug msg="Creating archive for build context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1' with relative dockerfile 'Dockerfile'"
   104	[test-set-env-var/test] Creating image from context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1' with tag 'act-actions-docker-local-set-env-name1:latest'
   105	[test-set-env-var/test] Step 1/4 : FROM alpine:3.10
   106	[test-set-env-var/test] 
   107	[test-set-env-var/test]  ---> be4e4bea2c2e
   108	[test-set-env-var/test] Step 2/4 : COPY entrypoint.sh /entrypoint.sh
   109	[test-set-env-var/test] 
   110	[test-set-env-var/test]  ---> Using cache
   111	[test-set-env-var/test]  ---> 09c31ff1b03a
   112	[test-set-env-var/test] Step 3/4 : RUN chmod +x /entrypoint.sh
   113	[test-set-env-var/test] 
   114	[test-set-env-var/test]  ---> Using cache
   115	[test-set-env-var/test]  ---> 2d4de53386e5
   116	[test-set-env-var/test] Step 4/4 : ENTRYPOINT ["/entrypoint.sh"]
   117	[test-set-env-var/test] 
   118	[test-set-env-var/test]  ---> Using cache
   119	[test-set-env-var/test]  ---> 24a810818467
   120	[test-set-env-var/test] Unable to handle line: {"aux":{"ID":"sha256:24a8108184674a290f40a90e1855bf6791b55b66306d99315b7797c5a7b93695"}}
   121	[test-set-env-var/test] Successfully built 24a810818467
   122	[test-set-env-var/test] Successfully tagged act-actions-docker-local-set-env-name1:latest
   123	[test-set-env-var/test]   🐳  docker pull act-actions-docker-local-set-env-name1:latest
   124	time="2020-11-20T12:44:00-08:00" level=debug msg="Image exists? true"
   125	[test-set-env-var/test]   🐳  docker create image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
   126	[test-set-env-var/test] Created container name=act-test-set-e-0 id=e108c298780ec0b767ce4dc9fcb8d98beee43749cf832e3aef7edda19b63df78 from image act-actions-docker-local-set-env-name1:latest
   127	[test-set-env-var/test] ENV ==> [GITHUB_EVENT_PATH=/github/workflow/event.json GITHUB_REPOSITORY=winksaville/gha-test-set-env-var HOME=/github/home GITHUB_WORKFLOW=test-set-env-var GITHUB_RUN_NUMBER=1 GITHUB_EVENT_NAME=push GITHUB_RUN_ID=1 GITHUB_ACTOR=nektos/act INPUT_PYTHON-VERSION=3.7 GITHUB_WORKSPACE=/github/workspace GITHUB_REF=refs/heads/main GITHUB_TOKEN= GITHUB_ACTION=0 CI=true GITHUB_ACTIONS=true ACT=true GITHUB_SHA=0be16c1fd1abc9d8547a6595a0ab29be214087ff RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
   128	[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
   129	[test-set-env-var/test] Starting container: e108c298780ec0b767ce4dc9fcb8d98beee43749cf832e3aef7edda19b63df78
   130	[test-set-env-var/test]   | first-param=3.7
   131	[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
   132	[test-set-env-var/test] Started container: e108c298780ec0b767ce4dc9fcb8d98beee43749cf832e3aef7edda19b63df78
   133	[test-set-env-var/test] Return status: 0
   134	[test-set-env-var/test] Removed container: e108c298780ec0b767ce4dc9fcb8d98beee43749cf832e3aef7edda19b63df78
   135	[test-set-env-var/test]   ✅  Success - step1
   136	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:0xc0000c3380} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1]"
   137	time="2020-11-20T12:44:00-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
   138	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true name1:value1]"
   139	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   140	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
   141	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true name1:value1]"
   142	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   143	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   144	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }} name1:value1]"
   145	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-VALUE v=${{ runner.os }}-python-${{ env.name1 }} env[k]=${{ runner.os }}-python-${{ env.name1 }}"
   146	time="2020-11-20T12:44:00-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   147	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   148	time="2020-11-20T12:44:00-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   149	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   150	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=Linux-python-"
   151	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   152	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   153	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=name1 v=value1 env[k]=value1"
   154	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=value1"
   155	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-NAME v=${{ env.name1 }} env[k]=${{ env.name1 }}"
   156	time="2020-11-20T12:44:00-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   157	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   158	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]="
   159	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   160	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
   161	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   162	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
   163	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
   164	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
   165	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
   166	time="2020-11-20T12:44:00-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   167	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   168	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   169	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
   170	time="2020-11-20T12:44:00-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   171	time="2020-11-20T12:44:00-08:00" level=debug msg="Found revision: 0be16c1fd1abc9d8547a6595a0ab29be214087ff\n"
   172	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD points to '0be16c1fd1abc9d8547a6595a0ab29be214087ff'"
   173	time="2020-11-20T12:44:00-08:00" level=debug msg="HEAD matches refs/heads/main"
   174	time="2020-11-20T12:44:00-08:00" level=debug msg="using github ref: refs/heads/main"
   175	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   176	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   177	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   178	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   179	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   180	time="2020-11-20T12:44:00-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   181	time="2020-11-20T12:44:00-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   182	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   183	[test-set-env-var/test] ⭐  Run step2
   184	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   185	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>} actionDir=/home/wink/.cache/act/winksaville-gha-js-set-env-var@main actionPath="
   186	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   187	time="2020-11-20T12:44:00-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   188	[test-set-env-var/test]   ☁  git clone 'https://github.com/winksaville/gha-js-set-env-var' # ref=main
   189	[test-set-env-var/test]   cloning https://github.com/winksaville/gha-js-set-env-var to /home/wink/.cache/act/winksaville-gha-js-set-env-var@main
   190	[test-set-env-var/test] retF plumbing.ReferenceName refName=refs/heads/main
   191	[test-set-env-var/test] CloneIfRequired:+ refName=refs/heads/main
   192	[test-set-env-var/test] CloneIfRequired:- T r=*git.Repository r=&{0xc0000f83c0 map[] 0xc000424160}
   193	[test-set-env-var/test] Call plumbing.Revision(main)
   194	[test-set-env-var/test] Call r.ResolveRevision(main)
   195	[test-set-env-var/test] retF r.ResolveRevision(main) hash=8daf5e002faa1d71eb54b58b7b4afdc3df3abed3 err=<nil>
   196	[test-set-env-var/test] Provided ref is not a sha. Checking out branch before pulling changes
   197	[test-set-env-var/test] Cloned https://github.com/winksaville/gha-js-set-env-var to /home/wink/.cache/act/winksaville-gha-js-set-env-var@main
   198	[test-set-env-var/test] Checked out main
   199	time="2020-11-20T12:44:01-08:00" level=debug msg="Read action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {node12 map[] index.js  [] []} { }} from '/home/wink/.cache/act/winksaville-gha-js-set-env-var@main/action.yml'"
   200	time="2020-11-20T12:44:01-08:00" level=debug msg="About to run action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {node12 map[] index.js  [] []} { }}"
   201	time="2020-11-20T12:44:01-08:00" level=debug msg="type=3 actionDir=/home/wink/.cache/act/winksaville-gha-js-set-env-var@main actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=winksaville-gha-js-set-env-var@main containerActionDir=/actions"
   202	time="2020-11-20T12:44:01-08:00" level=debug msg="Removing /home/wink/.cache/act/winksaville-gha-js-set-env-var@main/.gitignore before docker cp"
   203	[test-set-env-var/test]   🐳  docker cp src=/home/wink/.cache/act/winksaville-gha-js-set-env-var@main dst=/actions/
   204	[test-set-env-var/test] Exec command '[mkdir -p /actions/]'
   205	time="2020-11-20T12:44:01-08:00" level=debug msg="Writing tarball /tmp/act081270699 from /home/wink/.cache/act/winksaville-gha-js-set-env-var@main"
   206	time="2020-11-20T12:44:01-08:00" level=debug msg="Stripping prefix:/home/wink/.cache/act/ src:/home/wink/.cache/act/winksaville-gha-js-set-env-var@main"
   207	[test-set-env-var/test] Extracting content from '/tmp/act081270699' to '/actions/'
   208	time="2020-11-20T12:44:01-08:00" level=debug msg="executing remote job container: [node /actions/winksaville-gha-js-set-env-var@main/index.js]"
   209	[test-set-env-var/test] Exec command '[node /actions/winksaville-gha-js-set-env-var@main/index.js]'
   210	[test-set-env-var/test]   ❗  ::error::env-name is empty
   211	[test-set-env-var/test]   ❌  Failure - step2
   212	time="2020-11-20T12:44:02-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:0be16c1fd1abc9d8547a6595a0ab29be214087ff GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc000525520} rc.StepResults=&{Success:false Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1]"
   213	time="2020-11-20T12:44:02-08:00" level=debug msg="exit with `FAILURE`: 1"
   214	time="2020-11-20T12:44:02-08:00" level=debug msg="exit with `FAILURE`: 1"
   215	Error: exit with `FAILURE`: 1

```