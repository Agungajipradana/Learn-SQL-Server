/*
Dalam SQL Server, pernyataan JOIN digunakan untuk menggabungkan baris dari dua atau lebih tabel berdasarkan suatu kondisi tertentu. 
JOIN memungkinkan Anda mengambil data dari tabel-tabel yang berbeda dan menggabungkannya menjadi satu hasil query. 
Ada beberapa jenis JOIN yang dapat digunakan, dan setiap jenis memiliki tujuan dan penggunaan yang berbeda:

1.INNER JOIN:

INNER JOIN mengambil baris dari kedua tabel yang memenuhi kondisi yang didefinisikan dalam klausa ON.
Hanya baris yang memiliki nilai yang cocok pada kolom yang dihubungkan akan dimasukkan ke dalam hasil.

Contoh INNER JOIN:

	SELECT orders.order_id, customers.customer_name
	FROM orders
	INNER JOIN customers ON orders.customer_id = customers.customer_id;

2.LEFT (OUTER) JOIN:

LEFT JOIN mengambil semua baris dari tabel di sebelah kiri (FROM pertama) dan baris yang cocok dari tabel di sebelah kanan (JOIN).
Jika tidak ada nilai yang cocok pada kolom yang dihubungkan, kolom dari tabel di sebelah kanan akan berisi nilai NULL.

Contoh LEFT JOIN:

	SELECT employees.employee_id, employees.employee_name, departments.department_name
	FROM employees
	LEFT JOIN departments ON employees.department_id = departments.department_id;

3.RIGHT (OUTER) JOIN:

RIGHT JOIN adalah kebalikan dari LEFT JOIN. 
Mengambil semua baris dari tabel di sebelah kanan dan baris yang cocok dari tabel di sebelah kiri.
Jika tidak ada nilai yang cocok pada kolom yang dihubungkan, kolom dari tabel di sebelah kiri akan berisi nilai NULL.

Contoh RIGHT JOIN:

	SELECT departments.department_id, departments.department_name, employees.employee_name
	FROM departments
	RIGHT JOIN employees ON departments.department_id = employees.department_id;

4.FULL (OUTER) JOIN:

FULL JOIN mengambil semua baris dari kedua tabel, dengan atau tanpa kecocokan pada kolom yang dihubungkan.
Jika tidak ada nilai yang cocok, kolom dari tabel yang tidak memiliki nilai akan berisi NULL.

Contoh FULL JOIN:

	SELECT customers.customer_id, orders.order_id
	FROM customers
	FULL JOIN orders ON customers.customer_id = orders.customer_id;

Tipe JOIN yang digunakan tergantung pada kebutuhan kueri Anda dan hubungan antara tabel-tabel yang terlibat. 
JOIN adalah alat yang sangat berguna dalam melakukan penggabungan data dan memungkinkan Anda mengambil informasi yang terdistribusi 
di berbagai tabel.
*/

select * from barang6
select * from barang6_category

--------------------------------------------------------- INNER JOIN: ------------------------------------------------------------------

/*
1. *SELECT : Memilih semua kolom dari hasil query.

2. FROM barang6 AS B:
	Menentukan tabel utama yang akan diambil data dari, dalam hal ini barang6.
	Memberikan alias B pada tabel barang6, sehingga dapat diacu dengan alias tersebut dalam query.

3. INNER JOIN barang6_category AS C:
	Menentukan tabel kedua yang akan dihubungkan, dalam hal ini barang6_category.
	Memberikan alias C pada tabel barang6_category, sehingga dapat diacu dengan alias tersebut dalam query.

4. ON B.category_id = C.category_id:
	Menentukan kondisi penggabungan antara kedua tabel.
	Kondisi ini menunjukkan bahwa data akan digabungkan berdasarkan kesamaan nilai pada kolom category_id di kedua tabel.

Hasil dari query ini akan berupa gabungan dari semua kolom dari tabel barang6 dan barang6_category dimana 
nilai pada kolom category_id sama di kedua tabel tersebut. Ini adalah contoh penggunaan INNER JOIN untuk menggabungkan data 
berdasarkan kesamaan nilai pada kolom tertentu.
*/

select * 
from barang6 as B 
inner join barang6_category as C
on B.category_id = C.category_id

------------------------------------------------------------- LEFT JOIN: ---------------------------------------------------------------

