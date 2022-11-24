Nama : Natanael Pascal Simbolon
NPM :2106751764
Kelas : PBP B

# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget sendiri adalah widget dimana state-nya tidak bisa diubah setelah dibuat, sedangkan Stateful widget adalah widget yang state-nya bisa diubah setelah dibuat. Hal tersebut dikarenakan oleh Stateless widget yang memiliki sifat immutable dan Stateful widget yang memiliki sifat mutable.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Pada proyek kali ini, saya menggunakan beberapa widget seperti Align, Button, Text, Styling, dan Padding.

- Fungsi Align : Positioning widget,
- Button : Menerima input klik dari user,
- Text : Menampilkan text,
- Styling : Menambahkan style seperti warna,
- Padding : Positioning widget.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi dari `setState()` adalah untuk membuat warning terhadap Flutter bahwa ada perubahan pada state sehingga flutter akan reun ulang method.

## Jelaskan perbedaan antara const dengan final.

Const digunakan untuk mengdeklarasikan variable mutable, sedangkan Final untuk mengdeklarasikan variable immutable.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

- Pertama-tama saya membuat app baru dengan nama `counter_7` ,
- Saya juga membuat fungsi baru `-decrementCounter` untuk mengurangi angka pada layar.

# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Tentu saja kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Akan tetapi, hasilnya tidak akan sebaik jika membuat model terlebih dahulu karena menggunakan library Dart.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Widget yang saya pakai adalah :

- AppBar, yang merupakan design bar
- Floating Action Button, yang merupakan widget yang mengambang diatas widget lainnya
- Textbutton dan text, untuk styling text secara eksplisit
- Column, Row, dan Container, untuk positioning.

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

- Pertama-tama, kita fetch data dari web service dengan menggunakan depedencies seperti `post dan get`
  -Lalu, kita mengubah kembali code tanpa mengubah inti dari programnya,
  -Lalu, kita membuat model untuk JSON

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

- Menggunakan dependencies,
- Fetch JSON :

```lass _WatchListState extends State<WatchList> {
  Future<List<MineWatchList>> fetchwatchlist() async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the json data into watchlist object
    List<MineWatchList> listwatchlist = [];
    for (var d in data) {
      if (d != null) {
        listwatchlist.add(MineWatchList.fromJson(d));
      }
    }
    return listwatchlist;
  }
```

- Untuk memperlihatkan data :

````
        body: FutureBuilder(
            future: fetchwatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Watchlist kosong ngab",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                  "${snapshot.data![index].title}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                const SizedBox(height: 10),

                                ```

- Untuk memindahkan data :
```             Text(
              "Title : " + Details.getter.title + " | Completion : " + Details.getter.completed.toString(),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back", style: const TextStyle(fontSize: 18)),
            )

````
