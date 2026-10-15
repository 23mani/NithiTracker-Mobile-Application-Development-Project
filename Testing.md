# Test Cases — NithiTracker

| ID | Description | Input | Expected | Actual | Status |
|---|---|---|---|---|---|
| TC-01 | Register with email | test@x.com / pass123 | User created, lands on Home | Same | PASS |
| TC-02 | Login wrong password | test@x.com / wrong | Error snackbar | Error shown | PASS |
| TC-03 | Session persistence | Login → kill app → reopen | Stays signed in | Stayed signed in | PASS |
| TC-04 | Sign out | Tap Sign Out | Back to Login | Back to Login | PASS |
| TC-05 | Add expense manual | ₹500, Food | Appears on Home + Firestore | Same | PASS |
| TC-06 | Add expense via camera | Photo of receipt | Fields auto-filled | Auto-filled | PASS |
| TC-07 | Bank import | Initiate Consent | 5 transactions imported | 5 imported | PASS |
| TC-08 | Delete expense | Swipe left | Confirmation + removed | Removed | PASS |
| TC-09 | Notification on save | Add expense | System notification | Notification shown | PASS |
| TC-10 | AI Insights | 10+ txs | Predictions shown | Predictions shown | PASS |
| TC-11 | Firestore access control | User A tries User B's data | Denied | Denied | PASS |
| TC-12 | Multi-device sync | Add on Device A | Appears on Device B | Appears | PASS |
