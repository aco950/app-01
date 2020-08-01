# vi: syntax=javascript
job "app" {
  datacenters = ["dc4"]
  //type = "service"
  group "development" {
    count = 6
    ephemeral_disk {
      size = 300
    }
    task "server" {
      // These are the values of the IP and port of the container.
      // e.g.: $NOMAD_IP_http=192.168.4.101; $NOMAD_PORT_http=29385.
      env {
        PORT = "${NOMAD_PORT_http}"
        NODE_IP = "${NOMAD_IP_http}"
      }
      driver = "docker"
      config {
        image = "reg-01.ogilvie.us/app:latest"
          auth {
            // This needs to match what you're able to pull via 
            // 'docker pull' on a Nomad Client node.
            username = "username"
            password = "password"
          }
        // This will connect to a service running at port 80 inside
        // the container's network (172.*.*.*), and make it reachable 
        // via a random port on the LAN (e.g. - 192.168.4.101:24371).
        // In the case of Apache, this port needs to match 'EXPOSE' in
        // 'Dockerfile' and 'Listen' in httpd.conf.
        port_map {
          http = 80
        }
      }
      resources {
        cpu = 50 // MHz
        memory = 50 // MB
        network {
          mbits = 10
          port "http" {}
        }
      }
      service {
        name = "app"
        port = "http"
      }
    }
  }
}
