## How to run a test

### Set up the authentication file
Create a `env.json` file using the template `env.json.example`.  
Replace the variable `REPLACE_ME_WITH_64BIT_ENCODED_AUTH` of the `env.json` file,  with a valid credential.  
Use the following command, for encoding a string containing the `username` and `password` to base64:

    echo -n 'admin:password' | base64

    YWRtaW46cGFzc3dvcmQ=

### Run a test collection
The test can be run using `newman` command line, syntax:

    newman run -e env.json collection-name.postman_collection

Or using the [Postman](https://www.getpostman.com) application
