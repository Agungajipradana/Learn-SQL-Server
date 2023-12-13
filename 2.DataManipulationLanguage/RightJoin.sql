/*
RIGHT JOIN dalam SQL Server, juga dikenal sebagai RIGHT OUTER JOIN, adalah jenis operasi penggabungan yang menggabungkan baris 
dari dua tabel berdasarkan kondisi penggabungan dan semua baris dari tabel kanan (tabel kedua). 
Jika tidak ada baris yang sesuai di tabel kiri (tabel pertama), hasilnya akan berisi nilai NULL untuk kolom-kolom dari tabel kiri.

Berikut adalah sintaks umum untuk RIGHT JOIN:

	SELECT columns
	FROM table1
	RIGHT JOIN table2 ON table1.column = table2.column;

Penjelasan untuk setiap bagian dari sintaks di atas:

	- SELECT columns: Menentukan kolom-kolom yang akan diambil dari hasil query.
	- FROM table1: Menentukan tabel utama yang akan diambil data dari (tabel kiri).
	- RIGHT JOIN table2: Menunjukkan bahwa Anda akan melakukan operasi RIGHT JOIN dengan tabel kedua (tabel kanan).
	- ON table1.column = table2.column: Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai 
	pada kolom yang dihubungkan.

Contoh penggunaan RIGHT JOIN untuk menggabungkan tabel customers dan orders berdasarkan kesamaan nilai pada kolom customer_id:

	SELECT customers.customer_id, customers.customer_name, orders.order_id
	FROM customers
	RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

Dalam contoh ini, semua baris dari tabel orders akan tetap ditampilkan, bahkan jika tidak ada kesamaan nilai di tabel customers. 
Jika tidak ada kesamaan, nilai-nilai dari kolom customers akan diisi dengan NULL.
*/

select * from barang6
select * from barang6_category
select * from barang6_brand order by brand_id asc

/*
- SELECT *: 
	Menentukan bahwa semua kolom dari hasil query akan ditampilkan.

- FROM barang6_category AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6_category.

- RIGHT JOIN barang6 AS B ON A.category_id = B.category_id: 
	Melakukan RIGHT JOIN dengan tabel barang6 menggunakan kolom category_id sebagai kondisi penggabungan.

Hasil query ini akan menghasilkan gabungan antara data dari barang6_category dan barang6, 
dengan semua baris dari barang6 dan data yang sesuai dari barang6_category. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel kiri (barang6_category) akan diisi dengan NULL.
*/
select * 
from barang6_category	as A
right join barang6		as B on A.category_id = B.category_id

/*
- SELECT *: 
	Menentukan bahwa semua kolom dari hasil query akan ditampilkan.

- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6.

- RIGHT JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan RIGHT JOIN dengan tabel barang6_category menggunakan kolom category_id sebagai kondisi penggabungan.

Hasil query ini akan menghasilkan gabungan antara data dari barang6 dan barang6_category, dengan semua baris dari 
barang6_category dan data yang sesuai dari barang6. Jika tidak ada kesamaan nilai pada kondisi penggabungan, 
nilai-nilai dari tabel kiri (barang6) akan diisi dengan NULL.
*/
select * 
from barang6				as A
right join barang6_category as B on A.category_id = B.category_id


/*
- SELECT *: 
	Menentukan bahwa semua kolom dari hasil query akan ditampilkan.

- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6.

- RIGHT JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan RIGHT JOIN dengan tabel barang6_category menggunakan kolom category_id sebagai kondisi penggabungan.

- RIGHT JOIN barang6_brand AS C ON A.brand_id = C.brand_id: 
	Melakukan RIGHT JOIN dengan tabel barang6_brand menggunakan kolom brand_id sebagai kondisi penggabungan.

- ORDER BY C.brand_id ASC: 
	Mengurutkan hasil query berdasarkan kolom brand_id dari tabel barang6_brand secara ascending 
	(berurutan dari nilai terkecil ke terbesar).

Hasil query ini akan menghasilkan gabungan antara data dari barang6, barang6_category, dan barang6_brand, 
dengan semua baris dari barang6_brand dan data yang sesuai dari barang6 dan barang6_category. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel-tabel kiri (barang6 dan barang6_category) 
akan diisi dengan NULL.
*/
select * 
from barang6				as A
right join barang6_category as B on A.category_id = B.category_id
right join barang6_brand	as C on A.brand_id = C.brand_id 
order by C.brand_id asc


/*
- SELECT A.barang_name, A.total, A.price, B.category_name, C.brand_name: 
	Menentukan kolom-kolom yang akan ditampilkan dalam hasil query.

- FROM barang6 AS A: 
	Menentukan tabel utama yang akan diambil data dari, dengan memberikan alias A pada tabel barang6.

- RIGHT JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Melakukan RIGHT JOIN dengan tabel barang6_category menggunakan kolom category_id sebagai kondisi penggabungan.

- RIGHT JOIN barang6_brand AS C ON A.brand_id = C.brand_id: 
	Melakukan RIGHT JOIN dengan tabel barang6_brand menggunakan kolom brand_id sebagai kondisi penggabungan.

- ORDER BY C.brand_id ASC: 
	Mengurutkan hasil query berdasarkan kolom brand_id dari tabel barang6_brand secara ascending 
	(berurutan dari nilai terkecil ke terbesar).

Hasil query ini akan menghasilkan gabungan antara data dari barang6, barang6_category, dan barang6_brand, 
dengan semua baris dari barang6_brand dan data yang sesuai dari barang6 dan barang6_category. 
Jika tidak ada kesamaan nilai pada kondisi penggabungan, nilai-nilai dari tabel-tabel kiri (barang6 dan barang6_category) 
akan diisi dengan NULL. Hasilnya juga akan diurutkan berdasarkan kolom brand_id dari tabel barang6_brand secara ascending.
*/
select 
	A.barang_name,
	A.total,
	A.price,
	B.category_name,
	C.brand_name
from barang6				as A
right join barang6_category as B on A.category_id = B.category_id
right join barang6_brand	as C on A.brand_id = C.brand_id 
order by C.brand_id asc





