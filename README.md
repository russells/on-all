# on-all

Run a command on a list of hosts.

## Outline

**on-all** will run a command on a specified list of hosts. The output of
each host can be in its own output section, or on a single line.

Hosts can be specified individually, or in lists of hosts. Hosts can also
be individually excluded from the list.

## Documentation

**on-all** includes a builtin help message. Type `on-all -h`.

**on-all** comes with a manual page.

## Installation

Run `make install`.

This will copy the **on-all** script to ${HOME}/bin, and copy `on-all.1` to
${HOME}/share/man/man1, where hopefully man(1) can find it.

## TODO

- [ ] Better installation.
- [X] Installation.
- [ ] Show what host list file(s) will be read.

## Author

Russell Steicke <russells@adelie.cx>
