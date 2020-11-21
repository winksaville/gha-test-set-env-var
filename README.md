# Simpler test for showing issue 416 on act

See [act](https://github.com/nektos/act) issue [#416](https://github.com/nektos/act/issues/416).

Creating ./actions/js-local-set-env-var I duplicated issue 416 with a "simple" test.

# With fix-issue-416
```
wink@3900x:~/prgs/nektos/forks/act (fix-issue-416)
$ git log --pretty=oneline -1
086fc08b810a3618f8c5ab3da9b7112dd601ac99 (HEAD -> fix-issue-416) WIP: Add simpler test
```

Here is the output:
```
wink@3900x:~/prgs/github-actions/tests/ghwf-test-set-env-var (main)
$ ~/prgs/nektos/forks/act/dist/local/act
[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[test-set-env-var/test]   🐳  docker cp src=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/. dst=/github/workspace
setupEnv: map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]
[test-set-env-var/test] ⭐  Run step0
[test-set-env-var/test]   ✅  Success - step0
setupEnv: map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]
[test-set-env-var/test] ⭐  Run step1
[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1
[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=[]
| first-param=
[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
[test-set-env-var/test]   ✅  Success - step1
setupEnv: map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME:value1 INPUT_ENV-VALUE:Linux-python-value1 name1:value1]
[test-set-env-var/test] ⭐  Run step2
[test-set-env-var/test]   ⚙  ::set-env:: value1=Linux-python-value1
[test-set-env-var/test]   ✅  Success - step2
setupEnv: map[ACT:true CI:true GITHUB_ACTION:3 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1]
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
wink@3900x:~/prgs/github-actions/tests/ghwf-test-set-env-var (main)
$ ~/prgs/nektos/forks/act/dist/local/act
[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[test-set-env-var/test]   🐳  docker cp src=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/. dst=/github/workspace
[test-set-env-var/test] ⭐  Run step0
[test-set-env-var/test]   ✅  Success - step0
[test-set-env-var/test] ⭐  Run step1
[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1
[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=[]
| first-param=
[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
[test-set-env-var/test]   ✅  Success - step1
[test-set-env-var/test] ⭐  Run step2
[test-set-env-var/test]   ❗  ::error::env-name is empty
[test-set-env-var/test]   ❌  Failure - step2
Error: exit with `FAILURE`: 1

wink@3900x:~/prgs/github-actions/tests/ghwf-test-set-env-var (main)
$ ~/prgs/nektos/forks/act/dist/local/act -v > act-g86a8125-local-js-set-env-var.log 2>&1

wink@3900x:~/prgs/github-actions/tests/ghwf-test-set-env-var (main)
$ cat -n act-g86a8125-local-js-set-env-var.log 
     1	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading environment from /home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.env"
     2	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading secrets from "
     3	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading workflows from '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.github/workflows'"
     4	time="2020-11-21T08:19:28-08:00" level=debug msg="Reading workflow '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.github/workflows/set-env-var.yml'"
     5	time="2020-11-21T08:19:28-08:00" level=debug msg="Planning event: push"
     6	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
     7	time="2020-11-21T08:19:28-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
     8	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
     9	time="2020-11-21T08:19:28-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    10	time="2020-11-21T08:19:28-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
    11	time="2020-11-21T08:19:28-08:00" level=debug msg="HEAD matches refs/heads/main"
    12	time="2020-11-21T08:19:28-08:00" level=debug msg="using github ref: refs/heads/main"
    13	time="2020-11-21T08:19:28-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    14	time="2020-11-21T08:19:28-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    15	time="2020-11-21T08:19:28-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    16	time="2020-11-21T08:19:28-08:00" level=debug msg="WINK: NewPlanExecutor jobName='test-set-env-var/test' ctx=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    17	time="2020-11-21T08:19:28-08:00" level=debug msg="WINK: NewPlanExecutor ctx v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    18	time="2020-11-21T08:19:28-08:00" level=debug msg="WINK: NewPlanExecutor ctx +v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    19	time="2020-11-21T08:19:28-08:00" level=debug msg="WINK: NewPlanExecutor ctx #v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003d6180), key:\"dryrun\", val:false}"
    20	[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
    21	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    22	time="2020-11-21T08:19:28-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    23	time="2020-11-21T08:19:28-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    24	time="2020-11-21T08:19:28-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    25	time="2020-11-21T08:19:28-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
    26	time="2020-11-21T08:19:28-08:00" level=debug msg="HEAD matches refs/heads/main"
    27	time="2020-11-21T08:19:28-08:00" level=debug msg="using github ref: refs/heads/main"
    28	[test-set-env-var/test]   🐳  docker pull node:12.6-buster-slim
    29	time="2020-11-21T08:19:28-08:00" level=debug msg="Image exists? true"
    30	[test-set-env-var/test] Removed container: ea2a7ff6ac709ff7476ab1b5ca9296e38a2ba8dd0397580edfa19aff5d2673f5
    31	[test-set-env-var/test]   🐳  docker volume rm act-test-set-env-var-test
    32	[test-set-env-var/test]   🐳  docker create image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    33	[test-set-env-var/test] Created container name=act-test-set-env-var-test id=c1574210e43ee22dea3c45f60bb46ac4d9c60e2ca9e58ce267f517d50c559758 from image node:12.6-buster-slim
    34	[test-set-env-var/test] ENV ==> [RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
    35	[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    36	[test-set-env-var/test] Starting container: c1574210e43ee22dea3c45f60bb46ac4d9c60e2ca9e58ce267f517d50c559758
    37	[test-set-env-var/test] Started container: c1574210e43ee22dea3c45f60bb46ac4d9c60e2ca9e58ce267f517d50c559758
    38	[test-set-env-var/test]   🐳  docker cp src=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/. dst=/github/workspace
    39	[test-set-env-var/test] Exec command '[mkdir -p /github/workspace]'
    40	time="2020-11-21T08:19:29-08:00" level=debug msg="Writing tarball /tmp/act723996410 from /home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/."
    41	time="2020-11-21T08:19:29-08:00" level=debug msg="Stripping prefix:/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/ src:/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/."
    42	[test-set-env-var/test] Extracting content from '/tmp/act723996410' to '/github/workspace'
    43	time="2020-11-21T08:19:29-08:00" level=debug msg="Writing entry to tarball workflow/event.json len:2"
    44	time="2020-11-21T08:19:29-08:00" level=debug msg="Writing entry to tarball home/.act len:0"
    45	[test-set-env-var/test] Extracting content to '/github/'
    46	time="2020-11-21T08:19:29-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
    47	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true]"
    48	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[]"
    49	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
    50	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true]"
    51	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[]"
    52	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
    53	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true]"
    54	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
    55	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
    56	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    57	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    58	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    59	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    60	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
    61	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
    62	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
    63	time="2020-11-21T08:19:29-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]"
    64	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
    65	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    66	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    67	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    68	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    69	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
    70	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
    71	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
    72	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    73	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    74	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    75	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]"
    76	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home])"
    77	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    78	time="2020-11-21T08:19:29-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
    79	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step0 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
    80	[test-set-env-var/test] ⭐  Run step0
    81	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step0 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
    82	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    83	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    84	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
    85	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
    86	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
    87	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
    88	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
    89	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step0 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
    90	[test-set-env-var/test] Skipping actions/checkout
    91	[test-set-env-var/test]   ✅  Success - step0
    92	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step0 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true]"
    93	time="2020-11-21T08:19:29-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
    94	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true]"
    95	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[]"
    96	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
    97	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true]"
    98	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[]"
    99	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   100	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true]"
   101	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   102	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   103	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   104	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   105	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   106	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   107	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
   108	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
   109	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
   110	time="2020-11-21T08:19:29-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]"
   111	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   112	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   113	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   114	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   115	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   116	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
   117	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
   118	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
   119	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
   120	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
   121	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   122	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]"
   123	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home])"
   124	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   125	time="2020-11-21T08:19:29-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   126	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
   127	[test-set-env-var/test] ⭐  Run step1
   128	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
   129	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1 actionPath="
   130	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
   131	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:<nil>}"
   132	time="2020-11-21T08:19:29-08:00" level=debug msg="Read action &{set-env-name1  Set enviornemt variable name1 to valu1 map[] map[] {docker map[]  Dockerfile [] []} { }} from '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1/action.yml'"
   133	time="2020-11-21T08:19:29-08:00" level=debug msg="About to run action &{set-env-name1  Set enviornemt variable name1 to valu1 map[] map[] {docker map[]  Dockerfile [] []} { }}"
   134	time="2020-11-21T08:19:29-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1 actionPath= Workdir=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/docker-local-set-env-name1 containerActionDir=/github/workspace"
   135	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:0xc0002a44e0} cmd=[] entryPoint=[]"
   136	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   137	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   138	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   139	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   140	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
   141	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
   142	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
   143	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
   144	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
   145	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   146	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home]"
   147	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home])"
   148	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   149	[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1
   150	[test-set-env-var/test] Building image from '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1'
   151	time="2020-11-21T08:19:29-08:00" level=debug msg="Creating archive for build context dir '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1' with relative dockerfile 'Dockerfile'"
   152	[test-set-env-var/test] Creating image from context dir '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/docker-local-set-env-name1' with tag 'act-actions-docker-local-set-env-name1:latest'
   153	[test-set-env-var/test] Step 1/4 : FROM alpine:3.10
   154	[test-set-env-var/test] 
   155	[test-set-env-var/test]  ---> be4e4bea2c2e
   156	[test-set-env-var/test] Step 2/4 : COPY entrypoint.sh /entrypoint.sh
   157	[test-set-env-var/test] 
   158	[test-set-env-var/test]  ---> Using cache
   159	[test-set-env-var/test]  ---> 09c31ff1b03a
   160	[test-set-env-var/test] Step 3/4 : RUN chmod +x /entrypoint.sh
   161	[test-set-env-var/test] 
   162	[test-set-env-var/test]  ---> Using cache
   163	[test-set-env-var/test]  ---> 2d4de53386e5
   164	[test-set-env-var/test] Step 4/4 : ENTRYPOINT ["/entrypoint.sh"]
   165	[test-set-env-var/test] 
   166	[test-set-env-var/test]  ---> Using cache
   167	[test-set-env-var/test]  ---> 24a810818467
   168	[test-set-env-var/test] Unable to handle line: {"aux":{"ID":"sha256:24a8108184674a290f40a90e1855bf6791b55b66306d99315b7797c5a7b93695"}}
   169	[test-set-env-var/test] Successfully built 24a810818467
   170	[test-set-env-var/test] Successfully tagged act-actions-docker-local-set-env-name1:latest
   171	[test-set-env-var/test]   🐳  docker pull act-actions-docker-local-set-env-name1:latest
   172	time="2020-11-21T08:19:29-08:00" level=debug msg="Image exists? true"
   173	[test-set-env-var/test]   🐳  docker create image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=[]
   174	[test-set-env-var/test] Created container name=act-test-set-e-1 id=57029ded1667b91b7b0d92accf65fd2c732c57211da6591ab9f750dd1929abef from image act-actions-docker-local-set-env-name1:latest
   175	[test-set-env-var/test] ENV ==> [GITHUB_EVENT_PATH=/github/workflow/event.json CI=true GITHUB_ACTIONS=true GITHUB_SHA=2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_EVENT_NAME=push GITHUB_WORKFLOW=test-set-env-var ACT=true GITHUB_ACTION=1 GITHUB_WORKSPACE=/github/workspace GITHUB_ACTOR=nektos/act GITHUB_REF=refs/heads/main GITHUB_RUN_NUMBER=1 HOME=/github/home GITHUB_TOKEN= GITHUB_RUN_ID=1 GITHUB_REPOSITORY=winksaville/gha-test-set-env-var RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
   176	[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=[]
   177	[test-set-env-var/test] Starting container: 57029ded1667b91b7b0d92accf65fd2c732c57211da6591ab9f750dd1929abef
   178	[test-set-env-var/test]   | first-param=
   179	[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
   180	[test-set-env-var/test] Started container: 57029ded1667b91b7b0d92accf65fd2c732c57211da6591ab9f750dd1929abef
   181	[test-set-env-var/test] Return status: 0
   182	[test-set-env-var/test] Removed container: 57029ded1667b91b7b0d92accf65fd2c732c57211da6591ab9f750dd1929abef
   183	[test-set-env-var/test]   ✅  Success - step1
   184	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home] Cmd:[] Action:0xc0002a44e0} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1]"
   185	time="2020-11-21T08:19:29-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
   186	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true name1:value1]"
   187	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   188	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
   189	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true name1:value1]"
   190	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   191	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   192	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }} name1:value1]"
   193	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   194	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   195	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=name1 v=value1 env[k]=value1"
   196	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=value1"
   197	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-NAME v=${{ env.name1 }} env[k]=${{ env.name1 }}"
   198	time="2020-11-21T08:19:29-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   199	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   200	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]="
   201	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-VALUE v=${{ runner.os }}-python-${{ env.name1 }} env[k]=${{ runner.os }}-python-${{ env.name1 }}"
   202	time="2020-11-21T08:19:29-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   203	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   204	time="2020-11-21T08:19:29-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   205	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   206	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=Linux-python-"
   207	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   208	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   209	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   210	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   211	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
   212	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
   213	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
   214	time="2020-11-21T08:19:29-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   215	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   216	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   217	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   218	time="2020-11-21T08:19:29-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/.git'"
   219	time="2020-11-21T08:19:29-08:00" level=debug msg="Found revision: 2bd705fc2a30dddb588c6eb14385427b9a5f579a\n"
   220	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD points to '2bd705fc2a30dddb588c6eb14385427b9a5f579a'"
   221	time="2020-11-21T08:19:29-08:00" level=debug msg="HEAD matches refs/heads/main"
   222	time="2020-11-21T08:19:29-08:00" level=debug msg="using github ref: refs/heads/main"
   223	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   224	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   225	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   226	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   227	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   228	time="2020-11-21T08:19:29-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   229	time="2020-11-21T08:19:29-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   230	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   231	[test-set-env-var/test] ⭐  Run step2
   232	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   233	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/js-local-set-env-var actionPath="
   234	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   235	time="2020-11-21T08:19:29-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   236	time="2020-11-21T08:19:29-08:00" level=debug msg="Read action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {node12 map[] index.js  [] []} { }} from '/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/js-local-set-env-var/action.yml'"
   237	time="2020-11-21T08:19:29-08:00" level=debug msg="About to run action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {node12 map[] index.js  [] []} { }}"
   238	time="2020-11-21T08:19:29-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var/actions/js-local-set-env-var actionPath= Workdir=/home/wink/prgs/github-actions/tests/ghwf-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/js-local-set-env-var containerActionDir=/github/workspace"
   239	time="2020-11-21T08:19:29-08:00" level=debug msg="executing remote job container: [node /github/workspace/actions/js-local-set-env-var/index.js]"
   240	[test-set-env-var/test] Exec command '[node /github/workspace/actions/js-local-set-env-var/index.js]'
   241	[test-set-env-var/test]   ❗  ::error::env-name is empty
   242	[test-set-env-var/test]   ❌  Failure - step2
   243	time="2020-11-21T08:19:30-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:2bd705fc2a30dddb588c6eb14385427b9a5f579a GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0002a4d00} rc.StepResults=&{Success:false Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1]"
   244	time="2020-11-21T08:19:30-08:00" level=debug msg="exit with `FAILURE`: 1"
   245	time="2020-11-21T08:19:30-08:00" level=debug msg="exit with `FAILURE`: 1"
   246	Error: exit with `FAILURE`: 1
```