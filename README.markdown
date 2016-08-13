## ONIX

[![Build Status](https://travis-ci.org/milkfarm/onix.svg?branch=master)](https://travis-ci.org/milkfarm/onix)

[ONIX for Books](http://www.editeur.org/8/ONIX/) is the international standard for representing and communicating
book industry product information in electronic form. It consists of an XML DTD
and schema.

This ONIX library provides a thin wrapper to the ONIX for Books XML standard.
It simplifies both the reading and writing of ONIX files in your Ruby applications.

## Limitations

This library supports ONIX 2.1 files only (all revisions).

ONIX::Reader only handles the reference tag versions of ONIX 2.1. Use
ONIX::Normaliser to convert any short tag files to reference tags.

ONIX::Writer only generates reference tag ONIX files.

## DTD Loading

To correctly interpret named entities when reading an ONIX 2.1 file,
your system XML catalog must include the ONIX DTD. For more information,
consult the instructions at http://github.com/yob/onix-dtd

## Installation

    gem install onix

## Usage

See files in the examples directory to get started quickly. For further reading
view the comments to the following classes:

* ONIX::Reader - For reading ONIX files
* ONIX::Writer - For writing ONIX files
* ONIX::Normaliser - For normalising ONIX files before reading them. Fixes encoding issues, etc
* ONIX::Lists - For building hashes of code lists from the ONIX spec

## Licensing

This library is distributed under the terms of the MIT License. See the included file for
more detail.

## Contributing

If you find a bug or would like to contribute functionality, please create an [issue on GitHub](https://github.com/milkfarm/onix/issues) or fork the project and send a pull request.

## Special Thanks

This code is derived from the work of [James Healy](https://github.com/yob) and [Joseph Pearson](https://github.com/joseph)
