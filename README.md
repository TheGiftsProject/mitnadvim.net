## Welcome to the mitnadvim.net opensource project

The porpuse of the project is to give school administrators a tool to manage volunteering force in their school

##


##How do i contribute

We need help, and we encourge you to contribute to the project in any way you can!

Please take a look both at github issues, or at https://trello.com/board/mitnadvim-net/ to see what needs to be done


If you're a programmer:
1) Fork
2) Browse the code
3) Make your change
4) Submit a pull request


== PostgreSQL Installation
    1. If you don't have PostgreSQL installed, before running 'bundle install' run:
        sudo apt-get install postgresql
        sudo apt-get install libpq-dev

    2. When creating the database, if you encounter an error with the password, edit
        /etc/postgresql/9.1/main/pg_hba.conf

       and replace the existing table with the following:

        local   all             all                                     trust
        host    all             all             127.0.0.1/32            trust
        host    all             all             ::1/128                 trust

    3. Restart PostgreSQL: sudo /etc/init.d/postgresql restart

    4. When creating the database, if you encounter a 'role not found' error, do the following:
        sudo -u postgres createuser
