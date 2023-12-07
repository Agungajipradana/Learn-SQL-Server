/*
SELECT DISTINCT pada SQL Server digunakan untuk mengambil nilai unik dari satu atau beberapa kolom dalam hasil query. 
Ini memastikan bahwa hasil query hanya mengembalikan satu salinan dari setiap nilai unik dalam kolom atau kolom-kolom yang ditentukan.

Berikut adalah sintaksis dasar dari SELECT DISTINCT:
	SELECT DISTINCT column1, column2, ...
	FROM table_name
	WHERE condition;

	- column1, column2, ...: Kolom atau kolom-kolom yang ingin Anda ambil nilai uniknya.
	- table_name: Nama tabel dari mana data akan diambil.
	- WHERE condition: Kondisi opsional untuk memfilter data sebelum mengambil nilai unik.

Contoh penggunaan SELECT DISTINCT:
	-- Mengambil nilai unik dari kolom 'category' dari tabel 'products'
	SELECT DISTINCT category
	FROM products;

Dalam contoh ini, pernyataan SELECT DISTINCT mengambil nilai unik dari kolom 'category' dalam tabel 'products'. 
Ini memastikan bahwa setiap nilai yang dikembalikan adalah nilai unik, dan tidak ada duplikasi dalam hasil query.

Penting untuk diingat bahwa SELECT DISTINCT bekerja pada seluruh baris, sehingga jika Anda memilih beberapa kolom, 
itu akan mempertimbangkan kombinasi nilai unik dari seluruh baris, bukan setiap kolom secara terpisah.
*/

select * from barang5

-- menampilkan data dari column 'discount' dari table 'barang5' dan 
-- mengurutkannya secara descending berdasarkan nilai 'discount'.
-- hanya mengambil semua nilai dari column 'discount' dan mengurutkannya. 
-- Nilai yang sama akan muncul beberapa kali jika terdapat duplikasi dalam column 'discount'.
select discount from barang5 order by discount desc

-- menampilkan data berupa nilai unik dari column 'discount' dari table 'barang5' dan 
-- mengurutkannya secara descending berdasarkan nilai 'discount'.
-- mengambil nilai unik dari kolom 'discount'. Ini memastikan bahwa hanya satu salinan dari setiap nilai unik yang akan muncul 
-- dalam hasil query, dan hasilnya juga diurutkan secara descending berdasarkan nilai 'discount'.
select distinct discount from barang5 order by discount desc