# Simpler test for showing issue 416 on act

See [act](https://github.com/nektos/act) issue [#416](https://github.com/nektos/act/issues/416).

**I created [winksaville/action-set-env-var](https://github.com/winksaville/action-set-env-var) and
it's still working just as docker-local-set-env-var did, my hypothesis was wrong!**

## Comparision of this repo and [act-failing-python-cache](https://github.com/winksaville/act-failing-python-cache/tree/dd1d0c498e08ad0a6f4cd3e8d7420a619688f56d).

Note set-env-var.yml is using a slightly different version with
some additional debug as compared to act-failing-python-cache.yml.
But no logical different just some other debug needed to figure out
that I needed to use `uses: winksaville/action-set-env-var@main`.
```
$ git log --pretty=oneline -1
86a8125f4e3179a42114be33d111ac3629d8fb3e (HEAD -> debug-act-failing-python-cache, origin/debug-act-failing-python-cache) Add debug NewGitCloneExecutor and CloneIfRequired
```

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
   182	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   183	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>} actionDir=/home/wink/.cache/act/winksaville-action-set-env-var@main actionPath="
   184	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   185	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   186	[test-set-env-var/test]   ☁  git clone 'https://github.com/winksaville/action-set-env-var' # ref=main
   187	[test-set-env-var/test]   cloning https://github.com/winksaville/action-set-env-var to /home/wink/.cache/act/winksaville-action-set-env-var@main
   188	[test-set-env-var/test] retF plumbing.ReferenceName refName=refs/heads/main
   189	[test-set-env-var/test] CloneIfRequired:+ refName=refs/heads/main
   190	[test-set-env-var/test] CloneIfRequired:- T r=*git.Repository r=&{0xc00028a320 map[] 0xc0004c6120}
   191	[test-set-env-var/test] Call plumbing.Revision(main)
   192	[test-set-env-var/test] Call r.ResolveRevision(main)
   193	[test-set-env-var/test] retF r.ResolveRevision(main) hash=ce57ff694b90ab05c7637e599a7e6a01374288c3 err=<nil>
   194	[test-set-env-var/test] Provided ref is not a sha. Checking out branch before pulling changes
   195	[test-set-env-var/test] Cloned https://github.com/winksaville/action-set-env-var to /home/wink/.cache/act/winksaville-action-set-env-var@main
   196	[test-set-env-var/test] Checked out main
   197	time="2020-11-19T22:41:10-08:00" level=debug msg="Read action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }} from '/home/wink/.cache/act/winksaville-action-set-env-var@main/action.yml'"
   198	time="2020-11-19T22:41:10-08:00" level=debug msg="About to run action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }}"
   199	time="2020-11-19T22:41:10-08:00" level=debug msg="type=3 actionDir=/home/wink/.cache/act/winksaville-action-set-env-var@main actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=winksaville-action-set-env-var@main containerActionDir=/actions"
   200	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0008c2f70} cmd=[${{ inputs.env-name }} ${{ inputs.env-value }}] entryPoint=[]"
   201	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   202	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   203	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   204	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   205	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
   206	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD matches refs/heads/main"
   207	time="2020-11-19T22:41:10-08:00" level=debug msg="using github ref: refs/heads/main"
   208	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   209	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   210	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   211	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   212	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   213	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   214	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'inputs['env-name']' instead of 'inputs.env-name'"
   215	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-name']' val='${{ env.name1 }}'"
   216	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   217	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   218	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'inputs['env-value']' instead of 'inputs.env-value'"
   219	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-value']' val='${{ runner.os }}-python-${{ env.name1 }}'"
   220	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   221	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   222	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   223	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   224	[test-set-env-var/test]   🐳  docker build -t act-winksaville-action-set-env-var-main:latest /home/wink/.cache/act/winksaville-action-set-env-var@main
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
$ cat -n act-g86a8125-dirty-winksaville-action-set-env-var.log
     1	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading environment from /home/wink/prgs/github-actions/tests/gha-test-set-env-var/.env"
     2	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading secrets from "
     3	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading workflows from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.github/workflows'"
     4	time="2020-11-19T22:41:09-08:00" level=debug msg="Reading workflow '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.github/workflows/set-env-var.yml'"
     5	time="2020-11-19T22:41:09-08:00" level=debug msg="Planning event: push"
     6	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
     7	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
     8	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
     9	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    10	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
    11	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
    12	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
    13	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    14	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    15	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    16	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: NewPlanExecutor jobName='test-set-env-var/test' ctx=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e81c0), key:\"dryrun\", val:false}"
    17	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: NewPlanExecutor ctx v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e81c0), key:\"dryrun\", val:false}"
    18	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: NewPlanExecutor ctx +v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e81c0), key:\"dryrun\", val:false}"
    19	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: NewPlanExecutor ctx #v=&context.valueCtx{Context:(*context.cancelCtx)(0xc0003e81c0), key:\"dryrun\", val:false}"
    20	[test-set-env-var/test] 🚀  Start image=node:12.6-buster-slim
    21	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    22	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    23	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    24	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    25	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
    26	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
    27	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
    28	[test-set-env-var/test]   🐳  docker pull node:12.6-buster-slim
    29	time="2020-11-19T22:41:09-08:00" level=debug msg="Image exists? true"
    30	[test-set-env-var/test]   🐳  docker create image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    31	[test-set-env-var/test] Created container name=act-test-set-env-var-test id=4e1fca7e98a86f2caaf415cddb28757df25f299b727a385345f58cd90efa7b58 from image node:12.6-buster-slim
    32	[test-set-env-var/test] ENV ==> [RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
    33	[test-set-env-var/test]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
    34	[test-set-env-var/test] Starting container: 4e1fca7e98a86f2caaf415cddb28757df25f299b727a385345f58cd90efa7b58
    35	[test-set-env-var/test] Started container: 4e1fca7e98a86f2caaf415cddb28757df25f299b727a385345f58cd90efa7b58
    36	time="2020-11-19T22:41:09-08:00" level=debug msg="Writing entry to tarball workflow/event.json len:2"
    37	time="2020-11-19T22:41:09-08:00" level=debug msg="Writing entry to tarball home/.act len:0"
    38	[test-set-env-var/test] Extracting content to '/github/'
    39	time="2020-11-19T22:41:09-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
    40	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true]"
    41	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_PYTHON-VERSION:3.7]"
    42	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
    43	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true]"
    44	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_PYTHON-VERSION:3.7]"
    45	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
    46	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_PYTHON-VERSION:3.7]"
    47	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
    48	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
    49	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_PYTHON-VERSION v=3.7 env[k]=3.7"
    50	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=3.7"
    51	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    52	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    53	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    54	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    55	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
    56	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
    57	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
    58	time="2020-11-19T22:41:09-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    59	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
    60	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    61	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    62	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    63	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    64	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
    65	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
    66	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
    67	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    68	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    69	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    70	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    71	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7])"
    72	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    73	time="2020-11-19T22:41:09-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
    74	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    75	[test-set-env-var/test] ⭐  Run step1
    76	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    77	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>} actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1 actionPath="
    78	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    79	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:<nil>}"
    80	time="2020-11-19T22:41:09-08:00" level=debug msg="Read action &{set-env-name1  Set enviornemt variable name1 to valu1 map[python-version:{Python version true }] map[] {docker map[]  Dockerfile [] [${{ inputs.python-version }}]} { }} from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1/action.yml'"
    81	time="2020-11-19T22:41:09-08:00" level=debug msg="About to run action &{set-env-name1  Set enviornemt variable name1 to valu1 map[python-version:{Python version true }] map[] {docker map[]  Dockerfile [] [${{ inputs.python-version }}]} { }}"
    82	time="2020-11-19T22:41:09-08:00" level=debug msg="type=2 actionDir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1 actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=actions/docker-local-set-env-name1 containerActionDir=/github/workspace"
    83	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:0xc0001a1e10} cmd=[${{ inputs.python-version }}] entryPoint=[]"
    84	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    85	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    86	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
    87	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
    88	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
    89	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
    90	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
    91	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true]"
    92	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true])"
    93	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
    94	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7]"
    95	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7])"
    96	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
    97	time="2020-11-19T22:41:09-08:00" level=debug msg="Evaluating 'inputs['python-version']' instead of 'inputs.python-version'"
    98	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['python-version']' val='3.7'"
    99	[test-set-env-var/test]   🐳  docker build -t act-actions-docker-local-set-env-name1:latest /home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1
   100	[test-set-env-var/test] Building image from '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1'
   101	time="2020-11-19T22:41:09-08:00" level=debug msg="Creating archive for build context dir '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/actions/docker-local-set-env-name1' with relative dockerfile 'Dockerfile'"
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
   122	time="2020-11-19T22:41:09-08:00" level=debug msg="Image exists? true"
   123	[test-set-env-var/test]   🐳  docker create image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
   124	[test-set-env-var/test] Created container name=act-test-set-e-0 id=ca896157ce8a8d373a6aac4dab782a3c5cb054d5bab221574d1adbca55fe0e7b from image act-actions-docker-local-set-env-name1:latest
   125	[test-set-env-var/test] ENV ==> [GITHUB_ACTIONS=true GITHUB_EVENT_PATH=/github/workflow/event.json GITHUB_REPOSITORY=winksaville/gha-test-set-env-var GITHUB_ACTION=0 ACT=true HOME=/github/home GITHUB_ACTOR=nektos/act GITHUB_SHA=cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_REF=refs/heads/main GITHUB_EVENT_NAME=push GITHUB_WORKFLOW=test-set-env-var GITHUB_TOKEN= GITHUB_RUN_NUMBER=1 CI=true GITHUB_RUN_ID=1 GITHUB_WORKSPACE=/github/workspace INPUT_PYTHON-VERSION=3.7 RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
   126	[test-set-env-var/test]   🐳  docker run image=act-actions-docker-local-set-env-name1:latest entrypoint=[] cmd=["3.7"]
   127	[test-set-env-var/test] Starting container: ca896157ce8a8d373a6aac4dab782a3c5cb054d5bab221574d1adbca55fe0e7b
   128	[test-set-env-var/test]   | first-param=3.7
   129	[test-set-env-var/test]   ⚙  ::set-env:: name1=value1
   130	[test-set-env-var/test] Started container: ca896157ce8a8d373a6aac4dab782a3c5cb054d5bab221574d1adbca55fe0e7b
   131	[test-set-env-var/test] Return status: 0
   132	[test-set-env-var/test] Removed container: ca896157ce8a8d373a6aac4dab782a3c5cb054d5bab221574d1adbca55fe0e7b
   133	[test-set-env-var/test]   ✅  Success - step1
   134	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step1 Env:map[ACT:true CI:true GITHUB_ACTION:0 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_PYTHON-VERSION:3.7] Cmd:[] Action:0xc0001a1e10} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1]"
   135	time="2020-11-19T22:41:09-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
   136	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true name1:value1]"
   137	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   138	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
   139	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true name1:value1]"
   140	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }}]"
   141	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   142	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true INPUT_ENV-NAME:${{ env.name1 }} INPUT_ENV-VALUE:${{ runner.os }}-python-${{ env.name1 }} name1:value1]"
   143	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=name1 v=value1 env[k]=value1"
   144	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=value1"
   145	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-VALUE v=${{ runner.os }}-python-${{ env.name1 }} env[k]=${{ runner.os }}-python-${{ env.name1 }}"
   146	time="2020-11-19T22:41:09-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   147	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   148	time="2020-11-19T22:41:09-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   149	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   150	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=Linux-python-"
   151	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=INPUT_ENV-NAME v=${{ env.name1 }} env[k]=${{ env.name1 }}"
   152	time="2020-11-19T22:41:09-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   153	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: Evaluated val=undefined ret: val=\"\", false, err='<nil>'"
   154	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]="
   155	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   156	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   157	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   158	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   159	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   160	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   161	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
   162	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
   163	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
   164	time="2020-11-19T22:41:09-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   165	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   166	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   167	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   168	time="2020-11-19T22:41:09-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   169	time="2020-11-19T22:41:09-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   170	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
   171	time="2020-11-19T22:41:09-08:00" level=debug msg="HEAD matches refs/heads/main"
   172	time="2020-11-19T22:41:09-08:00" level=debug msg="using github ref: refs/heads/main"
   173	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   174	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   175	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   176	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   177	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   178	time="2020-11-19T22:41:09-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   179	time="2020-11-19T22:41:09-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   180	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   181	[test-set-env-var/test] ⭐  Run step2
   182	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   183	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: setupAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>} actionDir=/home/wink/.cache/act/winksaville-action-set-env-var@main actionPath="
   184	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK: runAction: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   185	time="2020-11-19T22:41:09-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:<nil>}"
   186	[test-set-env-var/test]   ☁  git clone 'https://github.com/winksaville/action-set-env-var' # ref=main
   187	[test-set-env-var/test]   cloning https://github.com/winksaville/action-set-env-var to /home/wink/.cache/act/winksaville-action-set-env-var@main
   188	[test-set-env-var/test] retF plumbing.ReferenceName refName=refs/heads/main
   189	[test-set-env-var/test] CloneIfRequired:+ refName=refs/heads/main
   190	[test-set-env-var/test] CloneIfRequired:- T r=*git.Repository r=&{0xc00028a320 map[] 0xc0004c6120}
   191	[test-set-env-var/test] Call plumbing.Revision(main)
   192	[test-set-env-var/test] Call r.ResolveRevision(main)
   193	[test-set-env-var/test] retF r.ResolveRevision(main) hash=ce57ff694b90ab05c7637e599a7e6a01374288c3 err=<nil>
   194	[test-set-env-var/test] Provided ref is not a sha. Checking out branch before pulling changes
   195	[test-set-env-var/test] Cloned https://github.com/winksaville/action-set-env-var to /home/wink/.cache/act/winksaville-action-set-env-var@main
   196	[test-set-env-var/test] Checked out main
   197	time="2020-11-19T22:41:10-08:00" level=debug msg="Read action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }} from '/home/wink/.cache/act/winksaville-action-set-env-var@main/action.yml'"
   198	time="2020-11-19T22:41:10-08:00" level=debug msg="About to run action &{set-env-var  Set an enviornemt variable map[env-name:{Environment variable name true } env-value:{Value to save in env-name true }] map[] {docker map[]  Dockerfile [] [${{ inputs.env-name }} ${{ inputs.env-value }}]} { }}"
   199	time="2020-11-19T22:41:10-08:00" level=debug msg="type=3 actionDir=/home/wink/.cache/act/winksaville-action-set-env-var@main actionPath= Workdir=/home/wink/prgs/github-actions/tests/gha-test-set-env-var ActionCacheDir=/home/wink/.cache/act actionName=winksaville-action-set-env-var@main containerActionDir=/actions"
   200	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: newStepContainer sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0008c2f70} cmd=[${{ inputs.env-name }} ${{ inputs.env-value }}] entryPoint=[]"
   201	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   202	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   203	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   204	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   205	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
   206	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD matches refs/heads/main"
   207	time="2020-11-19T22:41:10-08:00" level=debug msg="using github ref: refs/heads/main"
   208	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1]"
   209	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1])"
   210	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   211	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1]"
   212	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1])"
   213	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   214	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'inputs['env-name']' instead of 'inputs.env-name'"
   215	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-name']' val='${{ env.name1 }}'"
   216	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   217	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   218	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'inputs['env-value']' instead of 'inputs.env-value'"
   219	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'inputs['env-value']' val='${{ runner.os }}-python-${{ env.name1 }}'"
   220	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'runner['os']' instead of 'runner.os'"
   221	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'runner['os']' val='Linux'"
   222	time="2020-11-19T22:41:10-08:00" level=debug msg="Evaluating 'env['name1']' instead of 'env.name1'"
   223	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: Evaluated ret: 'env['name1']' val='value1'"
   224	[test-set-env-var/test]   🐳  docker build -t act-winksaville-action-set-env-var-main:latest /home/wink/.cache/act/winksaville-action-set-env-var@main
   225	[test-set-env-var/test] Building image from '/home/wink/.cache/act/winksaville-action-set-env-var@main'
   226	time="2020-11-19T22:41:10-08:00" level=debug msg="Creating archive for build context dir '/home/wink/.cache/act/winksaville-action-set-env-var@main' with relative dockerfile 'Dockerfile'"
   227	[test-set-env-var/test] Creating image from context dir '/home/wink/.cache/act/winksaville-action-set-env-var@main' with tag 'act-winksaville-action-set-env-var-main:latest'
   228	[test-set-env-var/test] Step 1/4 : FROM alpine:latest
   229	[test-set-env-var/test] 
   230	[test-set-env-var/test]  ---> d6e46aa2470d
   231	[test-set-env-var/test] Step 2/4 : COPY entrypoint.sh /entrypoint.sh
   232	[test-set-env-var/test] 
   233	[test-set-env-var/test]  ---> Using cache
   234	[test-set-env-var/test]  ---> 0c378ad87ede
   235	[test-set-env-var/test] Step 3/4 : RUN chmod +x /entrypoint.sh
   236	[test-set-env-var/test] 
   237	[test-set-env-var/test]  ---> Using cache
   238	[test-set-env-var/test]  ---> 43ad4c5d00df
   239	[test-set-env-var/test] Step 4/4 : ENTRYPOINT ["/entrypoint.sh"]
   240	[test-set-env-var/test] 
   241	[test-set-env-var/test]  ---> Using cache
   242	[test-set-env-var/test]  ---> cbf48be6a2fa
   243	[test-set-env-var/test] Unable to handle line: {"aux":{"ID":"sha256:cbf48be6a2faf97d594677d2763fab8090438fbde7bdd21e72aa576f47d2780d"}}
   244	[test-set-env-var/test] Successfully built cbf48be6a2fa
   245	[test-set-env-var/test] Successfully tagged act-winksaville-action-set-env-var-main:latest
   246	[test-set-env-var/test]   🐳  docker pull act-winksaville-action-set-env-var-main:latest
   247	time="2020-11-19T22:41:10-08:00" level=debug msg="Image exists? true"
   248	[test-set-env-var/test]   🐳  docker create image=act-winksaville-action-set-env-var-main:latest entrypoint=[] cmd=["value1" "Linux-python-value1"]
   249	[test-set-env-var/test] Created container name=act-test-set-e-1 id=b39ae6b088d0b02aeac148d57554093ea097673a3a0b5096162ea555906a716b from image act-winksaville-action-set-env-var-main:latest
   250	[test-set-env-var/test] ENV ==> [GITHUB_WORKSPACE=/github/workspace INPUT_ENV-NAME= GITHUB_ACTION=1 GITHUB_RUN_NUMBER=1 GITHUB_EVENT_NAME=push name1=value1 GITHUB_SHA=cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN= GITHUB_REPOSITORY=winksaville/gha-test-set-env-var HOME=/github/home GITHUB_ACTIONS=true GITHUB_EVENT_PATH=/github/workflow/event.json ACT=true GITHUB_WORKFLOW=test-set-env-var CI=true INPUT_ENV-VALUE=Linux-python- GITHUB_RUN_ID=1 GITHUB_ACTOR=nektos/act GITHUB_REF=refs/heads/main RUNNER_TOOL_CACHE=/opt/hostedtoolcache RUNNER_OS=Linux RUNNER_TEMP=/tmp]
   251	[test-set-env-var/test]   🐳  docker run image=act-winksaville-action-set-env-var-main:latest entrypoint=[] cmd=["value1" "Linux-python-value1"]
   252	[test-set-env-var/test] Starting container: b39ae6b088d0b02aeac148d57554093ea097673a3a0b5096162ea555906a716b
   253	[test-set-env-var/test]   | Hi from entrypoint.sh ********************
   254	[test-set-env-var/test]   | entrypoint.sh: name=value1
   255	[test-set-env-var/test]   | entrypoint.sh: value=Linux-python-value1
   256	[test-set-env-var/test]   ⚙  ::set-env:: value1=Linux-python-value1
   257	[test-set-env-var/test] Started container: b39ae6b088d0b02aeac148d57554093ea097673a3a0b5096162ea555906a716b
   258	[test-set-env-var/test] Return status: 0
   259	[test-set-env-var/test] Removed container: b39ae6b088d0b02aeac148d57554093ea097673a3a0b5096162ea555906a716b
   260	[test-set-env-var/test]   ✅  Success - step2
   261	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:step2 Env:map[ACT:true CI:true GITHUB_ACTION:1 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home INPUT_ENV-NAME: INPUT_ENV-VALUE:Linux-python- name1:value1] Cmd:[] Action:0xc0008c2f70} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1 value1:Linux-python-value1]"
   262	time="2020-11-19T22:41:10-08:00" level=debug msg="WiNK: call sc.setupEnv()(ctx)"
   263	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv rc.GetEnv()=map[ACT:true name1:value1 value1:Linux-python-value1]"
   264	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv step.GetEnv()=map[]"
   265	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func:+ *********************"
   266	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func: rc.GetEnv()=map[ACT:true name1:value1 value1:Linux-python-value1]"
   267	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func: step.GetEnv()=map[]"
   268	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func mergeMaps 2 rc, step"
   269	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func env=map[ACT:true name1:value1 value1:Linux-python-value1]"
   270	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=ACT v=true env[k]=true"
   271	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=true"
   272	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=name1 v=value1 env[k]=value1"
   273	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=value1"
   274	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func Interpolate k=value1 v=Linux-python-value1 env[k]=Linux-python-value1"
   275	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func Interpolate env[k]=Linux-python-value1"
   276	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   277	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   278	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   279	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   280	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
   281	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD matches refs/heads/main"
   282	time="2020-11-19T22:41:10-08:00" level=debug msg="using github ref: refs/heads/main"
   283	time="2020-11-19T22:41:10-08:00" level=debug msg="setupEnv => map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1]"
   284	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupEnv.func:- ******************************"
   285	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading slug from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   286	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   287	time="2020-11-19T22:41:10-08:00" level=debug msg="Loading revision from git directory '/home/wink/prgs/github-actions/tests/gha-test-set-env-var/.git'"
   288	time="2020-11-19T22:41:10-08:00" level=debug msg="Found revision: cae7933cd5f0759b21be6f00d2939eade0140813\n"
   289	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD points to 'cae7933cd5f0759b21be6f00d2939eade0140813'"
   290	time="2020-11-19T22:41:10-08:00" level=debug msg="HEAD matches refs/heads/main"
   291	time="2020-11-19T22:41:10-08:00" level=debug msg="using github ref: refs/heads/main"
   292	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: RunContext vmEnv rc.GetEnv=map[ACT:true name1:value1 value1:Linux-python-value1]"
   293	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: RunContext.func:+ vmEnv call ################# vm.Set(\"env\", rc.GetEnv()=map[ACT:true name1:value1 value1:Linux-python-value1])"
   294	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: RunContext.func:- vmEnv"
   295	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: StepContext vmEnv sc.GetEnv=map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1]"
   296	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: StepContext.func:+ vmEnv call !!!!!!!!!!!!!!!!! vm.Set(\"env\", sc.Env=map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1])"
   297	time="2020-11-19T22:41:10-08:00" level=debug msg="WIHK: StepContext.func:- vmEnv"
   298	time="2020-11-19T22:41:10-08:00" level=debug msg="WiNK: done NewExpressionEvaluator()"
   299	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: newStepExecutor.func:+ Run &{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   300	[test-set-env-var/test] ⭐  Run done
   301	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK:+ Executor: sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   302	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: setupShellCommand sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   303	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK:- Executor: sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[] Action:<nil>}"
   304	time="2020-11-19T22:41:10-08:00" level=debug msg="Wrote command 'echo Done' to 'workflow/2'"
   305	time="2020-11-19T22:41:10-08:00" level=debug msg="Writing entry to tarball workflow/2 len:9"
   306	[test-set-env-var/test] Extracting content to '/github/'
   307	[test-set-env-var/test] Exec command '[bash --noprofile --norc -eo pipefail /github/workflow/2]'
   308	[test-set-env-var/test]   | Done
   309	[test-set-env-var/test]   ✅  Success - done
   310	time="2020-11-19T22:41:10-08:00" level=debug msg="WINK: newStepExecutor.func:- Run sc=&{RunContext:test-set-env-var/test Step:done Env:map[ACT:true CI:true GITHUB_ACTION:2 GITHUB_ACTIONS:true GITHUB_ACTOR:nektos/act GITHUB_EVENT_NAME:push GITHUB_EVENT_PATH:/github/workflow/event.json GITHUB_REF:refs/heads/main GITHUB_REPOSITORY:winksaville/gha-test-set-env-var GITHUB_RUN_ID:1 GITHUB_RUN_NUMBER:1 GITHUB_SHA:cae7933cd5f0759b21be6f00d2939eade0140813 GITHUB_TOKEN: GITHUB_WORKFLOW:test-set-env-var GITHUB_WORKSPACE:/github/workspace HOME:/github/home name1:value1 value1:Linux-python-value1] Cmd:[bash --noprofile --norc -eo pipefail /github/workflow/2] Action:<nil>} rc.StepResults=&{Success:true Outputs:map[]} rc.GetEnv=map[ACT:true name1:value1 value1:Linux-python-value1]"
   311	[test-set-env-var/test] Removed container: 4e1fca7e98a86f2caaf415cddb28757df25f299b727a385345f58cd90efa7b58
   312	[test-set-env-var/test]   🐳  docker volume rm act-test-set-env-var-test
```
