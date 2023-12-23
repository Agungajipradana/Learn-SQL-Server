/*
Common Table Expression (CTE) dapat bersifat rekursif, yang memungkinkan Anda membuat query yang melibatkan dirinya sendiri. 
CTE rekursif sangat berguna ketika Anda perlu menjelajahi struktur berhirarki, seperti pohon genealogi, struktur organisasi, 
atau grafik.

Berikut adalah sintaks umum untuk membuat CTE rekursif:

	WITH RecursiveCTE (Column1, Column2, ...) AS (
		-- Basis query (anggota non-rekursif)
		SELECT Column1, Column2, ...
		FROM YourTable
		WHERE -- kondisi basis
    
		UNION ALL
    
		-- Anggota rekursif
		SELECT Column1, Column2, ...
		FROM YourTable
		INNER JOIN RecursiveCTE ON -- kondisi hubungan antara tabel dan CTE
		WHERE -- kondisi rekursif
	)
	SELECT * FROM RecursiveCTE;

Poin-poin penting:

1. Basis query (Non-rekursif):
	Bagian pertama dari CTE (SELECT Column1, Column2, ... FROM YourTable WHERE ...) disebut basis query. Ini adalah anggota 
	non-rekursif yang menyediakan titik awal untuk iterasi.

2. UNION ALL:
	Menggabungkan hasil basis query dengan hasil anggota rekursif.

3. Anggota Rekursif:
	Bagian kedua dari CTE (SELECT Column1, Column2, ... FROM YourTable INNER JOIN RecursiveCTE ON ... WHERE ...) adalah 
	anggota rekursif. Ini memasukkan CTE itu sendiri dan memiliki kondisi yang memungkinkan hubungan dengan hasil sebelumnya.

4. SELECT * FROM RecursiveCTE:
	Pernyataan SELECT utama digunakan untuk menampilkan hasil akhir dari CTE rekursif.

Contoh penggunaan CTE rekursif dalam hierarki manajerial:

	WITH EmployeeCTE AS (
		SELECT EmployeeID, EmployeeName, ManagerID, 1 AS Level
		FROM Employees
		WHERE ManagerID IS NULL
    
		UNION ALL
    
		SELECT e.EmployeeID, e.EmployeeName, e.ManagerID, cte.Level + 1
		FROM Employees e
		INNER JOIN EmployeeCTE cte ON e.ManagerID = cte.EmployeeID
	)
	SELECT * FROM EmployeeCTE;

Dalam contoh di atas, CTE rekursif digunakan untuk menyusun hierarki manajerial dengan EmployeeID, EmployeeName, ManagerID, dan 
tingkat (Level). Basis query mengambil manajer teratas (yang ManagerID-nya NULL), dan anggota rekursif mengambil semua bawahan 
dari setiap manajer. Tingkat (Level) digunakan untuk melacak kedalaman dalam hierarki.
*/

/*
Query SQL di bawah menggunakan Common Table Expression (CTE) yang bersifat rekursif untuk membuat deret hari dalam satu minggu. 

Berikut adalah penjelasan dari query tersebut:

1. Deklarasi Recursive CTE (WITH DateCTE (n, dayname) AS ...):

	- DateCTE adalah nama CTE.
	- (n, dayname) adalah kolom-kolom yang dideklarasikan dalam CTE.
	- Pernyataan UNION ALL menggabungkan hasil dari basis query dan hasil dari anggota rekursif.

2. Basis Query dalam CTE (SELECT 0, DATENAME(DW, 0) ...):

	- Baris pertama dari CTE (n=0) menyediakan nilai awal untuk iterasi.
	- DATENAME(DW, 0) mengambil nama hari untuk nilai 0, yang seharusnya memberikan nama hari untuk hari saat ini.

3. Anggota Rekursif dalam CTE (UNION ALL SELECT n+1, DATENAME(DW, n+1) FROM DateCTE WHERE n < 6 ...):

	- Baris kedua dan seterusnya (n+1) menghasilkan iterasi berikutnya.
	- Rekursi dilakukan dengan menggabungkan hasil CTE sebelumnya menggunakan UNION ALL.
	- Pernyataan WHERE n < 6 mengatur batasan agar rekursi tidak berlanjut lebih dari 6 kali, sehingga hanya mencakup satu minggu.

4. Pernyataan SELECT Utama (SELECT * FROM DateCTE):

	- Digunakan untuk menampilkan hasil dari CTE.
	- Menampilkan semua kolom (*) dari CTE.

Jadi, query ini membuat deret hari dalam satu minggu dimulai dari hari saat ini (tanggal 0) dan berlanjut selama 6 iterasi. 
Setiap iterasi menambahkan satu hari ke dalam deretan dan menampilkan nama hari menggunakan fungsi DATENAME().
*/
WITH DateCTE (n, dayname) AS (
SELECT 
	0,
	DATENAME(DW,0)
UNION ALL 
SELECT n+1, DATENAME(DW,n+1)
FROM DateCTE 
WHERE n < 6
)
SELECT * FROM DateCTE

/*
Query SQL di atas menggunakan Common Table Expression (CTE) yang bersifat rekursif.

Berikut adalah penjelasan dari query tersebut:

1. Deklarasi Recursive CTE (WITH EmpCTE AS ...):

	- EmpCTE adalah nama CTE.
	- Pernyataan UNION ALL menggabungkan hasil dari basis query dan hasil dari anggota rekursif.

2. Basis Query dalam CTE (SELECT emp_id, name, manager_id FROM employee ...):

	- Bagian pertama dari CTE adalah basis query yang menghasilkan baris awal atau level 0.
	- employee adalah tabel sumber yang menyediakan data awal untuk rekursi.
	- Kolom yang dipilih adalah emp_id, name, dan manager_id.

3. Anggota Rekursif dalam CTE (UNION ALL SELECT A.emp_id, A.name, A.manager_id FROM employee AS A 
INNER JOIN EmpCTE AS B ON A.manager_id = B.emp_id ...):

	- Bagian kedua dari CTE adalah anggota rekursif.
	- Menggunakan INNER JOIN dengan CTE sendiri (EmpCTE) untuk membentuk rekursi berdasarkan hubungan antara emp_id dan manager_id.
	- Rekursi terjadi ketika manager_id dari tabel sumber (employee) cocok dengan emp_id dari CTE.

4. Pernyataan SELECT Utama (SELECT * FROM EmpCTE):

	- Digunakan untuk menampilkan hasil dari CTE.
	- Menampilkan semua kolom (*) dari CTE.

Dengan menggunakan rekursi, CTE ini dapat digunakan untuk menjelajahi struktur hirarki dalam tabel employee, 
misalnya, untuk mengambil data tentang bawahan dan manajer dari setiap karyawan.
*/
WITH EmpCTE AS (
SELECT 
	emp_id,
	name,
	manager_id
FROM employee
UNION ALL 
SELECT 
	A.emp_id,
	A.name,
	A.manager_id
FROM employee AS A
INNER JOIN EmpCTE AS B ON A.manager_id = B.manager_id
)
SELECT * FROM EmpCTE



