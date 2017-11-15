# These customizations are only added when running on Azure
# On Azure, the option "unknown-245" gets set by Azure DHCP

if grep -q unknown-245 /var/lib/dhcp/dhclient.eth0.leases; then

  # Aliases
  function azmeta() {
    curl -s -H 'Metadata: true' 'http://169.254.169.254/metadata/instance?api-version=2017-04-02' | jq
  }

fi
