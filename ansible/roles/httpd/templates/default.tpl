<VirtualHost *:80>
  DocumentRoot {{ documentrootdir }}
  ServerName {{ servername }}

  <Directory />
          Options Indexes FollowSymLinks Includes ExecCGI
          AllowOverride ALL
  </Directory>

  <Directory {{ documentrootdir }}>
    Options Indexes FollowSymLinks Includes ExecCGI
    AllowOverride All
    Require all granted
  </Directory>

  ErrorLog "/var/log/httpd/html-error_log"
  CustomLog "/var/log/httpd/html-access_log" common
</VirtualHost>
