# plantuml-docker
Docker image of `plantuml`

## Usage

```sh
$ docker run -v [PLANT_UML_TEXT_FILE_DIR]:/home \
    hacomono/plantuml \
    [PLANT_UML_TEXT_FILE]
```

## Example

```sh
$ docker run -v /usr/home/:/home \
    hacomono/plantuml \
    diagram.txt
# diagram.png is out in /usr/home.
```


# References

- https://github.com/ryutah/docker-plantuml-cli
