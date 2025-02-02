## 🚀 **Setup & Installation**  

### **1️⃣ Prerequisites**  
Ensure you have the following installed:  
- **Ruby** (3.2)  
- **Rails** (8)  
- **Bundler** (Check: `bundle -v`)  

---

### **2️⃣ Clone the Repository**  
```sh
git clone https://github.com/fhoward/hometime_reservation.git
cd hometime_reservation
```

---

### **3️⃣ Install Dependencies**  
```sh
bundle install
```

---

### **4️⃣ Database Setup**  
Set up the database:  
```sh
rails db:create
rails db:migrate
```

---

### **5️⃣ Run the Server**  
Start the Rails API server:  
```sh
rails server
```
---

## 📌 **API Endpoints**  

### **POST /api/v1/reservations**  
**Description:** Accepts and stores reservation data. Supports multiple payload formats.you can use Postman or Insomnia for CLI request.  

**📌 Request Body (Example Payload 1)**  
```json
{
  "start_date": "2021-03-12",
  "end_date": "2021-03-16",
  "nights": 4,
  "guests": 4,
  "adults": 2,
  "children": 2,
  "infants": 0,
  "status": "accepted",
  "guest": {
    "id": 1,
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
  },
  "currency": "AUD",
  "payout_price": "3800.00",
  "security_price": "500",
  "total_price": "4500.00"
}
```

**📌 Request Body (Example Payload 2)**  
```json
{
  "reservation": {
    "start_date": "2021-03-12",
    "end_date": "2021-03-16",
    "expected_payout_amount": "3800.00",
    "guest_details": {
      "localized_description": "4 guests",
      "number_of_adults": 2,
      "number_of_children": 2,
      "number_of_infants": 0
    },
    "guest_email": "wayne_woodbridge@bnb.com",
    "guest_first_name": "Wayne",
    "guest_id": 1,
    "guest_last_name": "Woodbridge",
    "guest_phone_numbers": [
      "639123456789",
      "639123456789"
    ],
    "listing_security_price_accurate": "500.00",
    "host_currency": "AUD",
    "nights": 4,
    "number_of_guests": 4,
    "status_type": "accepted",
    "total_paid_amount_accurate": "4500.00"
  }
}
```

---
## 🛠 **Testing API Endpoints via Curl**
**Description:** Open new terminal window.NOTE: you must have curl installed.

```sh
curl --request POST \
  --url http://127.0.0.1:3000/api/v1/reservations \
  --header 'Content-Type: application/json' \
  --header 'User-Agent: insomnia/10.3.0' \
  --data '<YOUR REQUEST BODY PAYLOAD HERE.REFER ABOVE SAMPLE PAYLOAD>'
``` 

---
## 🛠 **Running Tests**  
Run RSpec tests:  
```sh
rspec
```

# Exam Instructions

1. Start a Ruby on Rails project that is purely an API app.
2. Create one API endpoint that can accept both payload formats. See payloads
at the end of this document.
3. Your code should not require any additional headers or parameters to
distinguish between the 2 payloads.
4. Parse and save the payloads to a Reservation model that belongs to a Guest
model. Guest email field should be uniqu
5. Add a README file to the root of your repository with clear instructions on h
to set up and run your app.
6. Your submission should be available in a public git repository of your choice.
Alternatively, you can submit a zipped folder of your source code.

# Expectations
1. Readable and maintainable code - use your preferred convention on
separating the different logics, and put them in their appropriate places.
2. Scalable code - your code must demonstrate a clear path forward in the event
a third payload is introduced.
3. Use of standard practices - treat your submission as production ready. We’ll
look for proper error handling, tests, clear documentation, etc...


# TASK BASED ON INSTRUCTION
- ~~create git repo .DONE~~
- ~~identify the columns of 2 table based on the payload. DONE~~
- ~~create model reservation belongs_to.DONE~~
- ~~create model Guest has_many.DONE~~
- ~~create test~~ 
- ~~create one api endpoint~~
- ~~create controller that accept both payload format~~
- ~~code should not have additional headers or parameters to distinguish between 2 payloads~~
- ~~Add readme Instruction how to set up and run your app~~

# TABLE MAPPING

GUEST
 - first_name
 - last_name
 - phone_numbers
 - email

RESERVATIONS
 - start_date
 - end_date
 - nights
 - guests
 - adults
 - children
 - infants
 - status
 - currency
 - payout_price
 - security_price
 - total_price
 - guest_id
