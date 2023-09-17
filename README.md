
# UFW Configuration Script

This bash script is designed to configure the Uncomplicated Firewall (UFW) on your Linux system to allow specific incoming traffic while denying all other incoming traffic.

## Prerequisites

Before running this script, make sure you have the following:

1. A Linux system with UFW installed.
2. Superuser (sudo) privileges to execute the commands.

## Usage

1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory where the script is located.

3. Make the script executable if it's not already:

    ```bash
    chmod +x ufw-configure.sh
    ```

4. Run the script with sudo:

    ```bash
    sudo ./ufw-configure.sh
    ```

5. The script will install UFW if not already installed, set default policies to deny incoming and allow outgoing traffic, and allow incoming traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS).

6. UFW will be enabled, and you can check the status using the following command:

    ```bash
    sudo ufw status verbose
    ```

## Configuration

The script also includes some additional rules:

- It redirects incoming traffic on port 8080 to port 80 using NAT.

- It allows essential ICMP (ping) traffic.

- It permits DHCP client communication.

- It allows multicast DNS and UPnP for service discovery.

- It drops invalid packets and logs them.

Please review the script and adapt it to your specific requirements.

## Caution

Modifying firewall rules can impact your server's security and accessibility. Ensure that you understand the rules you are configuring and have tested them in a safe environment before applying them to a production server.

## License

This script is provided under the [MIT License](LICENSE).
```


# Nginx and HAProxy Setup Script

This Bash script is designed to automate the installation and configuration of Nginx as a web server and HAProxy as a load balancer on a Debian-based system. It also sets up a basic Nginx website with a custom error page and a URL redirection rule.

## Prerequisites

Before running this script, make sure you have:

- A Debian-based operating system (tested on Ubuntu)
- `sudo` privileges
- Internet connectivity to download packages

## Usage

1. Clone this repository or download the script file.

2. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Run the script as a superuser (or with sudo):

   ```bash
   ./setup.sh
   ```

4. The script will perform the following actions:

   - Remove existing Nginx installations (if any).
   - Update the package manager.
   - Install Nginx.
   - Create a basic HTML index page and a custom 404 error page.
   - Configure Nginx with a default server block.
   - Restart Nginx.

   It will also install and configure HAProxy as a load balancer.

5. Access your Nginx web server at `http://your-server-ip` and check the URL redirection at `http://your-server-ip/redirect_me`.

## Configuration

- The Nginx server block is set up to serve content from `/var/www/html`.
- The default server block listens on port 80 and handles any server name.
- The HAProxy configuration balances traffic between two web servers.

## License

This script is provided under the [MIT License](LICENSE).
```

# Bash Script

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

