

## `README.md` Template

````markdown
# 💪 Gym Subscription Management System

A web-based content management system (CMS) built with Flask to manage gym subscriptions, trainers, and premium content access based on subscription types and trainer specialization.

---

## 🧰 Tech Stack

- **Backend:** Python (Flask)
- **Frontend:** HTML, CSS (via templates)
- **Database:** MySQL (XAMPP)
- **Authentication:** Flask-Login + Flask-Bcrypt
- **Content Types:** Text, Image, Video
- **File Upload & Streaming Support**

---

## 📦 Features

### 🧍 For Users
- User registration & login
- View subscription details and expiry
- Access content based on subscription & assigned trainer
- Update profile details (age, phone)
- Make subscription payments

### 🛠️ For Admins
- Admin dashboard to manage:
  - Users & subscriptions
  - Trainer profiles (add/edit/delete)
  - Assign trainers to users
  - Upload and manage content (filter by specialization & subscription)
  - View uploaded content
  - Delete users or content

---

## 🚀 Getting Started

### 📌 Prerequisites
- Python 3.x
- XAMPP with MySQL running
- MySQL Connector for Python:
  ```bash
  pip install mysql-connector-python
````

* Flask dependencies:

  ```bash
  pip install flask flask-bcrypt flask-login
  ```

---

## 🛠️ Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/Vamsibadam/Gym-Subscription-Based-Content-Management-system.git
   cd Gym-Subscription-Based-Content-Management-system
   ```

2. **Start XAMPP**

   * Open XAMPP Control Panel
   * Start **Apache** and **MySQL**

3. Increase Upload Size in phpMyAdmin (for import via browser)

          ### 🧩 Step-by-step Instructions:
          
          1. **Locate and open these files** in your XAMPP installation folder (e.g., `C:\xampp\php`):
          
             * `php.ini`
             * `phpMyAdmin\config.inc.php` (optional)
          
          2. **Edit `php.ini`**:
             Open it with a text editor (Notepad++ or VS Code) and **search for** these lines:
          
             ```
             upload_max_filesize = 2M
             post_max_size = 8M
             max_execution_time = 30
             ```
          
             **Change them** to:
          
             ```
             upload_max_filesize = 100M
             post_max_size = 100M
             max_execution_time = 300
             ```
          
          3. **Save the file** and then **restart Apache** from the XAMPP control panel.
          
          4. **Open phpMyAdmin** in your browser:
          
             ```
             http://localhost/phpmyadmin
             ```
          
          5. **Create a new database** (or select an existing one) on the left panel.
          
          6. Go to the **Import** tab ➝ **Choose File** ➝ Select your `.sql` file ➝ Click **Go**.


4. **Run the App**

   ```bash
   python app.py
   ```

   Open [http://localhost:5000](http://localhost:5000) in your browser.

---

## 🔐 Default Roles

* **Admin:** Create via signup and select `admin` role.
* **User:** Register as a regular user.

---

## 📁 Project Structure

```
.
├── app.py
├── templates/
│   ├── login.html
│   ├── signup.html
│   ├── user_dashboard.html
│   ├── admin_dashboard.html
│   ├── edit_user_subscription.html
│   ├── edit_trainer.html
├── static/
│   └── (your CSS/JS/images if any)
└── README.md
```

---

## ✍️ Contribution

Feel free to fork the project and submit pull requests. Suggestions and improvements are welcome!

---

## 🙋‍♂️ Author

**Vamsi Badam**

