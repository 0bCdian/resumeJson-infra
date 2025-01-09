# Infrastructure repo for json api

## GCP Services used

- cloud run
- cloud firestore
- artifact registry
- secret manager

## Service accounts

- staging and production workflow runners:
  Will handle uploading the docker image from gh actions to artifact registry,
will need the roles:
  - roles/artifactregistry.writer
  - roles/artifactregistry.reader
  - roles/run.admin

- cloud run default service account:
  the service account that will be assigned to the cloud run service so that it
  can access other gcp services like firestore and secret manager.
It needs:
  - roles/file.editor (firestore access)
  - roles/secretmanager.secretAccessor
