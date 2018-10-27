# data_science_dockerfile
Docker image with things I need for my data science projects

## Requirements

- Docker (duh)

## Build

From project directory:
```bash
docker build -t data_science -f data_science.Dockerfile .
```

## Basic usage

From directory you would like to have available in your Docker container:
```bash
docker run --rm -v "$(pwd)":/workdir data_science bash
```

## Jupyter

From directory you would like to have available in your Docker container:
```bash
docker run --rm -p 8888:8888 -v "$(pwd)":/workdir data_science jupyter-notebook --ip 0.0.0.0 --allow-root
```

## Adding stuff

*apt_requirements.txt*, *python_requirements.txt*

## Why no *matplotlib* in *python_requirements.txt*?

Because *graph-tool* will have already gotten one from apt repos (same case with numpy and pandas, but meh for now).
