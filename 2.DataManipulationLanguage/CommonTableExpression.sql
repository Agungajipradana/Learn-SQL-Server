/*
Common Table Expression (CTE) adalah struktur query di SQL Server yang memungkinkan Anda menyusun hasil query secara rekursif 
atau membangun blok query yang dapat digunakan lebih dari satu kali dalam pernyataan SELECT, INSERT, UPDATE, atau DELETE. 
CTE didefinisikan dalam bagian WITH dari pernyataan SQL.

Sintaks umum CTE adalah sebagai berikut:

	WITH CTE_Name (Column1, Column2, ...) AS (
		-- Query yang mendefinisikan CTE
		SELECT ...
	)
	-- Pernyataan utama menggunakan CTE
	SELECT ...
	FROM CTE_Name
	WHERE ...

Beberapa poin penting tentang CTE:

1. Deklarasi CTE (WITH CTE_Name AS ...):
	- CTE dimulai dengan klausa WITH, diikuti oleh nama CTE dan kolom-kolom yang diperlukan.
	- Query yang mendefinisikan CTE dimasukkan dalam tanda kurung kurawal {}.

2. Pernyataan utama menggunakan CTE:
	Setelah deklarasi CTE, Anda dapat menggunakannya dalam pernyataan SELECT, INSERT, UPDATE, atau DELETE.

3. CTE dapat bersifat rekursif:
	Anda dapat membuat CTE rekursif dengan menggunakan UNION ALL untuk menyatukan hasil bagian rekursif dengan hasil bagian 
	non-rekursif dalam CTE.

Contoh penggunaan CTE sederhana:

	WITH EmployeesCTE (EmployeeID, EmployeeName, ManagerID) AS (
		SELECT EmployeeID, EmployeeName, ManagerID
		FROM Employees
		WHERE ManagerID IS NULL
		UNION ALL
		SELECT e.EmployeeID, e.EmployeeName, e.ManagerID
		FROM Employees e
		INNER JOIN EmployeesCTE cte ON e.ManagerID = cte.EmployeeID
	)
	SELECT *
	FROM EmployeesCTE;

Pada contoh di atas, CTE (EmployeesCTE) digunakan untuk menyusun hierarki manajer-pegawai secara rekursif dari tabel Employees. 
CTE pertama kali mencari manajer teratas (yang ManagerID-nya NULL) dan kemudian menggabungkan hasilnya secara rekursif untuk 
mencakup seluruh hierarki.
*/

SELECT * FROM barang6

/*
Syntax SQL di bawah ini menggunakan Common Table Expression (CTE) untuk membuat dan menggunakan CTE dengan nama BarangCTE.
CTE ini menghitung total barang untuk setiap kategori dari tabel barang6 dan barang6_category.

1. Deklarasi CTE (WITH BarangCTE AS ...):
	CTE dimulai dengan klausa WITH, diikuti oleh nama CTE (BarangCTE) dan kolom-kolom yang diperlukan (Category dan Total).

2. Query yang mendefinisikan CTE:
	Pernyataan SELECT dalam CTE menghitung jumlah barang (Total) untuk setiap kategori (category_name) dengan melakukan 
	JOIN antara tabel barang6 dan barang6_category.

3. Pernyataan utama menggunakan CTE:
	Setelah deklarasi CTE, pernyataan SELECT utama menggunakan CTE (SELECT * FROM BarangCTE) untuk mengambil hasil yang 
	telah dihitung.

Dengan menggunakan CTE, Anda dapat menyusun logika query yang kompleks secara bersih dan memisahkan langkah-langkah logisnya. 
Dalam kasus ini, CTE digunakan untuk menghitung total barang untuk setiap kategori, dan hasilnya dapat diakses melalui 
pernyataan SELECT utama.
*/
WITH BarangCTE (Category, Total) AS (
	SELECT 
		B.category_name,
		COUNT(A.barang_id) AS Total
	FROM 
		barang6 AS A
	INNER JOIN barang6_category AS B ON A.category_id = B.category_id
	GROUP BY B.category_name
)
SELECT * FROM BarangCTE

/*

Syntax SQL di bawah ini menggunakan dua Common Table Expressions (CTE) yang disebut BarangCTE dan CategoryCTE. Kemudian, 
hasilnya digunakan dalam pernyataan SELECT utama untuk menggabungkan dan menampilkan kolom-kolom tertentu.

1. Deklarasi Dua CTE:

	- Dua CTE didefinisikan menggunakan klausa WITH.
	- BarangCTE menghitung jumlah barang (TotalBarang) untuk setiap kategori barang.
	- CategoryCTE menghitung total harga (TotalCategory) untuk setiap kategori.

2. Pernyataan Utama Menggunakan CTE:

	- Pada pernyataan SELECT utama, hasil dari kedua CTE digunakan.
	- Hasilnya digabungkan menggunakan INNER JOIN pada kolom CategoryBarang dari BarangCTE dengan kolom Category dari CategoryCTE.
	- Kolom-kolom yang diambil untuk hasil akhir adalah Category, TotalBarang, dan TotalCategory.

Query ini memberikan informasi tentang jumlah barang dan total harga untuk setiap kategori barang, dan hasilnya digabungkan 
dalam satu set hasil.
*/
WITH BarangCTE (CategoryBarang, TotalBarang) AS (
	SELECT 
		B.category_name,
		COUNT(A.barang_id) AS Total
	FROM 
		barang6 AS A
	INNER JOIN barang6_category AS B on A.category_id = B.category_id
	GROUP BY B.category_name
),
	CategoryCTE (Category, TotalCategory) AS (
	SELECT 
		D.category_name,
		SUM(C.price) AS Total
	FROM
		barang6 AS C
	INNER JOIN barang6_category AS D ON C.category_id = D.category_id
	GROUP BY D.category_name
)
SELECT 
	Category,
	TotalBarang, 
	TotalCategory 
FROM 
	BarangCTE AS X
INNER JOIN CategoryCTE AS Y ON  X.CategoryBarang = Y.Category