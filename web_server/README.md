
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

Replace `PATH_TO_FILE`, `IP`, `USERNAME`, and `PATH_TO_SSH_KEY` with appropriate values.

### License

This project is licensed under the [MIT License](LICENSE).

---
