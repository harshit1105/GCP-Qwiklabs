**Pre-requisite before running code :-**

**Generating SSH keys**

To generate SSH keys in the above format the following command can be used:

ssh-keygen -t rsa -f ./KEY_FILENAME -C USERNAME -b 2048

The above command will a generate a SSH key-pair (public and private) in the current folder with the provided username of size 2048 bytes.

**Arguments to be provided:**

KEY_FILENAME: The name of private key which will be used to SSH into the Instance.
USERNAME: Username to be provided is the email address associated with the Google Cloud Account which will be used to launch the resources.

When the command prompts for passphrase just press enter and move forward.

The above command resulted in generation of two key files: gcp-key (private-key) & gcp-key.pub (public-key).

Store this file in your directory and provide them w.r.t "filepath_pub"(Public Key) and "filepath_key"(Private Key)
