/*
INNER JOIN dalam SQL Server adalah operasi penggabungan tabel yang menghasilkan baris yang memenuhi kondisi penggabungan yang ditentukan.
Dalam konteks INNER JOIN, hanya baris yang memiliki nilai yang sesuai pada kolom yang dihubungkan yang akan dimasukkan ke dalam 
hasil query.

Berikut adalah sintaks dasar dari INNER JOIN:

	SELECT columns
	FROM table1
	INNER JOIN table2 ON table1.column = table2.column;

Penjelasan untuk setiap bagian dari sintaks di atas:

	- SELECT columns: Menentukan kolom-kolom yang akan diambil dari hasil query.
	- FROM table1: Menentukan tabel utama yang akan diambil data dari.
	- INNER JOIN table2: Menunjukkan bahwa Anda akan melakukan operasi INNER JOIN dengan tabel kedua, yaitu table2.
	- ON table1.column = table2.column: Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai pada kolom 
	yang dihubungkan.

Contoh penggunaan INNER JOIN untuk menggabungkan tabel customers dan orders berdasarkan kesamaan nilai pada kolom customer_id:

	SELECT customers.customer_id, customers.customer_name, orders.order_id
	FROM customers
	INNER JOIN orders ON customers.customer_id = orders.customer_id;

Dalam contoh ini, hanya baris-baris yang memiliki nilai yang sesuai pada kolom customer_id di kedua tabel yang akan dimasukkan ke 
dalam hasil query. Hasilnya akan berupa kombinasi data dari kedua tabel yang memenuhi kondisi penggabungan.
*/

-- membuat table barang6_brand:
create table barang6_brand (
	brand_id int identity primary key,
	brand_name varchar(50)
)

-- menambahkan column "brand_id" pada table "barang6" yang sudah dibuat dan berelasi ke table barang6_brand
alter table barang6
add brand_id int,
CONSTRAINT fk_brand_id_barang6 FOREIGN KEY (brand_id) REFERENCES barang6_brand(brand_id)

-- menambahkan constraint unique pada column barang_name pada table barang6_brand 
ALTER TABLE barang6_brand
ADD CONSTRAINT uc_brand_name UNIQUE (brand_name);

-- memasukkan data ke dalam table "barang6_brand"
insert into barang6_brand (brand_name) values ('Acer')
insert into barang6_brand (brand_name) values ('Asus')
insert into barang6_brand (brand_name) values ('Apple')
insert into barang6_brand (brand_name) values ('Samsung')
insert into barang6_brand (brand_name) values ('Xiaomi')
insert into barang6_brand (brand_name) values ('Sharp')
insert into barang6_brand (brand_name) values ('Canon')
insert into barang6_brand (brand_name) values ('Sony')
insert into barang6_brand (brand_name) values ('JBL')
insert into barang6_brand (brand_name) values ('Harman Kardon')
insert into barang6_brand (brand_name) values ('Fantech')
insert into barang6_brand (brand_name) values ('Logitech')
insert into barang6_brand (brand_name) values ('LG')
insert into barang6_brand (brand_name) values ('Panasonic')


-- Merubah isi kolom pada tabel barang6
UPDATE barang6
SET 
    barang_name = 'Television LG 20 Inc',
    total = 5,
    price = 5000000,
    discount = 500000,
    category_id = 8,
	brand_id = 13
WHERE barang_id = 16;

UPDATE barang6
SET 
    barang_name = 'Television Panasonic 25 Inc',
    total = 8,
    price = 7000000,
    discount = 1200000,
    category_id = 8,
	brand_id = 14
WHERE barang_id = 17;


select * from barang6
select * from barang6_category
select * from barang6_brand order by brand_id asc


/*
1. SELECT A.barang_name, A.total, A.price, B.category_name, C.brand_name: 
	Menentukan kolom-kolom yang akan ditampilkan dalam hasil query.

2. FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6.

3. INNER JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan INNER JOIN dengan tabel barang6_category menggunakan kolom category_id sebagai kondisi penggabungan.

4.	INNER JOIN barang6_brand AS C ON C.brand_id = A.barang_id: 
	Melakukan INNER JOIN dengan tabel barang6_brand menggunakan kolom barang_id (mungkin seharusnya brand_id) sebagai kondisi 
	penggabungan.
*/
select 
	A.barang_name, 
	A.total, 
	A.price,
	B.category_name,
	C.brand_name
from barang6 as A
inner join barang6_category as B
on A.category_id = B.category_id
inner join barang6_brand as C 
on C.brand_id=A.barang_id