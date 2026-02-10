# Otomatisasi Robot Framework SauceDemo

Suite tes otomatis untuk [SauceDemo](https://www.saucedemo.com/) menggunakan Robot Framework dan SeleniumLibrary.

## Struktur Project

```
/
├── resources/
│   ├── common.resource       # Setup/Teardown Global (Konfigurasi umum)
│   └── pages/                # Page Object Model (Definisi elemen halaman)
│       ├── login_page.resource
│       ├── product_page.resource
│       ├── cart_page.resource
│       └── checkout_page.resource
├── tests/                    # Kumpulan Test Suite
│   ├── 1_login_tests.robot
│   ├── 2_product_tests.robot
│   ├── 3_cart_tests.robot
│   ├── 4_checkout_tests.robot
│   └── 5_logout_tests.robot
├── results/                  # Tempat Hasil Test (Otomatis dibuat)
├── requirements.txt          # Daftar Library Python yang dibutuhkan
└── README.md
```

## Persiapan (Setup)

1.  **Install Python**: Pastikan komputer sudah terinstall Python versi 3.8 ke atas.

2.  **Buat dan Aktifkan Virtual Environment (Sangat Disarankan)**:
    Sangat disarankan memakai "virtual environment" agar library yang diinstall rapi dan tidak bentrok dengan project lain.

    **Jalankan perintah ini di terminal:**

    ```bash
    # Membuat virtual environment baru (jalankan sekali saja)
    python -m venv .venv

    # Mengaktifkan (Windows)
    .\.venv\Scripts\activate

    # Mengaktifkan (Mac/Linux)
    source .venv/bin/activate
    ```

    _(Tanda aktif: biasanya muncul tulisan `(.venv)` di awal baris terminal)_

3.  **Install Library**:
    Setelah virtual environment aktif, install semua kebutuhan project dengan perintah:

    ```bash
    pip install -r requirements.txt
    ```

4.  **Driver Browser**: Tidak perlu install manual! Project ini sudah otomatis mengurus driver browser (Chrome/Firefox/Edge) menggunakan `webdriver-manager`.

## Cara Menjalankan Test

Untuk menjalankan **semua test** dan menyimpan hasilnya di folder `results/`:

```bash
robot -d results tests/
```

Untuk menjalankan **satu file test suite saja** (contoh: test login):

```bash
robot -d results tests/1_login_tests.robot
```

Untuk menjalankan **satu test case spesifik** (gunakan `-t` lalu nama test-nya):

```bash
robot -d results -t "Login With Valid Credentials Should Succeed" tests/
```

## Menjalankan Tanpa Membuka Browser (Headless Mode)

Jika ingin menjalankan test di "background" tanpa membuka jendela browser (lebih cepat), gunakan tambahan `-v HEADLESS:True`:

```bash
robot -v HEADLESS:True -d results tests/
```
