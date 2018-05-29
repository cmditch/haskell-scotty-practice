# Haskell Web Server & Database 
Using [Opaleye](http://hackage.haskell.org/package/opaleye) (DB) & [Scotty](http://hackage.haskell.org/package/scotty) (Web Server)  

[Opaleye Docs](http://haskell.vacationlabs.com/en/latest/docs/opaleye/instant-gratification.html#connecting-to-the-postgresql-database)

Run `stack build && stack runghc Main.hs` then open [localhost:3000/randomWord](http://localhost:3000/randomWord) in the browser.

### Database Config
This app assumes you have postgresql running with the following config:

    Database: opaleye  
    User:     test  
    Password: qwerty  


### Database Setup
Run `psql postgres -U test` and then `\connect opaleye`  
you should see  
`You are now connected to database "opaleye" as user "test".`  

Create and populate a `users` table with some data by pasting the following:

```sql
create table users(
   id serial primary key
  ,name text not null
  ,email text not null
);

insert into users(name, email) values ('John', 'john@mail.com');
insert into users(name, email) values ('Bob', 'bob@mail.com');
insert into users(name, email) values ('Alice', 'alice@mail.com');
```