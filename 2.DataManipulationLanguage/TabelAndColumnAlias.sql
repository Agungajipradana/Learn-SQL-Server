/*
----------------------------------------------------------Tabel Alias:-----------------------------------------------------------------

Tabel alias dalam SQL Server digunakan untuk memberikan nama singkat atau singkatan untuk tabel yang digunakan dalam pernyataan SQL. 
Ini berguna ketika Anda bekerja dengan kueri yang melibatkan beberapa tabel dan ingin menyederhanakan sintaksisnya.

Contoh penggunaan tabel alias:

	SELECT e.employee_id, e.employee_name, d.department_name
	FROM employees AS e
	JOIN departments AS d ON e.department_id = d.department_id;

Dalam contoh di atas, e adalah tabel alias untuk tabel employees, dan d adalah tabel alias untuk tabel departments. 
Penggunaan alias membuat kueri lebih mudah dibaca dan ditulis.

-----------------------------------------------------------Column Alias:---------------------------------------------------------------

Column alias digunakan untuk memberikan nama baru atau singkat kepada kolom yang dihasilkan oleh hasil query. 
Ini berguna ketika Anda ingin memberikan nama yang lebih deskriptif atau lebih mudah dimengerti untuk hasil kueri.

Contoh penggunaan column alias:

	SELECT employee_name AS name, salary * 12 AS annual_salary
	FROM employees;

Dalam contoh ini, name dan annual_salary adalah column alias untuk employee_name dan hasil perkalian salary dengan 12, masing-masing. 
Column alias membantu membuat hasil kueri lebih deskriptif dan mudah dimengerti.

Penting untuk dicatat bahwa penggunaan alias bersifat opsional dan tidak diperlukan, tetapi dapat meningkatkan keterbacaan dan 
pemahaman kueri.
*/

select * from barang6
select * from barang6_category

-- Memilih kolom-kolom tertentu dari tabel barang6 (alias B) dan barang6_category (alias C)
select 
	B.barang_id as 'Barang Code',		-- Alias untuk kolom barang_id dari tabel barang6
	B.barang_name as 'Barang Name',		-- Alias untuk kolom barang_name dari tabel barang6
	B.discount as Discount,				-- Alias untuk kolom discount dari tabel barang6
	C.category_name as 'Category'		-- Alias untuk kolom category_name dari tabel barang6_category
from 
	barang6 as B,						-- Menggunakan alias B untuk tabel barang6
	barang6_category as C				-- Menggunakan alias C untuk tabel barang6_category
where 
	C.category_id = B.category_id		-- Kondisi untuk menggabungkan data berdasarkan category_id yang sama