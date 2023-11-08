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
To upload `OLD_TAG-NEW_TAG-conda-env-export.diff.txt`

Full new conda env export:
To upload `NEW_TAG-conda-env-export.yml.txt`

DockerHub build log
To upload `NEW_TAG-buildlogs.txt`
