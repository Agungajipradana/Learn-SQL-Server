/*
Operasi IN pada SQL Server digunakan untuk menyaring hasil query berdasarkan sejumlah nilai yang diberikan. 
Ini memungkinkan Anda membuat kondisi yang memeriksa apakah nilai dalam suatu kolom ada di antara beberapa nilai yang telah ditentukan.

Sintaksis umum operasi IN dalam pernyataan WHERE adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table_name
	WHERE column_name IN (value1, value2, ...);

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- column_name: Kolom yang akan diperiksa apakah nilainya ada di antara nilai-nilai yang diberikan.
	- (value1, value2, ...): Daftar nilai yang akan dibandingkan dengan nilai dalam kolom yang ditentukan. 
	Jika nilai kolom sama dengan salah satu nilai dalam daftar, baris akan dimasukkan dalam hasil.

Contoh penggunaan operasi IN:

	SELECT * FROM employees
	WHERE department IN ('IT', 'Finance', 'HR');

Contoh di atas akan mengambil semua baris dari tabel employees di mana nilai kolom 'department' ada di antara 'IT', 
'Finance', atau 'HR'.

IN sangat berguna ketika Anda ingin memfilter baris berdasarkan nilai yang mungkin berasal dari sekumpulan nilai tertentu,
seperti daftar departemen, kategori, atau nilai lainnya.
*/

-- membuat table "barang6_category"
create table barang6_category (
	category_id int identity primary key,
	category_name varchar(50)
)

-- memasukkan data ke dalam table "barang6_category"
insert into barang6_category (category_name)values('Laptop')
insert into barang6_category (category_name)values('Handphone')
insert into barang6_category (category_name)values('Air Conditioner')
insert into barang6_category (category_name)values('Camera')
insert into barang6_category (category_name)values('Speaker')
insert into barang6_category (category_name)values('Keyboard')
insert into barang6_category (category_name)values('Mouse')
insert into barang6_category (category_name)values('Televison')
insert into barang6_category (category_name)values('Cable')

-- menampilkan semua data pada table "barang6_category"
select * from barang6_category

-- membuat table "barang6" yang berelasi ke table "barang6_category"
create table barang6 (
	barang_id int identity primary key,
	barang_name varchar(50),
	total int,
	price money check(price > 0),
	discount money,
	category_id int not null,
	CONSTRAINT fk_category_id_barang6 FOREIGN KEY (category_id) REFERENCES barang6_category(category_id)
)

-- memasukkan data ke dalam table "barang6_category"
insert into barang6 (barang_name, total, price, discount, category_id) values ('Laptop Acer Aspire 5', 10, 10000000, 1500000, 1)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Laptop Asus ROG Strix', 5, 20000000, 2500000, 1)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Laptop Macbook M1', 6, 15000000, 2500000, 1)
insert into barang6 (barang_name, total, price, discount, category_id) values ('HP Android Samsung S21', 10, 20000000, 3000000, 2)
insert into barang6 (barang_name, total, price, discount, category_id) values ('HP Android Xiaomi 10', 5, 7000000, 500000, 2)
insert into barang6 (barang_name, total, price, discount, category_id) values ('HP Iphone 14', 5, 14000000, 2000000, 2)
insert into barang6 (barang_name, total, price, discount, category_id) values ('HP Iphone 13', 5, 12000000, 1500000, 2)
insert into barang6 (barang_name, total, price, discount, category_id) values ('AC Samsung 2 PK', 10, 6500000, 1000000, 3)
insert into barang6 (barang_name, total, price, discount, category_id) values ('AC Sharp 1 PK', 4, 4500000, 500000, 3)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Camera Canon DSLR', 7, 8000000, 800000, 4)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Camera Sony A7', 8, 15000000, 1500000, 4)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Speaker JBL Mini', 5, 750000, 50000, 5)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Speaker Harman Onyx Studio 7', 10, 5500000, 550000, 5)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Keyboard Fantech Gaming', 15, 2200000, 250000, 6)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Mouse Logitech L200', 8, 2200000, 250000, 7)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Television LG 20 Inc', 5, 5000000, 500000, 8)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Television Panasonic 25 Inc', 8, 7000000, 1200000, 8)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Cable HDMI', 10, 150000, null, 9)
insert into barang6 (barang_name, total, price, discount, category_id) values ('Cable AUX', 5, 100000, null, 9)

-- menampilkan semua data pada table "barang6
select * from barang6

-- menampilkan semua data pada table "barang6" dimana pada column "total" terdapat nilai 5 or 10
-- jika salah satu diantara 2 nilai tersebut datanya ada, maka akan tetap ditampilkan
select * from barang6 where total=5 or total=10 

-- menampilkan semua data pada table "barang6" dimana pada column "total" terdapat nilai 5 dan 10
-- penggunaan operasi in sama juga seperti penggunaan operasi or seperti perintah diatas
-- tetapi penggunaan operasi in lebih efisien dibanding penggunaan operasi or
select * from barang6 where total in(5,10)

-- menampilkan semua data yang ada pada table "barang6" dimana column "category_id" in
-- column "category_id" pada table "barang6_category" dimana column "category_name="Laptop"
-- akan menampilkan data berupa Laptop
select * from barang6 
where category_id in (select category_id from barang6_category where category_name='Laptop')







