
# ♻ Recycling Facility Directory

A Laravel-based web application to manage and browse a directory of recycling facilities.

## 📌 Features

* User authentication (Register, Login, Logout).
* Manage recycling facilities (Add, Edit, Delete).
* Assign multiple materials to each facility (Many-to-Many relationship).
* Search facilities by name or address.
* Filter facilities by material type.
* Sort facilities by last updated date.
* Facility detail page with Google Maps embed for the address.

---

## 🗂 Database Design & Relationships

* **Users Table** → Manages registered users for authentication.
* **Facilities Table** → Stores facility details (business name, address, city, state, postal code, last update date).
* **Materials Table** → Stores types of recyclable materials (e.g., Plastic, Glass, Metal).
* **facility\_material (Pivot Table)** → Many-to-Many relationship between Facilities and Materials.

### Relationships:

* `Facility` ↔ `Material` → Many-to-Many
* `User` → Can manage facilities (CRUD)

---

## 🔍 Search, Filter & Sort

* **Search**: Users can search facilities by business name, street address, city, or state.
* **Filter**: Dropdown filter to display only facilities accepting a specific material.
* **Sort**: Option to sort facilities by latest update date and Name.

---

## 🔑 Authentication & Registration

* **Register**: New users can create an account (Name, Email, Password).
* **Login**: Registered users can log in with email and password.
* **Logout**: Securely log out.
* Only authenticated users can manage facilities (CRUD).
* Guests can browse facilities but must log in to modify them.

### 🧪 Demo Credentials

When you seed the database, a demo user is created:

```
Email: test@example.com
Password: password
```

Use this to log in immediately after `php artisan migrate --seed`.

---

## 🚀 Extra Features

* Facility detail page shows **all information** about the facility.
* Integrated **Google Maps embed** to display the facility’s location.
* Clean and responsive UI using **Bootstrap 5**.

---

## ⚙️ Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/Recycling_facility.git
   cd Recycling_facility
   ```

2. Configure `.env` (database, mail, etc.).

3. Run migrations & seed database:

   ```bash
   php artisan migrate --seed
   ```

4. Start the server:

   ```bash
   php artisan serve
   ```

5. Open [http://localhost:8000](http://localhost:8000) in your browser and log in using the demo credentials.

---

