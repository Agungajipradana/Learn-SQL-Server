/*
GROUP BY dalam SQL Server adalah klausa yang digunakan dalam pernyataan SELECT untuk mengelompokkan baris berdasarkan 
nilai-nilai di satu atau beberapa kolom. Klausa ini memungkinkan Anda untuk melakukan operasi agregasi seperti 
SUM, COUNT, AVG, dll., pada setiap kelompok baris yang memiliki nilai yang sama dalam kolom-kolom yang ditentukan.

Contoh sintaks GROUP BY adalah sebagai berikut:

	SELECT column1, column2, aggregate_function(column3)
	FROM table_name
	GROUP BY column1, column2;

Dalam contoh ini, column1 dan column2 adalah kolom-kolom yang digunakan untuk mengelompokkan baris, 
sedangkan column3 adalah kolom yang akan dioperasikan oleh fungsi agregasi seperti SUM, COUNT, AVG, dll.

Berikut adalah contoh penggunaan GROUP BY dengan fungsi agregasi SUM:

	SELECT category_id, COUNT(*)
	FROM products
	GROUP BY category_id;

Query ini akan menghitung jumlah produk dalam setiap kategori (category_id) dari tabel products.
*/

select * from barang6
select * from barang6_category

/*
- COUNT(barang_id) as 'Total Barang': 
	Menghitung jumlah barang dalam setiap kelompok.

- SUM(discount) as 'Total Discount': 
	Menghitung total discount dalam setiap kelompok.

- A.category_id, B.category_name: 
	Kolom yang digunakan untuk mengelompokkan data.

- FROM barang6 AS A: 
	Tabel utama yang diambil datanya.

- LEFT JOIN barang6_category AS B ON A.category_id = B.category_id: 
	Menggabungkan tabel barang6 dengan barang6_category berdasarkan category_id.

- GROUP BY A.category_id, B.category_name: 
	Menyatakan kolom-kolom yang digunakan untuk mengelompokkan hasil query.
*/
select 
	count(barang_id) as 'Total Barang', 
	sum(discount)	 as 'Total Discount', 
	A.category_id,
	B.category_name 
from barang6 as A
left join barang6_category as B on A.category_id = B.category_id
group by A.category_id , B.category_name