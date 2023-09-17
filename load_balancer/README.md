
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
