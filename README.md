## Welcome to the mitnadvim.net opensource project

![Mitnadvim screenshot](https://img.skitch.com/20121017-qmbp94b4fk1r2hkn64ea2xw851.jpg "Current state screenshot")

The purpose of the project is to give school administrators a tool to manage volunteering force in their school

##How do i contribute

We need help, and we encourge you to contribute to the project in any way you can!

Most of the stuff that needs to be done are at:

* [Github issues](http://github.com/TheGiftsProject/mitnadvim.net/issues)
* [Trello](https://trello.com/board/mitnadvim-net/)
* [Google Groups](https://groups.google.com/forum/#!forum/mitnadvimnet)

If you're a programmer:

1. Fork
3. Make your change
4. Submit a pull request

If you're an activist/ pedagogue:
Please join our [google-group](https://groups.google.com/forum/#!forum/mitnadvimnet)


## Technical notes

### PostgreSQL Installation

  1. If you don't have PostgreSQL installed, before running 'bundle install' run:
      sudo apt-get install postgresql libq-dev

  2. When creating the database, if you encounter an error with the password, edit
      /etc/postgresql/9.1/main/pg_hba.conf

     and replace the existing table with the following:

      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust

  3. Restart PostgreSQL: sudo /etc/init.d/postgresql restart

  4. When creating the database, if you encounter a 'role not found' error, do the following:
      sudo -u postgres createuser
