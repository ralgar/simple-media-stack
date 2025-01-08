# Simple Media Stack

A simple Docker stack to operate your own media server. Simple, but good.

## Getting Started

### Prerequisites

You will need a Linux machine, either bare metal or VM. You will also need
 to install the following dependencies:

- `docker`
- `docker-compose`

### Initial Setup

1. Clone this repository.

   ```sh
   git clone https://github.com/ralgar/simple-media-stack.git
   ```

1. Change your working directory to the cloned repository.

   ```sh
   cd simple-media-stack
   ```

1. Open the hidden `.env` file with your favorite text editor, and
   ensure the data root directories are set appropriately for your
   needs.

   ```sh
   DATA_ROOT='/srv'
   MEDIA_ROOT='/media'
   ```

1. Run `setup.sh` as root, to assert the required directories.

   ```sh
   sudo ./setup.sh
   ```

That's it! You're now ready to move on to [Managing the Stack](#managing-the-stack).

## Managing the Stack

**Bring the stack up**

```sh
docker-compose up -d
```

**Check stack status (by listing running containers)**

```sh
docker ps
```

**Bring the stack down**

```sh
docker-compose down
```

## License

Copyright: (c) 2025, Ryan Algar
 ([ralgar/simple-media-stack](https://github.com/ralgar/simple-media-stack))

BSD 2-clause License (see [LICENSE](LICENSE) or
 [BSD 2-clause](https://choosealicense.com/licenses/bsd-2-clause/))
