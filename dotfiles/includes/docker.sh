export DOCKER_BUILDKIT=1

# Build current directory as 'quick'
function qb() {
  docker build -t quick .
}

# Run the 'quick' image
function qr() {
  docker run --rm quick $1
}

# Run the 'quick' image interactively
function qri() {
  docker run --rm -it quick $1
}

# Build & run the current directory
function qbr() {
  qb
  qr $1
}

# Build & run the current directory interactively
function qbri() {
  qb
  qri $1
}
