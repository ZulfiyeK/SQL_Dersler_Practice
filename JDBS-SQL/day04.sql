select * from countries ;
/*
 Given
   User connects to the database
   (Kullanıcı veritabanına bağlanır)

 When
   User sends the query to get the region ids from "countries" table
   (Kullanıcı, 'countries' table'dan 'region id' almak üzere query gönderir )

 Then
   Assert that the number of region ids greater than 1 is 17.
   (1'den büyük region id'lerin sayısının 17 olduğunu doğrula )

 And
--   User closes the connection
*/

select count(region_id) from countries where region_id>1;--count ile region_id>1 olanlar 17 tane oldugunu elde ederim.
