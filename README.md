# Instructions

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
- create git repo .DONE
- identify the columns of 2 table based on the payload. DONE
- create model reservation belongs_to.DONE
- create model Guest has_many.DONE
- create test 
- create one api endpoint 
- create controller that accept both payload format
- code should not have additional headers or parameters to distinguish between 2 payloads


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
