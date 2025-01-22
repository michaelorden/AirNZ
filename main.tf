terraform {
  required_providers {
    asa = {
      source = "CiscoDevNet/asa"
      version = "1.0.0" # Specify the appropriate version
    }
  }
}

provider "asa" {
  # Connection details for the ASA device
  hostname = "your-asa-hostname"
  username = "your-username"
  password = "your-password"
  insecure = true # Set to true if you're not using a valid SSL certificate
}

resource "asa_access_rule" "example_rule" {
  name        = "Allow_HTTP"
  interface   = "outside" # The interface where the rule applies
  source      = "192.168.1.0/24" # Source network
  destination = "10.0.0.0/24" # Destination network
  service     = "tcp/80" # Service (protocol and port)
  action      = "permit" # Action for the rule (permit or deny)
  position    = 1 # Position in the access list
}
