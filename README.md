## 3Shape - Remove Deactivated Users from SQL DB

This script helps automate the removal of disabled "Operator" accounts from 3Shape's SQL database — something neither my app vendor nor 3Shape support could properly do.

---

###  Pre-launch Instructions

1. **Right-click** the 3Shape Control Panel and select **"Run as Administrator."**
2. Navigate to the **Operators** section.
3. Find the user(s) you want to remove and **deactivate their profile**.
4. Once complete, run the script.

---

###  Where to Run This Script

This script is designed to be run **locally on the 3Shape server** where the SQL database is hosted.

> Can it be modified to run remotely? Sure.  
> But... really?

---

###  Notes

- This script **permanently removes** users where `IsActive = 0` from the SQL database.
- Make sure users are **deactivated properly first** — this does not disable them, it deletes them.
- You run this, you own the result.

---

###  Files Included

- `3shape_rm_deactive_sql` – main script
- `README.md` – you’re reading it
