SELECT * FROM music_database.album;
-- senior most employee based on job title
select * from employee;
select * 
from employee
order by levels desc
limit 1;

-- which country has the most invoices
select * from invoice;

select count(*),billing_country
from invoice
group by 2
order by 2 desc;

-- what are the top 3 values of total invoice
select * from invoice;

select total
from invoice
order by 1 desc
limit 3;

-- which city has best customers? the city which have the highest sum of total invoices

select * from invoice;

select billing_city,sum(total) as invoice_total
from invoice
group by 1
order by invoice_total desc
limit 1;

-- who is the best customer?the person who have spent the most money

select * from customer;

select a.customer_id,b.first_name,b.last_name,sum(total) as invoice_total
from invoice a
join customer b
on a.customer_id = b.customer_id
group by 1
order by invoice_total desc
limit 1;

-- return first name,last name,email, genre of all rock music listners ordered alphabatically by email
select * from genre;
select * from customer;
select * from track;
select * from invoice_line;
select * from invoice;

select distinct first_name,last_name,email
from customer
join invoice on
customer.customer_id = invoice.customer_id
join invoice_line on
invoice.invoice_id = invoice_line.invoice_id
where track_id in(
          select track_id from track
          join genre on track.genre_id = genre.genre_id
          where genre.name like "Rock"
)
order by email;

-- Artists who have written the most rock music,return artist name and top 10 rock bands

select * from artist;
select * from track;
select * from album;
select * from genre;

select artist.artist_id ,artist.name,count(artist.artist_id) as number_of_songs
from track
join album on track.album_id = album.album_id
join artist on album.artist_id = artist.artist_id
join genre on track.genre_id = genre.genre_id 
where genre.name like "Rock" 
group by artist.artist_id
order by number_of_songs desc
limit 10;

-- Return the name,milliseconds for each track where the tracks have song length greater than the avg song length order by song length

select * from track;

select name, milliseconds
from track
where milliseconds >(
select avg(milliseconds)
from track
)
order by milliseconds desc;

