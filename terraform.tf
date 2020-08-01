# vi: syntax=javascript
// Configure the Nomad provider:
provider "nomad" {
  address = "http://nm-01.ogilvie.us:4646"
  region = "global"
}

// Register a job:
resource "nomad_job" "app" {
  //jobspec = "${file("app.nomad")}"
  jobspec = file("${path.module}/app.nomad")
}

