# Agents

## Build
- Run from repository root: `mkdir -p build && cd build && make -f ../Makefile deb.
- The make target depends on the version in `packaging/DEBIAN/changelog` and leaves the generated `.deb` in the current directory.

## Layout
- `packaging/` contains the staging tree passed to `dpkg-deb`; its `DEBIAN/` subdirectory holds control metadata and maintainer scripts, while `etc/` contains the diverted hook replacements.

