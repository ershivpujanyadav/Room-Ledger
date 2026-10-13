ROOM LEDGER — Shared roommate expense tracker

CURRENT VERSION
- index.html: the website and expense tracker.
- Your current entries are saved in this browser on this device using local storage.
- CSV export is available from the website.
- Firebase sharing is NOT connected yet.

IMPORTANT: BACKUP YOUR DATA
Before replacing files or clearing browser data, use Export CSV from Room Ledger to keep a copy of your expenses. This cleaned version removes the old Supabase integration. It does not automatically move old online Supabase data into Firebase.

NEXT PHASE: FIREBASE
1. Create a Firebase project.
2. Register a web app in Firebase.
3. Enable Google sign-in in Firebase Authentication.
4. Create a Cloud Firestore database.
5. Add secure Firestore rules so only members of the relevant room can read/write that room's records.
6. Add Firebase configuration to the app.
7. Test sign-in, room membership, shared expenses, and access restrictions.

SECURITY NOTE
A Firebase web configuration is not a server secret, but Firestore Security Rules and Authentication must be configured correctly before storing shared data. Never put a service-account private key or other server secret in a public website.

GITHUB PAGES
This is a static website suitable for GitHub Pages. GitHub Pages hosts the website files; Firebase will provide authentication and shared database features when configured.
