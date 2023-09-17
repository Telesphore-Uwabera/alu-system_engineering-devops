
# Bash Script README

This repository contains several Bash scripts for various tasks related to SSH and server configuration. Each script is described below:

## `connect_server.sh`

This script connects to a remote server using SSH with a specific private key. It uses the `-i` option to specify the path to the private key (`~/.ssh/school`) and connects to the server with the IP address `54.224.77.74`. 

## `generate_ssh_key.sh`

This script generates an SSH key pair using `ssh-keygen`. It creates a 4096-bit RSA key named `school` and sets the passphrase to "betty."

## `configure_ssh_no_password.sh`

This script is intended to configure SSH to allow passwordless authentication by appending specific configurations to the `/etc/ssh/ssh_config` file. However, there is a syntax error in the script, and it may not work as intended. The correct configuration should be written using the `echo` command, but the usage of `exec { ... }` with single quotes is incorrect.

## `ssh_config`

This is a sample SSH client system-wide configuration file. It is not a script but a configuration file. It provides defaults for SSH client behavior. The comments in the file explain various configuration options that can be customized according to your needs.

Please note that the `configure_ssh_no_password.sh` script has a syntax issue, and you should review it to ensure it works correctly. Additionally, always be cautious when modifying system-wide SSH configurations, as it can impact the security and functionality of SSH on your system.

Feel free to use these scripts and the SSH configuration as a reference for your own SSH-related tasks and configurations.
```

