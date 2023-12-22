/*
EXCEPT adalah operator set di SQL Server yang digunakan untuk mengambil semua nilai yang ada di set hasil pertama tetapi tidak 
ada di set hasil kedua. Dengan kata lain, EXCEPT menghasilkan perbedaan antara dua set hasil.

Sintaks dari EXCEPT adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table1
	EXCEPT
	SELECT column1, column2, ...
	FROM table2;

Contoh penggunaan EXCEPT:

	SELECT barang_name, category_id
	FROM barang6
	EXCEPT
	SELECT barang_name, category_id
	FROM barang6_product;

Dalam contoh di atas, EXCEPT digunakan untuk mengambil semua baris yang ada di tabel barang6 tetapi tidak ada di tabel 
barang6_product. Hasilnya adalah set dari nilai-nilai yang ada di barang6 tetapi tidak ada di barang6_product.

Beberapa hal yang perlu diperhatikan tentang EXCEPT:

	- Kedua set hasil harus memiliki jumlah dan tipe kolom yang sama.
	- EXCEPT secara otomatis menghilangkan duplikat dari hasil akhir.
	- Hasil EXCEPT akan berisi nilai-nilai yang ada di set hasil pertama tetapi tidak ada di set hasil kedua.
*/

SELECT * FROM barang6
SELECT * FROM barang6_product

/*
Syntax SQL di bawah ini menggunakan operator EXCEPT untuk mengambil semua baris yang ada di tabel barang6 tetapi tidak ada 
di tabel barang6_product.

1. SELECT * FROM barang6:
	Memilih semua kolom (*) dari tabel barang6.

2.EXCEPT:
	Operator EXCEPT digunakan untuk menggabungkan hasil dari pernyataan SELECT pertama dengan hasil dari pernyataan SELECT kedua.

3. SELECT * FROM barang6_product:
	Memilih semua kolom (*) dari tabel barang6_product.

Hasil akhir dari query ini adalah set hasil yang berisi semua baris yang ada di tabel barang6 tetapi tidak ada di 
tabel barang6_product. Operator EXCEPT secara otomatis menghilangkan duplikat dari hasil akhir.
*/
SELECT * FROM barang6
EXCEPT
SELECT * FROM barang6_product