/*
1. *SELECT :Memilih semua kolom dari hasil query.

2. FROM barang6 AS B:
	Menentukan tabel utama yang akan diambil data dari, dalam hal ini barang6.
	Memberikan alias B pada tabel barang6, sehingga dapat diacu dengan alias tersebut dalam query.

3. LEFT JOIN barang6_category AS C:
	Menentukan tabel kedua yang akan dihubungkan, dalam hal ini barang6_category.
	Memberikan alias C pada tabel barang6_category, sehingga dapat diacu dengan alias tersebut dalam query.

4. ON B.category_id = C.category_id:
	Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai pada kolom category_id.

5. WHERE B.category_id IS NULL:
	Klausa ini memfilter hasil gabungan untuk hanya mencakup baris-baris di mana nilai kolom category_id dari tabel barang6 adalah NULL.
	Ini akan mengembalikan baris-baris di tabel barang6 yang tidak memiliki kesamaan nilai di kolom category_id 
	dengan tabel barang6_category.

Dengan menggunakan operasi LEFT JOIN dan klausa WHERE ini, Anda dapat mengidentifikasi baris-baris di tabel barang6 yang tidak 
memiliki kesesuaian dengan tabel barang6_category berdasarkan kolom category_id.
*/

select * 
from barang6 as B 
left join barang6_category as C
on B.category_id = C.category_id
where B.category_id is null

------------------------------------------------------------- RIGHT JOIN: --------------------------------------------------------------

/*
1. *SELECT : Memilih semua kolom dari hasil query.

2. FROM barang6 AS B:
	Menentukan tabel utama yang akan diambil data dari, dalam hal ini barang6.
	Memberikan alias B pada tabel barang6, sehingga dapat diacu dengan alias tersebut dalam query.

3. RIGHT JOIN barang6_category AS C:
	Menentukan tabel kedua yang akan dihubungkan, dalam hal ini barang6_category.
	Memberikan alias C pada tabel barang6_category, sehingga dapat diacu dengan alias tersebut dalam query.

4. ON B.category_id = C.category_id:
	Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai pada kolom category_id.

5. WHERE B.discount IS NULL:
	Klausa ini memfilter hasil gabungan untuk hanya mencakup baris-baris di mana nilai kolom discount dari tabel barang6 adalah NULL.
	Ini akan mengembalikan baris-baris di tabel barang6_category yang tidak memiliki kesamaan nilai di kolom category_id 
	dengan tabel barang6 dan memiliki nilai NULL di kolom discount di tabel barang6.

Dengan menggunakan operasi RIGHT JOIN dan klausa WHERE ini, Anda dapat mengidentifikasi baris-baris di tabel barang6_category yang 
tidak memiliki kesesuaian dengan tabel barang6 berdasarkan kolom category_id dan memiliki nilai NULL di kolom discount di tabel barang6.
*/

select * 
from barang6 as B 
right join barang6_category as C
on B.category_id = C.category_id
where B.discount is null

------------------------------------------------------------- FULL JOIN: ---------------------------------------------------------------

/*
1. *SELECT : Memilih semua kolom dari hasil query.

2. FROM barang6 AS B:
	Menentukan tabel utama yang akan diambil data dari, dalam hal ini barang6.
	Memberikan alias B pada tabel barang6, sehingga dapat diacu dengan alias tersebut dalam query.

3. FULL JOIN barang6_category AS C:
	Menentukan tabel kedua yang akan dihubungkan, dalam hal ini barang6_category.
	Memberikan alias C pada tabel barang6_category, sehingga dapat diacu dengan alias tersebut dalam query.

4. ON B.category_id = C.category_id:
	Menentukan kondisi penggabungan antara kedua tabel berdasarkan kesamaan nilai pada kolom category_id.

5. WHERE B.discount IS NULL OR C.category_id IS NULL:
	Klausa ini memfilter hasil gabungan untuk hanya mencakup baris-baris di mana nilai kolom discount dari tabel barang6 adalah NULL 
	atau nilai kolom category_id dari tabel barang6_category adalah NULL.
	Ini akan mengembalikan baris-baris yang tidak memiliki kesamaan nilai di kedua tabel atau memiliki nilai NULL di 
	salah satu dari kedua kolom tersebut.

Dengan menggunakan operasi FULL JOIN dan klausa WHERE ini, Anda dapat mengidentifikasi baris-baris yang tidak memiliki kesesuaian 
dengan tabel barang6 atau barang6_category atau memiliki nilai NULL di salah satu dari kedua kolom tersebut.
*/

select * 
from barang6 as B 
full join barang6_category as C
on B.category_id = C.category_id
where B.discount is null
or C.category_id is null


