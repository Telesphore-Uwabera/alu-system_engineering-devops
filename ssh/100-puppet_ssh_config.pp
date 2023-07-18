import re

code = """
#!/usr/bin/env bash
#gdcy
file { '/root/.ssh/config':
  ensure => 'present',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
  content => "
Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
"
}
"""

regex_pattern = r"IdentityFile (.*)\n\s+PasswordAuthentication (\w+)"

matches = re.findall(regex_pattern, code)

if matches:
    print("Regexes Found:")
    for match in matches:
        print(match)
else:
    print("No regexes found.")

