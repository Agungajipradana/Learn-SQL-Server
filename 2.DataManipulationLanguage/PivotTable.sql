/*
PIVOT adalah salah satu fungsi dalam SQL Server yang memungkinkan Anda mengubah data baris menjadi kolom. 
Fungsi ini berguna ketika Anda ingin melakukan agregasi data dan melihat hasilnya dalam format yang lebih mudah dibaca 
atau dianalisis.

Contoh penggunaan PIVOT mungkin adalah ketika Anda memiliki data seperti ini:

	| category_name | total |
	|---------------|-------|
	| Category A    | 100   |
	| Category B    | 150   |
	| Category C    | 200   |

Dan Anda ingin mengubahnya menjadi:

	| category_name | Category A | Category B | Category C |
	|---------------|------------|------------|------------|
	| Total         | 100        | 150        | 200        |

Berikut adalah contoh sintaksis umum untuk PIVOT:

	SELECT *
	FROM
	(
		-- Subquery that provides the original data
		SELECT category_name, total
		FROM your_table
	) AS SourceTable
	PIVOT
	(
		-- Pivot clause specifying the aggregation and the grouping
		SUM(total)
		FOR category_name IN ([Category A], [Category B], [Category C])
	) AS PivotTable;

Penjelasan:

	- Subquery (SourceTable): 
		Menyediakan data asli yang akan dipivot.
	
	- PIVOT: 
		Klausa yang memulai operasi pivot.
	
	- SUM(total): 
		Fungsi agregasi yang akan diterapkan pada data yang dipivot (dalam contoh ini, menghitung total).

	- FOR category_name IN ([Category A], [Category B], [Category C]): 
		Menentukan kolom-kolom yang akan dibuat sebagai hasil pivot.

	- AS PivotTable: 
		Memberi nama untuk tabel hasil pivot.

Perlu dicatat bahwa Anda harus menentukan nilai eksplisit untuk kolom yang akan dihasilkan dalam klausa FOR ... IN. 
Oleh karena itu, jika nilai category_name dinamis, Anda mungkin perlu menggunakan dinamika SQL untuk membuat query PIVOT 
yang sesuai dengan nilai kategori yang ada dalam data Anda.
*/

SELECT * FROM barang6


/*
Query SQL di bawah menggunakan fungsi PIVOT untuk mengubah data dari format panjang (baris) menjadi format lebar (kolom). 
Berikut adalah penjelasan langkah-langkahnya:

1. Subquery (T):

	- Membuat subquery yang menggabungkan kolom category_name, price, dan brand_id dari tabel barang6 dan barang6_category 
	menggunakan INNER JOIN.

2. PIVOT:

	- Klausa PIVOT digunakan untuk merubah hasil subquery menjadi format lebar.
	- SUM(price) digunakan untuk menjumlahkan nilai kolom price yang sesuai dengan setiap category_name.
	- FOR category_name IN ([Laptop], [Handphone], [Camera]) menentukan kolom-kolom yang akan dihasilkan dalam format lebar.

3. AS pivot_table:

	- Memberikan nama untuk tabel hasil pivot, yaitu pivot_table.

Dengan kata lain, hasil akhirnya adalah tabel yang memiliki kolom-kolom [Laptop], [Handphone], dan [Camera], 
di mana nilai di setiap kolom adalah jumlah harga (SUM(price)) yang sesuai dengan kategori tersebut.
*/
SELECT * FROM (
	SELECT 
		category_name,
		price,
		brand_id
	FROM barang6 AS A
	INNER JOIN barang6_category AS B ON A.category_id = B.category_id
) AS T
PIVOT (
	SUM(price)
	FOR category_name IN (
		[Laptop],
		[Handphone],
		[Camera]
	)
) AS pivot_table

