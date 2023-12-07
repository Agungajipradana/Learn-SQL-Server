/*
Dalam SQL Server, synonym adalah objek yang menyediakan referensi alternatif atau alias untuk objek database lainnya. 
Synonym memungkinkan Anda menggunakan nama alternatif untuk merujuk ke tabel, view, stored procedure, atau objek database lainnya tanpa perlu 
merinci skema atau database tempat objek tersebut berada.

Berikut adalah sintaksis umum untuk membuat synonym:

	CREATE SYNONYM synonym_name
	FOR [server_name.][database_name.[schema_name].]object_name

- synonym_name: Nama synonym yang ingin Anda buat.
- server_name: (Opsional) Nama server jika objek berada di server yang berbeda.
- database_name: (Opsional) Nama database yang berisi objek.
- schema_name: (Opsional) Nama skema yang berisi objek.
- object_name: Nama objek (tabel, view, stored procedure, dll.) yang akan di-synonym.

Contoh penggunaan:

	-- Membuat synonym untuk tabel 'Employees' dalam database 'AdventureWorks'
	CREATE SYNONYM EmployeeList
	FOR AdventureWorks.HumanResources.Employee;

	-- Menggunakan synonym dalam query
	SELECT * FROM EmployeeList;

Beberapa kegunaan synonym meliputi:

	1.Abstraksi Nama Objek: Synonym memungkinkan Anda menggunakan nama yang lebih ringkas dan deskriptif untuk merujuk ke objek database. 
	Ini dapat meningkatkan kejelasan dan kemudahan pemeliharaan kode.

	2.Memfasilitasi Perubahan Struktur: Jika struktur objek database berubah, Anda hanya perlu memperbarui synonym tanpa mengubah referensi 
	langsung ke objek tersebut di dalam kode.

	3.Memungkinkan Akses ke Objek di Database Lain: Dengan menggunakan synonym, Anda dapat membuat referensi ke objek yang berada di dalam database 
	atau server yang berbeda tanpa harus menyertakan kualifikasi lengkap.

	4.Menggunakan Server Linked dan Remote Queries: Synonym dapat digunakan bersama dengan server linked atau remote queries untuk membuat referensi 
	yang mudah ke objek di server lain.

Penting untuk dicatat bahwa synonym bersifat objek metadata dan tidak menyimpan data. 
Mereka hanya memberikan alias atau referensi alternatif ke objek database yang sebenarnya.
*/

-- membuat synonym menjadi "test" dari table "person2"
create synonym test for person2

-- menampilkan semua data dari synonym "test" alias dari nama table "person2"
select * from test

select * from person2

-- menghapus synonym "test"
drop synonym test