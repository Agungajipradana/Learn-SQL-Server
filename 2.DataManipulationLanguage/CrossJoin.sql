/*
CROSS JOIN pada SQL Server adalah jenis join di mana setiap baris dari satu tabel digabungkan dengan setiap baris dari tabel 
lainnya. Artinya, hasilnya akan menjadi produk Kartesian dari kedua tabel yang dijelaskan. Tidak ada kondisi join yang 
diberikan dalam CROSS JOIN, sehingga setiap baris dari satu tabel akan dipasangkan dengan setiap baris dari tabel lainnya.

Contoh sintaks CROSS JOIN adalah sebagai berikut:

	SELECT *
	FROM table1
	CROSS JOIN table2;

Dalam contoh ini, setiap baris dari table1 akan dipasangkan dengan setiap baris dari table2, 
menghasilkan setiap kemungkinan kombinasi baris.

Perlu diingat bahwa CROSS JOIN dapat menghasilkan jumlah baris yang sangat besar jika kedua tabel memiliki banyak data. 
Oleh karena itu, perlu digunakan dengan hati-hati dan dipertimbangkan, terutama jika jumlah baris pada kedua tabelnya besar. 
Pemakaian CROSS JOIN sering kali lebih umum pada kasus penggabungan (join) lainnya, seperti INNER JOIN, LEFT JOIN, atau RIGHT JOIN, 
di mana terdapat kondisi yang lebih spesifik untuk menghubungkan baris antara dua tabel.
*/

select * from barang6
select * from barang6_category

/*
Perintah ini menggunakan CROSS JOIN untuk menggabungkan setiap baris dari tabel barang6 dengan setiap baris dari 
tabel barang6_category. Hasilnya adalah produk Kartesian dari kedua tabel tersebut, di mana setiap baris dari barang6 
akan dipasangkan dengan setiap baris dari barang6_category, menghasilkan jumlah baris yang sama dengan perkalian jumlah baris 
kedua tabel.

Contoh, jika barang6 memiliki m baris dan barang6_category memiliki n baris, hasil dari perintah CROSS JOIN ini akan memiliki
m * n baris. Ini menghasilkan semua kemungkinan kombinasi antara setiap baris di barang6 dan setiap baris di barang6_category, 
tanpa mempertimbangkan kondisi join spesifik.
*/
select * 
from barang6
cross join barang6_category

/*
Perintah ini menggunakan CROSS JOIN untuk menggabungkan setiap baris dari tabel barang6 dengan setiap baris dari tabel 
barang6_category. Setelah itu, kolom yang dipilih untuk ditampilkan adalah barang_name, total, dan price dari tabel barang6, 
serta category_name dari tabel barang6_category.

Hasilnya adalah produk Kartesian dari kedua tabel tersebut, di mana setiap baris dari barang6 akan dipasangkan dengan setiap baris
dari barang6_category. Tidak ada kondisi join spesifik yang diberikan, sehingga setiap kemungkinan kombinasi antara baris 
di barang6 dan baris di barang6_category akan muncul dalam hasil query.
*/
select 
	A.barang_name,
	A.total,
	A.price,
	B.category_name
from barang6 as A
cross join barang6_category as B


/*
Perintah ini menggabungkan setiap baris dari tabel barang6 dengan setiap baris dari tabel barang6_category menggunakan CROSS JOIN. 
Namun, penggunaan DISTINCT pada kolom-kolom yang dipilih membuat query hanya menampilkan hasil unik.

Jadi, hasil akhir dari query ini akan berisi kombinasi unik antara barang_name, total, dan price dari tabel barang6, 
serta category_name dari tabel barang6_category. Ini akan menghilangkan duplikasi dari hasil query, sehingga setiap baris yang 
ditampilkan adalah unik dalam konteks kolom-kolom yang dipilih.
*/
select distinct
	A.barang_name,
	A.total,
	A.price,
	B.category_name
from barang6 as A
cross join barang6_category as B

