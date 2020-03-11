# Import-IOCFromCSV

Powershell Module to import Indicators of Compromise (IOCs) from a target CSV file.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

1) Clone the repository locally.
2) Edit the Debug.ps1 script to point to a valid CSV file, or use the included Valid.csv file.
3) Execute the Debug.ps1 script to test everything is working - it should print a list of indicators from the specified column (column number/index starts at 0).

### Prerequisites

You shouldn't need any prerequisites for this, other than a functional PowerShell install. I've only tested on Windows 10 with the built-in PowerShell 5.1, but I think it should work on most prior versions and possibly on PowerShell core as well. Let me know if you come across any version incompatiblities.

## Roadmap

Version 1.0:
* Basic functionality, importing from a specified column without any fancy validation or error correction.

Upcoming features:
* Automatic header detection and compensation if no header found
* Automatic column selection based on an input IOC type (e.g. SHA256)
* Automatic trimming of cells on import

## Versioning

I shall attempt to use [SemVer](http://semver.org/) for versioning. 

## Authors

* **Graeme Meyer** - *Initial work* - [@GraemeMeyer](https://github.com/GraemeMeyer)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to @PurpleBooth for the README.md template.
