### File uploading

The project uses the **Shrine** gem as a file uploader. In order to minimize the waiting time before uploading a form to the server, images (and documents) are uploaded asynchronously, before the form is submitted. The files are uploaded directly to the DigitalOcean cloud, into a pre-cache. When the form is submitted, if validation is successful, the files are copied to permanent storage, also in the AWS cloud. This copying is done in the background, so that the interface works without delay.
