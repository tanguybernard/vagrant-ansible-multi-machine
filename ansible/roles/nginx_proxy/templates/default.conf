upstream application {
  {* Mon commentaire dans smarty *}
  {% for host in groups['web'] %}
        server {{ host }};
  {% endfor %}

    {* server 192.168.30.22; *}
    {* server 192.168.30.23; *}
}

server {
    listen  80;
    server_name {{ nginx.servername }};

    location / {
        proxy_set_header  Host             $host;
        proxy_set_header  X-Real-IP        $remote_addr;
        proxy_set_header  X-Forwarded-For  $remote_addr;
        proxy_pass http://application;
    }
}
