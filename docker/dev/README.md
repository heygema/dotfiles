docker build -t dev-container .
docker run -it --rm dev-container


# optional
docker run -it --rm -v $(pwd):/workspace my-dev-container
