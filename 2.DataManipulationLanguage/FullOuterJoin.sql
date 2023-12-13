/*
FULL OUTER JOIN dalam SQL Server adalah jenis operasi penggabungan yang menggabungkan semua baris dari kedua tabel yang 
dihubungkan oleh kondisi penggabungan, baik dari tabel kiri (tabel pertama) maupun dari tabel kanan (tabel kedua). 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, kolom-kolom yang berasal dari tabel yang tidak memiliki nilai 
sesuai akan diisi dengan NULL.

Berikut adalah sintaks umum untuk FULL OUTER JOIN:

	SELECT columns
	FROM table1
	FULL OUTER JOIN table2 ON table1.column = table2.column;

Penjelasan untuk setiap bagian dari sintaks di atas:

	- SELECT columns: Menentukan kolom-kolom yang akan diambil dari hasil query.
	- FROM table1: Menentukan tabel utama yang akan diambil data dari (tabel kiri).
	- FULL OUTER JOIN table2: Menunjukkan bahwa Anda akan melakukan operasi FULL OUTER JOIN dengan tabel kedua (tabel kanan).
	- ON table1.column = table2.column: Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai 
	pada kolom yang dihubungkan.

Contoh penggunaan FULL OUTER JOIN untuk menggabungkan tabel customers dan orders berdasarkan 
kesamaan nilai pada kolom customer_id:

	SELECT customers.customer_id, customers.customer_name, orders.order_id
	FROM customers
	FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id;

Dalam contoh ini, semua baris dari kedua tabel (customers dan orders) akan tetap ditampilkan, 
bahkan jika tidak ada kesamaan nilai di antara mereka. Jika tidak ada kesamaan, 
nilai-nilai dari kolom-kolom yang berasal dari tabel yang tidak memiliki nilai sesuai akan diisi dengan NULL.
*/

select * from barang6
select * from barang6_category
select * from barang6_brand order by brand_id asc

-- Menghapus constraint NOT NULL dari kolom category_id di tabel barang6
ALTER TABLE barang6
ALTER COLUMN category_id int NULL;

-- Memasukkan data ke dalam table "barang6"
insert into barang6 (barang_name, total, price, discount, category_id,brand_id) values ('Extra Fan Laptop', 5, 200000, null, null, null)

/*
- SELECT *: 
	Menampilkan semua kolom dari hasil query.

- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari (tabel kiri) dan memberikan alias A ke tabel tersebut.

- FULL OUTER JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan FULL OUTER JOIN dengan tabel kedua (tabel kanan) yaitu barang6_category menggunakan kolom category_id 
	sebagai kondisi penggabungan.

Hasil dari query ini akan mencakup semua baris dari kedua tabel, memasangkan baris berdasarkan kesamaan nilai pada kolom 
category_id. Jika tidak ada kesamaan nilai, kolom-kolom yang berasal dari tabel yang tidak memiliki nilai sesuai akan diisi 
dengan NULL.
*/
select * 
from barang6					 as A
full outer join barang6_category as B on A.category_id = B.category_id



/*
- SELECT *: 
	Menampilkan semua kolom dari hasil query.

- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari (tabel kiri) dan memberikan alias A ke tabel tersebut.

- FULL OUTER JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan FULL OUTER JOIN dengan tabel kedua (tabel kanan) yaitu barang6_category menggunakan kolom category_id 
	sebagai kondisi penggabungan.

- FULL OUTER JOIN barang6_brand AS C ON A.brand_id = C.brand_id: 
	Melakukan FULL OUTER JOIN dengan tabel ketiga (tabel kanan) yaitu barang6_brand menggunakan kolom brand_id 
	sebagai kondisi penggabungan.

Hasil dari query ini akan mencakup semua baris dari ketiga tabel, memasangkan baris berdasarkan kesamaan nilai 
pada kolom category_id dan brand_id. Jika tidak ada kesamaan nilai, kolom-kolom yang berasal dari tabel yang tidak memiliki 
nilai sesuai akan diisi dengan NULL.
*/
select * 
from barang6 as A
full outer join barang6_category as B on A.category_id = B.category_id
full outer join barang6_brand as C on A.brand_id = C.brand_id
