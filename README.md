# shSQL

An environment for MySQL and MariaDB

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Bash
* MariaDB or MySQL

### Configuration
* Rename `.envexample` file to `.env`
* Insert your database credentials into `.env` file, remember to don't commit it
* If you have, paste your database structure into `struct.sql` file.
* If you have, paste your database sample data into `sample.sql` file.

## Running
### Create your database and user
```
sh script/initialize-db.sh
```

### Reset or update your database
```
sh script/update-db.sh
```

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors
* **Giuseppe mastrobirraio Matranga** - *Initial work* - [Github](https://github.com/mastrobirraio)

## License
This project is licensed under the GNU GENERAL PUBLIC Version 3 LICENSE - see the [LICENSE.md](LICENSE) file for details.