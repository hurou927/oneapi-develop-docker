# OneAPI

## Usage

1. Fix `.env`. Check gid of `render` to use GPU.
  - e.g.) `cat /etc/group | awk -F ":" '/render/{print $3}`
2. Build and run.
  - e.g.) `make build run exec`
