# Customizations for easy interaction with Go
if [ -d "/usr/local/go/bin" ]; then
  export PATH="$PATH:/usr/local/go/bin"
  export PATH="$PATH:$(go env GOPATH)/bin"
fi
