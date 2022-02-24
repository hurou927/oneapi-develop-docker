# OneAPI

## Usage

1. Fix `.env`. Check gid of `render` to use GPU.
  - e.g.) `cat /etc/group | awk -F ":" '/render/{print $3}`
2. Build and run.
  - e.g.) `make build run exec`
3. Check devices in a Docker container
  - e.g.) `sycl-ls`
    ```sh
    godric@26c65c1d7001:~$ sycl-ls
    [opencl:0] ACC : Intel(R) FPGA Emulation Platform for OpenCL(TM) 1.2 [2021.13.11.0.23_160000]
    [opencl:0] CPU : Intel(R) OpenCL 3.0 [2021.13.11.0.23_160000]
    [opencl:0] GPU : Intel(R) OpenCL HD Graphics 3.0 [21.37.20939]
    [level_zero:0] GPU : Intel(R) Level-Zero 1.1 [1.2.20939]
    [host:0] HOST: SYCL host platform 1.2 [1.2]
    ```
