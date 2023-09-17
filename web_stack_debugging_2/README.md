
# Bash Script README

This repository contains two Bash scripts, each with its own purpose. Below, we describe each script and provide instructions on how to use them.

## Script 1: `script1.sh`

### Description
This script changes the permissions of the `/etc/nginx/` directory, stops the Apache2 service, updates the Apache2 configuration to use port 8081 instead of 8080, and restarts the Apache2 and Nginx services. It also updates the Nginx default configuration to listen on port 8080.

### Usage
1. Make sure you have the necessary permissions to run these commands, especially when using `sudo`.

2. Run the script as follows:
   ```bash
   sudo bash script1.sh
   ```

## Script 2: `script2.sh`

### Description
This script runs the `whoami` command as the user specified as an argument. It provides a way to check the current user for a given username.

### Usage
1. Make the script executable if it's not already:
   ```bash
   chmod +x script2.sh
   ```

2. Run the script, passing the target username as an argument:
   ```bash
   ./script2.sh <username>
   ```

Replace `<username>` with the username you want to check.

## Important Notes
- Ensure you have the necessary permissions and understand the consequences of running these scripts, especially when using `sudo`.
- These scripts were created for educational purposes and should be used responsibly.
