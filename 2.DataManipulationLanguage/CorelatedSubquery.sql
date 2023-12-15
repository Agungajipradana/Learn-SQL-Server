/*
Correlated subquery adalah subquery di dalam query utama yang terkait dengan tabel atau baris dari query utama. 
Perbedaan utamanya dengan subquery biasa adalah bahwa dalam correlated subquery, subquery bergantung pada nilai dari baris 
saat ini dalam hasil query utama. Ini memungkinkan subquery dijalankan untuk setiap baris yang dievaluasi oleh query utama.

Contoh correlated subquery adalah sebagai berikut:

	SELECT 
		column1,
		column2,
		(SELECT MAX(column3) FROM another_table WHERE another_table.id = main_table.id) AS max_value
	FROM 
		main_table;


Dalam contoh ini, subquery yang dimulai dengan (SELECT MAX(column3) FROM another_table WHERE another_table.id = main_table.id) 
adalah correlated subquery. Perhatikan bahwa subquery ini memiliki kondisi WHERE yang menggunakan nilai dari main_table.id, 
yang merupakan kolom dari query utama.

Keuntungan dari correlated subquery adalah kemampuannya untuk memberikan hasil yang lebih terkait dengan setiap baris dalam hasil 
query utama. Namun, perlu diingat bahwa karena correlated subquery dievaluasi untuk setiap baris, kinerja query dapat terpengaruh 
jika tidak dioptimalkan dengan baik.

Correlated subquery berguna ketika Anda perlu mengambil informasi dari baris saat ini dalam query utama untuk digunakan dalam 
subquery.
*/

/*
Query SQL di bawah adalah contoh dari correlated subquery yang digunakan dalam SELECT statement untuk mengambil data dari 
tabel barang6 beserta informasi merek (brand_name) yang sesuai dari tabel barang6_brand.

1. SELECT barang_name, total, price, ...:

	- Memilih kolom barang_name, total, dan price dari tabel barang6.

2. (SELECT brand_name ...):

	- Correlated subquery yang mengambil brand_name dari tabel barang6_brand berdasarkan brand_id yang sesuai dengan brand_id 
	dari baris saat ini di tabel barang6.

3. AS 'Brand Name':

	- Memberikan alias 'Brand Name' pada kolom hasil subquery untuk memudahkan referensi.

4. FROM barang6:

	- Menentukan tabel sumber data sebagai barang6.

Dengan menggunakan correlated subquery, query ini akan menghasilkan kolom barang_name, total, price, dan Brand Name (nama merek) 
untuk setiap baris dalam tabel barang6. Subquery ini dievaluasi untuk setiap baris saat ini di tabel barang6, 
sehingga brand_name yang dipilih sesuai dengan nilai brand_id di setiap baris tersebut.
*/
SELECT 
	barang_name,
	total,
	price,
	(SELECT brand_name
		FROM barang6_brand
		WHERE brand_id = barang6.brand_id
	) AS 'Brand Name'
FROM barang6


/*
Query SQL di bawah adalah sebuah SELECT statement yang mengambil beberapa kolom dari tabel barang6 dan barang6_category. 
Di dalam SELECT statement, terdapat subquery yang disisipkan untuk mengambil brand_name dari tabel barang6_brand berdasarkan 
nilai brand_id pada tabel barang6.

1. SELECT barang_name, total, price, ...:

	- Memilih kolom barang_name, total, dan price dari tabel barang6.

2. (SELECT brand_name ...):

	- Subquery yang mengambil brand_name dari tabel barang6_brand berdasarkan nilai brand_id dari baris saat ini di 
	tabel barang6 (correlated subquery).

3. AS 'Brand Name':

	- Memberikan alias 'Brand Name' pada kolom hasil subquery untuk memudahkan referensi.

4. B.category_name AS 'Category Name':

	- Memilih kolom category_name dari tabel barang6_category dan memberikan alias 'Category Name'.

5. FROM barang6 AS A INNER JOIN barang6_category AS B ON A.category_id = B.category_id:

	- Menentukan tabel sumber data sebagai barang6 dan memberikan alias A.

	- Melakukan INNER JOIN dengan tabel barang6_category berdasarkan category_id.

6. WHERE A.brand_id = (SELECT brand_id ...):

	- Kondisi WHERE yang memfilter baris berdasarkan nilai brand_id.

	- Subquery ini digunakan untuk memastikan bahwa nilai brand_id pada baris saat ini di tabel barang6 sesuai dengan 
	nilai brand_id yang ada dalam tabel barang6_brand.

Dengan query ini, Anda akan mendapatkan hasil yang mencakup informasi barang_name, total, price, 'Brand Name', dan 
'Category Name' untuk baris-baris yang memenuhi kondisi-kondisi tertentu dalam tabel barang6.
*/
SELECT 
	barang_name,
	total,
	price,
	(SELECT brand_name
		FROM barang6_brand
		WHERE brand_id = A.brand_id
	) AS 'Brand Name',
	B.category_name AS 'Category Name'
FROM 
	barang6 AS A
	INNER JOIN barang6_category AS B ON A.category_id = B.category_id
WHERE 
	A.brand_id = (SELECT brand_id FROM barang6_brand WHERE brand_id = A.brand_id)