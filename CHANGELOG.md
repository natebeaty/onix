# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.10.0] - 2016-08-13
### Changed
- Merge joseph-refactor branch into master. This is a significant,
  opinionated change to the structure of the original gem.

## [0.9.1] - 2011-09-05
### Changed
- Relax activesupport dependency to work with rails 3 or 3.1

## [0.9.0] - 2011-04-14
### Added
- Options hash to ONIX::Reader. Only option at this stage is :encoding,
  which allows the user to override the assumed encoding of the input XML

### Changed
- Switch back to the vanilla roxml gem. Ben is maintaining it again and
  he has merged in my bug fixes
- Clarify comments explaining encoding behaviour
- API change, so new minor version

## [0.8.5] - 2010-12-21
### Changed
- Update packaging - use bundler and rspec 2.x
- Support normalising short tag files that include HTML tags

## [0.8.4] - 2010-10-18
### Changed
- Some small fixes to xml names from Tim
- Make all code lists available via the ONIX::Lists class

## [0.8.3] - 2010-09-09
### Changed
- Fix for race condition in ONIX::Normaliser
  - thanks to pixelvixen for reporting
- Force roxml to be 3.1.6 or higher. Earlier versions misbehaved when monkey
  patching nokogiri

## [0.8.2] - 2010-05-06
### Changed
- Fix APAProduct#series and APAProduct#series=

## [0.8.1] - 2010-01-05
### Added
- The release attribute to files we generate
  - it's optional in 2.1, but mandatory in 3.0. As we start to see 3.0 files in the
    wild it will help to have a rapid way to distinguish between them
- ONIX::Reader#release - to detect the release version of files we read in

### Changed
- Use nokogiri's support for transparent entity conversion when reading an ONIX file

### Removed
- Entity replacement from ONIX::Normaliser
  - the external dependency on sed made me uncomfortable, and it wasn't really
    necessary now that nokogiri can do it for us
- UTF-8 normalisation from ONIX::Normaliser
  - nokogiri also handles this really cleanly and transparently. Regardless of
    the source file encoding, Nokogiri::Reader returns utf-8 encoded data

## [0.8.0] - 2009-10-31
### Changed
- Replace LibXML dependency with Nokogiri. Nokogiri is under active development, has
  a responsive maintainer and is significantly more stable
- Switch to ROXML 3.x
  - roxml also switched from libxml to nokogiri
  - roxml removed deprecated parts of it's API
  - should now avoid various conflicts with mongrel
- Ensure APAProduct#price returns the first product price and ignores
  the price type

## [0.7.8] - 2009-10-19
### Added
- Support for additional elements (mostly series and audience related)
  - thanks tim

## [0.7.7] - 2009-10-01
### Changed
- Optimise sed usage in ONIX::Normaliser. *huge* speed improvement on
  large files.

## [0.7.6] - 2009-09-21
### Changed
- Provide access to the PackQuantity element

## [0.7.5] - 2009-09-08
### Changed
- Don't raise an exception on malformed dates when reading files

## [0.7.4] - 2009-09-02
### Changed
- Expand ONIX::Normaliser
  - strip control chars
  - add encoding declaration to valid utf-8 files that aren't declared
    as such

## [0.7.3] - 2009-08-19
### Changed
- Switch from java to xsltproc to convert short tag ONIX files
  to reference tags

## [0.7.2] - 2009-08-19
### Added
- ONIX::Normaliser class
  - for normalising various ONIX files into a form that makes them easy
    to process. Shouldn't be necesary to pre-process files like this, but
    I'm sick of trying to wrestle the libxml ruby bindings

## [0.7.1] - 2009-06-24
### Changed
- Small tweak to ordering of elements in the Product group

## [0.7.0] - 2009-06-17
### Changed
- Try using LibXML for reader again
  - retrieving the ONIX version of the input file is currently disabled, as
    that seems to be the source of our instability
- Various Ruby 1.9 compatability tweaks
  - add source file coding declarations. All source files are UTF-8
  - ONIX::Reader ensures all input data is converted to UTF-8
  - the ROXML based objects seem to forget the encoding when they're marshalled,
    so force string based attributes *back* to UTF-8

## [0.6.7] - Unreleased
### Added
- Some accessors to the Title composite

## [0.6.6] - Unreleased
### Changed
- Forget the S on an element name

## [0.6.5] - Unreleased
### Changed
- Ruby 1.9 compat

## [0.6.4] - Unreleased
### Added
- APAProduct#price

## [0.6.3] - Unreleased
### Changed
- Bump ROXML dependency to 2.5.3 to get libxml-ruby 1.1.3 compatibility

## [0.6.2] - Unreleased
### Changed
- Fix a small typo in APAProduct

## [0.6.1] - Unreleased
### Changed
- Stopped using LibXMLs Reader class as the basis for our reader.
  - We were getting too many segfaults (even 1 is too many!)
  - until we resolve it, reverted to manual string parsing
  - This is a fairly major regression of functionality. For 99% of files
    it won't matter, but for some corner cases it will. ie UTF-16 encoded
    files
  - Will also be noticeably slower
  - Hopefully only a short term fix, until I work out what is going on with
    libxml

## [0.6.0] - 2009-03-18
### Changed
- Bump required ROXML version to 2.5.2

### Removed
- Use of threads in ONIX::Reader
  - a producer/consumer pattern was useful in the REXML stream parsing days, but
    now LibXML's Reader binding provides a better alternative
  - API left unchanged, this was all under the hood

## [0.5.1] - 2009-03-04
### Changed
- Fix a single letter typo

## [0.5.0] - 2009-03-02
### Changed
- Switch ROXML dependency from a patched version to vanilla
  - Vanilla ROXML now has all the features we need
  - This change should be transparent to ONIX gem users

## [0.4.7] - 2008-12-09
### Changed
- Contributor sub elements should match the order specified in the DTD

## [0.4.6] - 2008-12-02
### Changed
- Two new accessors on the contributor class - bio and corporate name

## [0.4.5] - 2008-11-21
### Changed
- APAProduct wrapper should generate valid MediaFile composites

## [0.4.4] - 2008-11-19
### Added
- Support for more elements from MarketRepresentation

## [0.4.3] - 2008-11-11
### Added
- Support for AgentName and MarketPublishingStatus

## [0.4.2] - 2008-11-01
### Changed
- Minor reordering of elements to match DTD

### Removed
- Final remnants of REXML code

## [0.4.1] - Unreleased
### Added
- Accessors to various product measurements. Height, weight, etc.
- Reduced time for an ONIX::Reader class to initialise

## [0.4.0] - 2008-10-28
### Changed
- Major rework: now based on ROXML instead of xml-mapping
  - Mostly API Compatible
  - StreamReader and StreamWriter renamed to Reader and Writer
  - ROXML is based on libxml, so things should be significantly faster

## [0.2.7] - Unreleased
### Added
- Line breaks after each product

## [0.2.5] - Unreleased
### Changed
- Make PublishingStatus a two_digit_node

## [0.2.4] - Unreleased
### Changed
- Initialise the media files array of a new product correctly

## [0.2.3] - Unreleased
### Changed
- Switch a few more fields over to TwoDigitNodes
- Make the product availability field accessible from APAProduct

## [0.2.2] - Unreleased
### Added
- A new nodetype (DateNode) for YYYYMMDD fields

## [0.2.1] - Unreleased
### Added
- A new nodetype (TwoDigitNode) for two digit codes

## [0.2.0] - 2008-07-16
### Added
- Support for reading and storing subject codes (BIC, BISAC, etc)

## [0.1.0] - 2008-06-12
### Added
- Initial Release
