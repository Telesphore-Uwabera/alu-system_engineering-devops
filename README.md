
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


# Web_server

This README provides an overview of the Bash scripts and HTML/CSS code in this project.

## Table of Contents

- [Scripts](#scripts)
  - [Script 1: File Transfer](#script-1-file-transfer)
  - [Script 2: Nginx Installation](#script-2-nginx-installation)
  - [Script 3: Nginx Configuration](#script-3-nginx-configuration)
- [HTML/CSS Code](#htmlcss-code)
- [Usage](#usage)
- [License](#license)

---

### Scripts

#### Script 1: File Transfer

```bash
#!/usr/bin/env bash
# Check if all 4 parameters are provided
if [ $# -ne 4 ]; then
    echo "Usage: $0 PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY"
    exit 1
fi

# Assign parameters to variables
PATH_TO_FILE="$1"
IP="$2"
USERNAME="$3"
PATH_TO_SSH_KEY="$4"

# Transfer the file using scp
scp -o StrictHostKeyChecking=no -i "$PATH_TO_SSH_KEY" "$PATH_TO_FILE" "$USERNAME"@"$IP":~/

# Check the return code of scp and display success/failure message
if [ $? -eq 0 ]; then
    echo "File transfer successful!"
else
    echo "File transfer failed!"
fi
```

#### Script 2: Nginx Installation

```bash
#!/usr/bin/env bash
# This script installs and configures Nginx on the web-01 server.

# Update package list and install nginx
sudo apt-get update
sudo apt-get install -y nginx

# Configure nginx to listen on port 80 and serve the desired content
echo "Holberton School for the win!" | sudo tee /var/www/html/index.html > /dev/null

# Restart nginx using the service command (systemctl is not allowed)
sudo service nginx restart
```

#### Script 3: Nginx Configuration

```bash
#!/usr/bin/env bash
# Configures an Nginx server to have a custom 404 page that contains the string 'Ceci n'est pas une page'

# Install nginx
sudo apt update
sudo apt install nginx -y
sudo touch /var/www/html/index.html
sudo touch /var/www/html/error404.html
echo "Holberton School" | sudo tee /var/www/html/index.html
echo "Ceci n'est pas une page" | sudo tee /var/www/html/error404.html

# Configure nginx
printf %s "server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html;
        error_page 404 /error404.html;

        server_name _;

        location /redirect_me {
           return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4/;
        }
}
" | sudo tee /etc/nginx/sites-available/default

# Restart nginx
sudo service nginx restart
```

### HTML/CSS Code

The following HTML and CSS code is used to create a custom 404 error page for the Nginx server.

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- ... -->
	</head>
	<body>
		<div class="container">
			<h2>Oops! Page not found.</h2>
			<h1>404</h1>
			<p>We can't find the page you're looking for, champ.</p>
			<br>
			<h2>Ceci n'est pas une page</h2>
			<a href="#">Go back home</a>
		</div>
	</body>
</html>
```

The accompanying CSS code styles the 404 error page and provides a visually appealing design.

### Usage

To use Script 1 for file transfer, run the following command:

```bash
./script1.sh PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
```

# Apache Container Runner

This Bash script is designed to start an Apache web server inside a designated container.

## Usage

1. Make sure you have Docker installed on your system.

2. Clone this repository or copy the script to your local machine.

3. Give execute permission to the script:
   ```bash
   chmod +x run_apache.sh
   ```

4. Run the script:
   ```bash
   ./run_apache.sh
   ```

This will start the Apache web server inside the container and set the ServerName to localhost.

## Requirements

- Docker must be installed on your system.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```


# Nginx Port Configuration Script

This Bash script is designed to help you troubleshoot and configure your Nginx installation on an Ubuntu container by replacing the default port from 8080 to 80 and restarting the Nginx service. It can be useful if you are experiencing issues with Nginx not listening on port 80 as expected.

## Prerequisites

Before using this script, make sure:

- You have administrative privileges or are running the script as a superuser (e.g., using `sudo`).
- Nginx is installed on your Ubuntu container.
- You are working with the default Nginx configuration file located at `/etc/nginx/sites-enabled/default`.

## Usage

1. Make the script executable if it's not already:

   ```bash
   chmod +x nginx-port-config.sh
   ```

2. Run the script:

   ```bash
   ./nginx-port-config.sh
   ```

The script will perform the following actions:

- It will use the `sed` command to replace all occurrences of "8080" with "80" in the Nginx configuration file (`/etc/nginx/sites-enabled/default`).
- It will then restart the Nginx service to apply the changes.

## Important Note

Please be cautious when using this script, as it directly modifies your Nginx configuration. Ensure you have a backup of your configuration or are confident in the changes being made.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

- [Telesphore Uwabera](https://github.com/Telesphore-Uwabera)

## Acknowledgments

- [Nginx](https://nginx.org) - The web server used in this script.
- [Ubuntu](https://ubuntu.com) - The Linux distribution where this script is intended to be used.


# Bash Script

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

# Puppet Code to Fix 'wp-settings.php'

This Puppet code is designed to fix a typo in the filename 'wp-setting.php' to 'wp-settings.php'. The code uses the `exec` resource to run a `sed` command that replaces the incorrect filename in the specified file. This README.md file provides an overview of the code and its usage.

## Prerequisites

Before using this Puppet code, make sure you have the following prerequisites in place:

1. Puppet Installed: Ensure that Puppet is installed on the target system where you intend to apply this code.

2. Permissions: Make sure the user running the Puppet agent has the necessary permissions to execute the `sed` command on the specified file.

## Puppet Code Explanation

```puppet
exec { '/var/www/html/wp-setting.php':
  path    => [ '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' ],
  command => "sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
}
```

- `exec`: This is a Puppet resource type that allows you to execute commands on the target system.

- `/var/www/html/wp-setting.php`: This is the path to the file where the replacement will be performed. Note that there might be a typo in the filename 'wp-setting.php,' and it should be 'wp-settings.php.'

- `path`: This parameter sets the PATH environment variable for the command execution. It ensures that the `sed` command can be found in the specified directories.

- `command`: This parameter specifies the command to be executed. In this case, it uses `sed` to replace '.phpp' with '.php' in the 'wp-settings.php' file.

## Usage

1. Copy the Puppet code provided above into your Puppet manifest file (e.g., `site.pp`).

2. Ensure that Puppet is correctly configured on the target system.

3. Run the Puppet agent on the target system:

   ```
   puppet agent -t
   ```

4. Puppet will execute the `sed` command, correcting the filename in the 'wp-settings.php' file.

## Troubleshooting

- If the code doesn't work as expected, check the following:
  - Verify that the file path and permissions are correct.
  - Ensure that Puppet is properly configured and running on the target system.
  - Check for any errors or issues in the Puppet logs.

## License

This Puppet code is provided under the [MIT License](LICENSE).
```
