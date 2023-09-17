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
