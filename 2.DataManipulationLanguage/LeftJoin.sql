/*
LEFT JOIN dalam SQL Server, juga dikenal sebagai LEFT OUTER JOIN, adalah jenis operasi penggabungan yang menggabungkan baris dari 
dua tabel berdasarkan kondisi penggabungan dan semua baris dari tabel kiri (tabel pertama). Jika tidak ada baris yang sesuai di 
tabel kanan (tabel kedua), hasilnya akan berisi nilai NULL untuk kolom-kolom dari tabel kanan.

Berikut adalah sintaks umum untuk LEFT JOIN:

	SELECT columns
	FROM table1
	LEFT JOIN table2 ON table1.column = table2.column;

Penjelasan untuk setiap bagian dari sintaks di atas:

	- SELECT columns: Menentukan kolom-kolom yang akan diambil dari hasil query.
	- FROM table1: Menentukan tabel utama yang akan diambil data dari (tabel kiri).
	- LEFT JOIN table2: Menunjukkan bahwa Anda akan melakukan operasi LEFT JOIN dengan tabel kedua (tabel kanan).
	- ON table1.column = table2.column: Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai pada 
	kolom yang dihubungkan.

Contoh penggunaan LEFT JOIN untuk menggabungkan tabel customers dan orders berdasarkan kesamaan nilai pada kolom customer_id:

	SELECT customers.customer_id, customers.customer_name, orders.order_id
	FROM customers
	LEFT JOIN orders ON customers.customer_id = orders.customer_id;

Dalam contoh ini, semua baris dari tabel customers akan tetap ditampilkan, bahkan jika tidak ada kesamaan nilai di tabel orders. 
Jika tidak ada kesamaan, nilai-nilai dari kolom orders akan diisi dengan NULL.
*/

select * from barang6
select * from barang6_category
select * from barang6_brand order by brand_id asc

-- memasukkan data ke dalam table "barang6_category"
insert into barang6_category (category_name) values ('Printer')
insert into barang6_category (category_name) values ('Monitor')

-- memasukkan data ke dalam table "barang6_brand"
insert into barang6_brand (brand_name) values ('Realme')
insert into barang6_brand (brand_name) values ('AOC')

/*
- SELECT *: 
	Menentukan bahwa semua kolom dari hasil query akan ditampilkan.

- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6.

- LEFT JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan LEFT JOIN dengan tabel barang6_category menggunakan kolom category_id sebagai kondisi penggabungan.

- LEFT JOIN barang6_brand AS C ON A.brand_id = C.brand_id: 
	Melakukan LEFT JOIN dengan tabel barang6_brand menggunakan kolom brand_id sebagai kondisi penggabungan.

Hasil query ini akan menghasilkan gabungan antara data dari barang6, barang6_category, dan barang6_brand, 
dengan semua baris dari barang6 dan data yang sesuai dari barang6_category dan barang6_brand. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel kanan akan diisi dengan NULL.
*/

select *
from barang6				as A 
left join barang6_category	as B on A.category_id = B.category_id
left join barang6_brand		as C on A.brand_id = C.brand_id 

/*
- SELECT *: 
	Menentukan bahwa semua kolom dari hasil query akan ditampilkan.

- FROM barang6_category AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6_category.

LEFT JOIN barang6 AS B ON A.category_id = B.category_id: 
	Melakukan LEFT JOIN dengan tabel barang6 menggunakan kolom category_id sebagai kondisi penggabungan.

LEFT JOIN barang6_brand AS C ON B.brand_id = C.brand_id: 
	Melakukan LEFT JOIN dengan tabel barang6_brand menggunakan kolom brand_id sebagai kondisi penggabungan.

Hasil query ini akan menghasilkan gabungan antara data dari barang6_category, barang6, dan barang6_brand, 
dengan semua baris dari barang6_category dan data yang sesuai dari barang6 dan barang6_brand. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel kanan akan diisi dengan NULL.
*/

select *
from barang6_category	as A 
left join barang6		as B on A.category_id = B.category_id
left join barang6_brand as C on B.brand_id = C.brand_id 

/*
- SELECT A.barang_name, A.total, A.price, B.category_name, C.brand_name: 
	Menentukan kolom-kolom yang akan ditampilkan dalam hasil query.
	
- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6.

- LEFT JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan LEFT JOIN dengan tabel barang6_category menggunakan kolom category_id sebagai kondisi penggabungan.

- LEFT JOIN barang6_brand AS C ON A.brand_id = C.brand_id: 
	Melakukan LEFT JOIN dengan tabel barang6_brand menggunakan kolom brand_id sebagai kondisi penggabungan.

Hasil query ini akan menghasilkan gabungan antara data dari barang6, barang6_category, dan barang6_brand, 
dengan semua baris dari barang6 dan data yang sesuai dari barang6_category dan barang6_brand. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel kanan akan diisi dengan NULL.
*/

select 
	A.barang_name,
	A.total, 
	A.price,
	B.category_name,
	C.brand_name
from barang6				as A 
left join barang6_category	as B on A.category_id = B.category_id
left join barang6_brand		as C on A.brand_id = C.brand_id 

/*
- SELECT A.category_name, B.barang_name, B.total, B.price, C.brand_name: 
	Menentukan kolom-kolom yang akan ditampilkan dalam hasil query.

- FROM barang6_category AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6_category.

- LEFT JOIN barang6 AS B ON A.category_id = B.category_id: 
	Melakukan LEFT JOIN dengan tabel barang6 menggunakan kolom category_id sebagai kondisi penggabungan.

- LEFT JOIN barang6_brand AS C ON B.brand_id = C.brand_id: 
	Melakukan LEFT JOIN dengan tabel barang6_brand menggunakan kolom brand_id sebagai kondisi penggabungan.

Hasil query ini akan menghasilkan gabungan antara data dari barang6_category, barang6, dan barang6_brand, 
dengan semua baris dari barang6_category dan data yang sesuai dari barang6 dan barang6_brand. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel kanan akan diisi dengan NULL.
*/

select 
	A.category_name,
	B.barang_name,
	B.total, 
	B.price,
	C.brand_name
from barang6_category	as A 
left join barang6		as B on A.category_id = B.category_id
left join barang6_brand as C on B.brand_id = c.brand_id 
