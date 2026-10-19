# Changelog

All notable changes to the EasyPQP Docker image are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [0.1.59] - 2026-10-19

### Added
- Install EasyPQP 0.1.59 from Bioconda in a dedicated conda environment.
- Run the `easypqp` command as the image entry point and verify its help command during the build.
- Document how to build and run the image, including mounted directory permissions.

### Changed
- Set the image name to `easypqp` and replace template metadata with EasyPQP details.
