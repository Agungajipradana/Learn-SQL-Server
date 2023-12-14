/*
HAVING adalah klausa dalam SQL yang digunakan bersamaan dengan pernyataan GROUP BY untuk menetapkan suatu kondisi 
pada hasil agregasi. Pernyataan HAVING memfilter hasil agregasi berdasarkan kondisi tertentu setelah pengelompokan dilakukan.

Contoh penggunaan HAVING:

	SELECT category_id, COUNT(*) as total_products
	FROM products
	GROUP BY category_id
	HAVING COUNT(*) > 5;

Dalam contoh ini, kita menghitung jumlah produk dalam setiap kategori (category_id) dan menggunakan HAVING untuk memfilter 
hanya hasil yang memiliki lebih dari 5 produk.

Penting untuk diingat bahwa HAVING bekerja setelah fase pengelompokan (GROUP BY), dan dapat digunakan untuk menentukan kondisi 
berdasarkan hasil agregasi seperti COUNT, SUM, AVG, dll.
*/

select * from barang6

/*
1. SELECT: Menentukan kolom atau hasil perhitungan yang ingin ditampilkan dalam hasil query.

	- COUNT(*) AS 'Total Barang': 
		Menghitung jumlah baris dalam setiap kelompok dan memberikan alias 'Total Barang' pada hasil.

	- SUM(total) AS 'Total Qty': 
		Menghitung jumlah total dari kolom total dalam setiap kelompok dan memberikan alias 'Total Qty' pada hasil.

	- SUM(price) AS 'Total Price': 
		Menghitung jumlah total dari kolom price dalam setiap kelompok dan memberikan alias 'Total Price' pada hasil.

	- category_id: 
		Menampilkan nilai kolom category_id yang digunakan untuk pengelompokan.

2. FROM: Menentukan tabel atau sumber data yang digunakan dalam query, dalam hal ini tabel barang6.

3. GROUP BY: Menentukan kolom atau kolom-kolom yang digunakan untuk mengelompokkan hasil query. Dalam hal ini, 
	pengelompokan dilakukan berdasarkan category_id.

4. HAVING COUNT(*) > 2: Menetapkan kondisi pada hasil yang sudah dikelompokkan. Hanya hasil yang memiliki jumlah baris lebih 
	dari 2 yang akan dimasukkan dalam hasil akhir.
*/
select 
	count(*) as 'Total Barang',
	sum(total) as 'Total Qty',
	sum(price) as 'Total Price',
	category_id
from barang6 
group by category_id
having count(*) > 2

/*
1. SELECT: Menentukan kolom atau hasil perhitungan yang ingin ditampilkan dalam hasil query.

	- COUNT(*) AS 'Total Barang': 
		Menghitung jumlah baris dalam setiap kelompok dan memberikan alias 'Total Barang' pada hasil.
	
	- SUM(total) AS 'Total Qty': 
		Menghitung jumlah total dari kolom total dalam setiap kelompok dan memberikan alias 'Total Qty' pada hasil.

	- SUM(price) AS 'Total Price': 
		Menghitung jumlah total dari kolom price dalam setiap kelompok dan memberikan alias 'Total Price' pada hasil.
	
	- category_id: 
		Menampilkan nilai kolom category_id yang digunakan untuk pengelompokan.

2. FROM: Menentukan tabel atau sumber data yang digunakan dalam query, dalam hal ini tabel barang6.

3. GROUP BY: Menentukan kolom atau kolom-kolom yang digunakan untuk mengelompokkan hasil query. Dalam hal ini, 
	pengelompokan dilakukan berdasarkan category_id.

4. HAVING SUM(total) > 10: Menetapkan kondisi pada hasil yang sudah dikelompokkan. Hanya hasil yang memiliki jumlah total 
	kolom total lebih dari 10 yang akan dimasukkan dalam hasil akhir.
*/
select 
	count(*) as 'Total Barang',
	sum(total) as 'Total Qty',
	sum(price) as 'Total Price',
	category_id
from barang6 
group by category_id
having sum(total) > 10

