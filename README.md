This Repo is for the Infra Set Up for the ELK in GCp

This repo uses the Github Github Actions as the CI CD platform to automate the build and deployment for the GCP resources.

We use the Github workflows here to trigger a deploy to the GCP when a merge event occurs in the repository.

The workflow contains one or more jobs which can run in sequential or parallel order. Each job will run in its own VM runner or inside a container.
These jobs can have multiple steps that can run arun a script or an action which is just a reusable extension.