/*
Query SQL di bawah digunakan untuk membuat sebuah string yang berisi nama kolom untuk digunakan dalam operasi selanjutnya, 
seperti dalam query PIVOT. Berikut adalah penjelasan langkah-langkahnya:

1. DECLARE:

	- Membuat variabel @COLUMN dengan tipe data NVARCHAR(MAX) yang digunakan untuk menyimpan string yang berisi nama kolom.

2. SELECT:

	- Menggunakan SELECT untuk menghasilkan string yang berisi nama kolom dengan memanfaatkan fungsi QUOTENAME.
	- QUOTENAME digunakan untuk memastikan bahwa nama kolom diberi tanda kutip jika mengandung karakter khusus.

3. ORDER BY category_name:

	- Mengurutkan nama kolom sesuai dengan urutan abjad.

4. SET @COLUMN=LEFT(@COLUMN, LEN(@COLUMN)-1):

	- Menghilangkan tanda koma terakhir dari string kolom yang dihasilkan.

5. PRINT @COLUMN:

	- Mencetak string kolom ke output, sehingga Anda dapat memeriksa hasilnya.

Misalkan hasil string kolom yang dicetak adalah: [Category A],[Category B],[Category C], 
yang dapat digunakan sebagai nama kolom dalam query PIVOT atau operasi lainnya yang memerlukan kolom dinamis berdasarkan data.
*/
DECLARE
	@COLUMN NVARCHAR(MAX)='';
SELECT
	@COLUMN += QUOTENAME(category_name)+','
FROM barang6_category
ORDER BY category_name

SET @COLUMN=LEFT(@COLUMN, LEN(@COLUMN)-1);

PRINT @COLUMN;

/*
Query SQL di bawah adalah contoh penggunaan dinamis dari PIVOT dalam SQL Server. Berikut adalah penjelasan langkah-langkahnya:

1. DECLARE:

	- Membuat dua variabel, @COLUMN dan @SQL. @COLUMN digunakan untuk menyimpan string nama kolom, dan @SQL digunakan untuk 
	menyimpan string query SQL dinamis.

2. SELECT:

	- Sama seperti di query sebelumnya, menghasilkan string @COLUMN yang berisi nama kolom dari tabel barang6_category.

3. SET @COLUMN=LEFT(@COLUMN, LEN(@COLUMN)-1):

	- Menghilangkan tanda koma terakhir dari string kolom.

4. PRINT @COLUMN:

	- Mencetak string kolom ke output, sehingga Anda dapat memeriksa hasilnya.

5. SET @SQL='...':

	- Membuat string query SQL dinamis yang akan dieksekusi nanti. Isi dari query ini termasuk klausa PIVOT yang menggunakan 
	string nama kolom dari @COLUMN.

6. EXECUTE SP_EXECUTESQL @SQL:

	- Mengeksekusi query SQL dinamis yang telah dibuat.

Pendekatan ini berguna ketika kita ingin membuat query yang dinamis dan dapat menangani perubahan dalam struktur data tanpa harus 
mengubah query secara manual. Namun, perlu diperhatikan bahwa penggunaan dinamis SQL harus dilakukan dengan hati-hati untuk 
mencegah serangan SQL injection jika nilai dari @COLUMN berasal dari input yang dapat diubah oleh pengguna.
*/
DECLARE
	@COLUMN NVARCHAR(MAX)='',
	@SQL NVARCHAR(MAX)='';
SELECT
	@COLUMN += QUOTENAME(category_name)+','
FROM barang6_category
ORDER BY category_name

SET @COLUMN=LEFT(@COLUMN, LEN(@COLUMN)-1);

PRINT @COLUMN;

SET @SQL='
	SELECT * FROM (
		SELECT 
			category_name,
			price,
			brand_id
		FROM barang6 AS A
		INNER JOIN barang6_category AS B ON A.category_id = B.category_id
	) AS T
	PIVOT (
		SUM(price)
		FOR category_name IN (
			'+@COLUMN+'
		)
	) AS pivot_table
';
EXECUTE SP_EXECUTESQL @SQL;