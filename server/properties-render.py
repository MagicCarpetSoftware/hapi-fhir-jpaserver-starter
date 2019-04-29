import os
import sys
from jproperties import Properties


def main(path):
    properties = Properties()

    with open(path, "rb") as f:
        properties.load(f, "utf-8")

    for key in properties.iterkeys():
        if os.environ.get(key.replace('.', '_')):
            properties[key] = os.environ[key.replace('.', '_')]

    with open(path, "wb") as f:
        f.truncate(0)
        properties.store(f, encoding="utf-8")


if __name__ == '__main__':
    main(sys.argv[1])
