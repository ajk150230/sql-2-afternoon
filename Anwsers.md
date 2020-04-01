1. Get all invoices where the `unit_price` on the `invoice_line` is greater than $0.99.

    select * from invoice_line where unit_price > 0.99

2. Get the `invoice_date`, customer `first_name` and `last_name`, and `total` from all invoices.

    select i.invoice_date, c.first_name, c.last_name, i.total from invoice i join customer c on i.invoice_id = c.customer_id 

3. Get the customer `first_name` and `last_name` and the support rep's `first_name` and `last_name` from all customers. 
    * Support reps are on the employee table.

    select c.first_name, c.last_name, s.first_name, s.last_name 
    from customer c join employee s 
    on c.customer_id = s.employee_id

4. Get the album `title` and the artist `name` from all albums.

    select a.title, b.name
    from album a join artist b
    on a.album_id = b.artist_id

5. Get all playlist_track track_ids where the playlist `name` is Music.

    select p.track_id 
    from playlist_track p join playlist t
    on p.playlist_id = t.playlist_id 
    where t.name = 'Music'

6. Get all track `name`s for `playlist_id` 5.

    select a.name 
    from track a 
    join playlist b 
    on a.track_id = b.playlist_id 
    where b.playlist_id = 5 

7. Get all track `name`s and the playlist `name` that they're on ( 2 joins ).

    select a.name, b.name 
    from track a 
    join playlist_track c on a.track_id = c.track_id
    join playlist b on c.playlist_id = b.playlist_id

8. Get all track `name`s and album `title`s that are the genre `Alternative & Punk` ( 2 joins ).

    select a.name, b.title
    from track a 
    join genre c on a.track_id = c.genre_id
    join album b on c.genre_id = b.album_id
    where c.name = 'Alternative & Punk'


-----------------------------------------------------------------------------
1. Get all invoices where the `unit_price` on the `invoice_line` is greater than $0.99.

    select *
    from invoice
    where invoice_id in 
    (select invoice_id from invoice_line where unit_price > 0.99 )

2. Get all playlist tracks where the playlist name is Music.

    select *
    from playlist_track
    where playlist_id in
    (select playlist_id from playlist where name = 'Music' )

3. Get all track names for `playlist_id` 5.

    select *
    from track
    where track_id in
    (select track_id from playlist_track where playlist_id = 5)

4. Get all tracks where the `genre` is Comedy.

    select * 
    from track
    where genre_id in
    (select genre_id from genre where name = 'Comedy')

5. Get all tracks where the `album` is Fireball.

    select * 
    from track
    where album_id in
    (select album_id from album where name = 'Fireball')

6. Get all tracks for the artist Queen ( 2 nested subqueries ).

    select *
    from track
    where album_id in
    (select album_id from album where artist_id in(
        select artist_id from artist where name = 'Queen'
     ))

-------------------------------------------------------------------

1. Find all customers with fax numbers and set those numbers to `null`.

    update customer
    set fax = null
    where fax is NOT null

2. Find all customers with no company (null) and set their company to `"Self"`.

    update customer
    set company = 'Self'
    where customer IS null

3. Find the customer `Julia Barnett` and change her last name to `Thompson`.

    update customer
    set last_name = 'Thompson'
    where first_name = 'Julia' AND last_name = 'Barnett

4. Find the customer with this email `luisrojas@yahoo.cl` and change his support rep to `4`.

    update customer 
    set support_rep_id = 4
    where email = 'luisrojas@yahoo.cl

5. Find all tracks that are the genre `Metal` and have no composer. Set the composer to `"The darkness around us"`.

    update tracks 
    set composer = 'The darkness around us'
    where genre_id = (select genre_id from genre where name = 'Metal')
    AND composer IS null

6. Refresh your page to remove all database changes.


-------------------------------------------------------------------


1. Find a count of how many tracks there are per genre. Display the genre name with the count.

    select count(*), b.name
    from track a
    join genre b on a.genre_id = b.genre_id
    group by b.name

2. Find a count of how many tracks are the `"Pop"` genre and how many tracks are the `"Rock"` genre.

    select count(*), b.name
    from track a
    join genre b on b.genre_id = a.genre_id
    where b.name = 'Pop' or b.name = 'Rock'
    group by b.name

3. Find a list of all artists and how many albums they have.

    select count(*), a.name
    from album b
    join artist a on a.artist_id = b.artist_id
    group by a.name


-------------------------------------------------------------------

1. From the `track` table find a unique list of all `composer`s.

    select distinct composer
    from track

2. From the `invoice` table find a unique list of all `billing_postal_code`s.

    select distinct billing_postal_code
    from invoice

3. From the `customer` table find a unique list of all `company`s

    select distinct company 
    from customer

-------------------------------------------------------------------

1. Copy, paste, and run the SQL code from the summary.
2. Delete all `'bronze'` entries from the table.

    DELETE 
    FROM practice_delete 
    WHERE type = 'bronze';

3. Delete all `'silver'` entries from the table.

    DELETE 
    FROM practice_delete 
    WHERE type = 'silver';

4. Delete all entries whose value is equal to `150`.

    DELETE
    FROM practice_delete
    WHERE value = '150'

*********GO TO ECOMMERCE.SQL FILE
