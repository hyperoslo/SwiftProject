# SwiftProject

**SwiftProject** is a template to generate Swift-based iOS projects from the
command line.

## Features

- [x] A basic folder structure.
- [x] Swift common types, helpers and configurators.
- [x] Recommended pods in `Podfile`
- [x] Integrated [SwiftLint](https://github.com/realm/SwiftLint) and [R.swift](https://github.com/mac-cain13/R.swift)
- [x] Schemes for `Staging` and `Production`

## Project Structure

- Sources: contains source files
	- App
	- AppDelegate
	- Config
	- Constants
	- Extensions
	- Features
	- Library

- Resources: contains resource files
	- Assets Catalog
	- Fonts
	- Info 
	- Storyboard
	- Localised strings files

## Usage

1. Create new private repository on [GitHub](https://github.com/organizations/hyperoslo/repositories/new)
1. `git clone https://github.com/hyperoslo/SwiftProject.git NewProjectName`
2. `cd NewProjectName`
3. `ruby ./init.rb`
4. Enter the requested info.

## Author

Hyper Interaktiv AS, ios@hyper.no
