# Overview

Please include a summary of the changes and which issues is fixed. Please also include relevant motivation and context. List any dependencies that are required for this change.

This PR fixes [issue id](url)


## Changes

- Adds...
- Jupyter env changes:
  - Change 1 (related PR url)
  - Change 2 (related PR url)
  - Relevant changes (alphabetical order):
```diff
<   - somelib=0.8.1=pyh6c4a22f_1
>   - somelib=0.8.4=pyh1a96a4e_0

(...)

```


## Test

- Deployed as "beta" image in production for bokeh visualization performance regression testing.
- Manual test notebook https://github.com/Ouranosinc/PAVICS-landing/blob/master/content/notebooks/climate_indicators/PAVICStutorial_ClimateDataAnalysis-5Visualization.ipynb for bokeh visualization performance and it looks fine.
- Jenkins build, all passed:
  - To upload `job-PAVICS-e2e-workflow-tests-new-docker-build-###-consoleText.txt`
  - To upload `ravenpy-job-PAVICS-e2e-workflow-tests-new-docker-build-###-consoleText.txt`


## Related Issue / Discussion

- Matching notebook fixes:
  - Pavics-sdi: PR url
  - Finch: PR url
  - PAVICS-landing: PR url
  - RavenPy: PR url
  - (...)

- Deployment to PAVICS: PR url

- Jenkins-config changes for new notebooks: PR url

- Other issues found while working on this one
  - Issue 1 URL
  - Issue 2 URL
  - (...)

- Previous release: PR url


## Additional Information

Full diff conda env export:
<details>
  <summary>OLD_TAG-NEW_TAG-conda-env-export.diff.txt</summary>
  <!-- note: cannot use inline styles, Github removes them during parsing -->
  <pre>
    <code>

(...)

71c71
<   - ca-certificates=2023.5.7=hbcca054_0
---
>   - ca-certificates=2023.7.22=hbcca054_0
81c81
<   - certifi=2023.5.7=pyhd8ed1ab_0
---
>   - certifi=2023.7.22=pyhd8ed1ab_0
427c427
<   - openssl=3.1.1=hd590300_1
---
>   - openssl=3.1.4=hd590300_0
547a548
>   - salib=1.4.7=pyhd8ed1ab_0

(...)

    </code>
  </pre>
</details>


Full new conda env export:
<details>
  <summary>NEW_TAG-conda-env-export.yml.txt</summary>
  <!-- note: cannot use inline styles, Github removes them during parsing -->
  <pre>
    <code>
name: birdy
channels:
  - cdat
  - conda-forge
  - defaults
dependencies:
  - (...)
  - raven-hydro=0.2.1=py39h8e2dbb5_1
  - ravenpy=0.12.1=py39hf3d152e_0
  - xclim=0.43.0=py39hf3d152e_1
  - (...)
  - pip:
      - (...)
      - xncml==0.2
      - (...)
prefix: /opt/conda/envs/birdy
    </code>
  </pre>
</details>


DockerHub build log
<details>
  <summary>NEW_TAG-buildlogs.txt</summary>
  <!-- note: cannot use inline styles, Github removes them during parsing -->
  <pre>
    <code>
2023-10-25T18:13:11Z Building in Docker Cloud's infrastructure...
2023-10-25T18:13:11Z Cloning into '.'...
2023-10-25T18:13:12Z Warning: Permanently added the RSA host key for IP address '140.82.114.4' to the list of known hosts.
2023-10-25T18:13:13Z Switched to a new branch 'dockerupdate-py39-230601-1-update231025'
2023-10-25T18:13:14Z KernelVersion: 5.4.0-1068-aws
2023-10-25T18:13:14Z Components: [{u'Version': u'20.10.15', u'Name': u'Engine', u'Details': {u'KernelVersion': u'5.4.0-1068-aws', u'Os': u'linux', u'BuildTime': u'2022-05-05T13:17:24.000000000+00:00', u'ApiVersion': u'1.41', u'MinAPIVersion': u'1.12', u'GitCommit': u'4433bf6', u'Arch': u'amd64', u'Experimental': u'false', u'GoVersion': u'go1.17.9'}}, {u'Version': u'1.6.21', u'Name': u'containerd', u'Details': {u'GitCommit': u'3dce8eb055cbb6872793272b4f20ed16117344f8'}}, {u'Version': u'1.1.7', u'Name': u'runc', u'Details': {u'GitCommit': u'v1.1.7-0-g860f061'}}, {u'Version': u'0.19.0', u'Name': u'docker-init', u'Details': {u'GitCommit': u'de40ad0'}}]
2023-10-25T18:13:14Z Arch: amd64
2023-10-25T18:13:14Z BuildTime: 2022-05-05T13:17:24.000000000+00:00
2023-10-25T18:13:14Z ApiVersion: 1.41
2023-10-25T18:13:14Z Platform: {u'Name': u'Docker Engine - Community'}
2023-10-25T18:13:14Z Version: 20.10.15
2023-10-25T18:13:14Z MinAPIVersion: 1.12
2023-10-25T18:13:14Z GitCommit: 4433bf6
2023-10-25T18:13:14Z Os: linux
2023-10-25T18:13:14Z GoVersion: go1.17.9
2023-10-25T18:13:14Z Buildkit: Starting build for index.docker.io/pavics/workflow-tests:py39-230601-1-update231025...

(...)

2023-10-25T18:22:32Z #5 [1/2] FROM docker.io/pavics/workflow-tests:py39-230601-1@sha256:1c00af199dc9248568f36ca03ba7f9ba0fa988733662fbe2d7751f036b508b8c
2023-10-25T18:22:33Z #5 ...
2023-10-25T18:22:33Z
2023-10-25T18:22:33Z #7 exporting to image
2023-10-25T18:22:33Z #7 exporting layers
2023-10-25T18:22:33Z #7 exporting layers 0.3s done
2023-10-25T18:22:33Z #7 writing image sha256:1702b01fb199f56e4cf5b3b3c6ce11f59f1d7d9ab3d0772c29d6797d38340c3a done
2023-10-25T18:22:33Z #7 naming to docker.io/pavics/workflow-tests:py39-230601-1-update231025 done
2023-10-25T18:22:33Z #7 DONE 0.3s
2023-10-25T18:22:33Z
2023-10-25T18:22:33Z #5 [1/2] FROM docker.io/pavics/workflow-tests:py39-230601-1@sha256:1c00af199dc9248568f36ca03ba7f9ba0fa988733662fbe2d7751f036b508b8c
2023-10-25T18:22:33Z Pushing index.docker.io/pavics/workflow-tests:py39-230601-1-update231025...
2023-10-25T18:22:38Z Done!
2023-10-25T18:22:38Z Build finished
    </code>
  </pre>
</details>
