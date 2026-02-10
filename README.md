# 🤖 Otomatisasi Robot Framework - SauceDemo

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-7.0+-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

Suite tes otomatis untuk website [SauceDemo](https://www.saucedemo.com/) menggunakan Robot Framework dan SeleniumLibrary.

## ✨ Fitur Utama

- ✅ **Page Object Model** - Struktur kode yang rapi dan mudah dimaintain
- ✅ **Automated Driver Management** - Tidak perlu install driver browser manual
- ✅ **Headless Mode** - Jalankan test tanpa membuka browser
- ✅ **Screenshot Otomatis** - Capture screenshot saat test gagal dengan nama test case
- ✅ **Detailed Reports** - Laporan HTML yang lengkap dan mudah dibaca

## 📁 Struktur Project

```
📦 RobotFrameworkSauceDemo
├── 📂 resources/
│   ├── 📄 common.resource           # Konfigurasi global & setup
│   └── 📂 pages/                    # Page Object Model
│       ├── 📄 login_page.resource
│       ├── 📄 product_page.resource
│       ├── 📄 cart_page.resource
│       └── 📄 checkout_page.resource
├── 📂 tests/                        # Test Suites
│   ├── 🧪 1_login_tests.robot
│   ├── 🧪 2_product_tests.robot
│   ├── 🧪 3_cart_tests.robot
│   ├── 🧪 4_checkout_tests.robot
│   └── 🧪 5_logout_tests.robot
├── 📂 results/                      # Hasil test (auto-generated)
├── 📄 requirements.txt              # Dependencies Python
└── 📄 README.md
```

## 🚀 Persiapan (Setup)

### 1️⃣ Install Python

Pastikan Python versi **3.8 atau lebih baru** sudah terinstall di komputer Anda.

```bash
python --version
```

### 2️⃣ Buat Virtual Environment (Sangat Disarankan)

Virtual environment menjaga agar library project ini terisolasi dan tidak bentrok dengan project lain.

```bash
# Membuat virtual environment baru
python -m venv .venv

# Mengaktifkan (Windows)
.\.venv\Scripts\activate

# Mengaktifkan (Mac/Linux)
source .venv/bin/activate
```

> 💡 **Tip**: Jika berhasil, Anda akan melihat `(.venv)` di awal baris terminal

### 3️⃣ Install Dependencies

Setelah virtual environment aktif, install semua library yang dibutuhkan:

```bash
pip install -r requirements.txt
```

### 4️⃣ Driver Browser

**Tidak perlu install manual!** 🎉

Project ini menggunakan `webdriver-manager` yang otomatis mendownload dan mengatur driver browser (Chrome/Firefox/Edge) sesuai versi browser Anda.

## 🎯 Cara Menjalankan Test

### Menjalankan Semua Test

```bash
robot -d results tests/
```

### Menjalankan Test Suite Tertentu

```bash
robot -d results tests/1_login_tests.robot
```

### Menjalankan Test Case Spesifik

```bash
robot -d results -t "Login With Valid Credentials Should Succeed" tests/
```

### Menjalankan dalam Headless Mode

Untuk menjalankan test tanpa membuka browser (lebih cepat, cocok untuk CI/CD):

```bash
robot -v HEADLESS:True -d results tests/
```

## 📊 Melihat Hasil Test

Setelah test selesai, buka file berikut di browser:

- **Report**: `results/report.html` - Ringkasan hasil test
- **Log**: `results/log.html` - Detail eksekusi test
- **Screenshots**: `results/*.png` - Screenshot saat test gagal (dinamakan sesuai test case)

## 🛠️ Troubleshooting

### Virtual Environment Tidak Aktif

Pastikan Anda sudah menjalankan perintah aktivasi:

```bash
# Windows
.\.venv\Scripts\activate

# Mac/Linux
source .venv/bin/activate
```

### Error "Module not found"

Install ulang dependencies:

```bash
pip install -r requirements.txt
```

### Browser Tidak Terbuka

Pastikan browser (Chrome/Firefox/Edge) sudah terinstall di komputer Anda. Driver akan otomatis didownload oleh `webdriver-manager`.

## 📝 Catatan

- Semua hasil test disimpan di folder `results/`
- Screenshot failure otomatis dibuat dengan format: `[Nama_Test_Case]_screenshot.png`
- Project ini menggunakan incognito mode secara default untuk menghindari cache browser

## 📄 License

MIT License - Silakan digunakan untuk belajar dan pengembangan.

---

**Happy Testing! 🚀**
