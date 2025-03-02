import 'dart:io';

// Penggunaan perulangan For untuk menghitung total gaji pegawai
int hitungTotalGaji(List<int> gaji) {
  int total = 0;
  for (int i = 0; i < gaji.length; i++) {
    total += gaji[i];
  }
  return total;
}

// Penggunaan fungsi dengan parameter default untuk menghitung tunjangan pegawai
String tunjanganPegawai(String jabatan, [int tunjangan = 250000]) {
  if (jabatan.toLowerCase() == 'direktur') {
    tunjangan = 500000;
  }
  else if (jabatan.toLowerCase() == 'manager') {
    tunjangan = 350000;
  }
  else if (jabatan.toLowerCase() == 'staff') {
    tunjangan = 50000;
  }
  return "Tunjangan untuk jabatan $jabatan adalah sebesar \Rp${tunjangan}";
}

// Penggunaan fungsi rekursif untuk menghitung bonus tahunan pegawai
int hitungBonusTahunan(int tahunKerja) {
  if (tahunKerja <= 0) {
    return 0;
  } else {
    return 500 * tahunKerja + hitungBonusTahunan(tahunKerja - 1);
  }
}


int hitungGajiBersih(int gaji, [double pajak = 0.1]) => (gaji - (gaji * pajak)).toInt();

void main() {

  print("Selamat datang di sistem penggajian karyawan");

  stdout.write("Masukkan jumlah karyawan pada perusahanmu: ");
  int jumlahPegawai = int.parse(stdin.readLineSync()!);


  List<Map<String, dynamic>> pegawai = [];

  // Menggunakan Perulangan For untuk input data karyawan
  for (int i = 0; i < jumlahPegawai; i++) {
    stdout.write("Masukkan nama karyawan ke-${i + 1}: ");
    String nama = stdin.readLineSync()!;
    
    stdout.write("Masukkan ID karyawan ke-${i + 1}: ");
    int id = int.parse(stdin.readLineSync()!);
    
    stdout.write("Masukkan gaji karyawan ke-${i + 1}: ");
    int gaji = int.parse(stdin.readLineSync()!);
    
    stdout.write("Masukkan jabatan karyawan ke-${i + 1}: ");
    String jabatan = stdin.readLineSync()!;
    
    pegawai.add({
      'nama': nama,
      'id': id,
      'gaji': gaji,
      'jabatan': jabatan,
    });
  }

  print("Masukkan Nomer Karyawan:");
  for (int i = 0; i < pegawai.length; i++) {
    print("Pegawai ke-${i + 1}: ${pegawai[i]['nama']} (ID: ${pegawai[i]['id']})");
  }

  print("Daftar Karyawan dengan ID Genap:");
  for (var p in pegawai) {
    if (p['id'] % 2 == 0) {
      print(p['nama']);
    }
  }

  print("Daftar Karyawan dengan ID Ganjil:");
  for (var p in pegawai) {
    if (p['id'] % 2 != 0) {
      print(p['nama']);
    }
  }

  List<int> gajiPegawai = pegawai.map((p) => p['gaji'] as int).toList();

  print("Daftar Data Karyawan (Menggunakan Perulangan For-In):");
  for (var p in pegawai) {
    print("Nama: ${p['nama']}, ID: ${p['id']}, Gaji: \$${p['gaji']}, Jabatan: ${p['jabatan']}");
  }

  print("Daftar Data Karyawan (Menggunakan Perulangan ForEach):");
  pegawai.forEach((p) {
    print("Nama: ${p['nama']}, ID: ${p['id']}, Gaji: \$${p['gaji']}, Jabatan: ${p['jabatan']}");
  });

  int totalGaji = hitungTotalGaji(gajiPegawai);
  print("Total Gaji Karyawan: \$${totalGaji}");

  print("Tunjangan untuk pegawai dengan jabatan Manager: ${tunjanganPegawai('Manager')}");
  print("Tunjangan untuk pegawai dengan jabatan Staff: ${tunjanganPegawai('Staff')}");
  print("Tunjangan untuk pegawai dengan jabatan Direktur: ${tunjanganPegawai('Direktur')}");

  stdout.write("Masukkan jumlah tahun kerja karyawan: ");
  int tahunKerja = int.parse(stdin.readLineSync()!);
  int bonus = hitungBonusTahunan(tahunKerja);
  print("Bonus Tahunan berdasarkan tahun kerja: \$${bonus}");

  stdout.write("Masukkan gaji karyawan untuk perhitungan gaji bersih: ");
  int gajiBersih = int.parse(stdin.readLineSync()!);
  int pajakGajiBersih = hitungGajiBersih(gajiBersih);
  print("Gaji bersih setelah pajak: \$${pajakGajiBersih}");
}
