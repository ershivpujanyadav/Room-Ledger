ROOM LEDGER — Personal roommate expense tracker

FILES INCLUDED
- index.html: the website/app. Open this file in a browser.
- setup.sql: SQL script that creates the online Supabase table and access policies.
- README.txt: these setup instructions.

A. USE IT ON YOUR COMPUTER (LOCAL ONLY)
1. Create a folder named RoomLedger on your computer (for example, Documents/RoomLedger).
2. Save index.html, setup.sql, and README.txt inside that folder.
3. Double-click index.html to open it in Chrome, Edge, or another modern browser.
4. On first launch, enter how many people share expenses and each person's name.
5. Use Manage roommates to change names or group size later.
6. Export CSV regularly to back up your expense history.

Local-only mode stores data in that browser on that computer. It does not automatically sync to another device. Do not clear the browser's site data unless you have a backup.

B. SET UP THE ONLINE DATABASE (SUPABASE)
1. Go to https://supabase.com/ and create an account/project. Save the database password somewhere safe.
2. Open your project and select SQL Editor.
3. Create a new query, paste the full contents of setup.sql, and click Run. This creates the room_ledgers database table in Supabase; you do not need to create a separate local .db file.
4. Open Project Settings / API (or the project's API settings). Copy the Project URL and the public anon/publishable key. Never put a service_role key or secret key in the website.
5. Open index.html in your browser, find Sync settings, enter the Project URL and public key, and choose a hard-to-guess room code.
6. On every other device, open the same website and enter the same URL, public key, and room code. Use Sync now after making changes.

IMPORTANT: The included SQL policies are intentionally broad for a simple demo. The room code is only an informal shared secret, not strong authentication. Anyone who discovers the project public key and room code may access that ledger. Do not store passwords, bank details, or sensitive identity information. For stronger privacy, configure Supabase Auth and restrictive per-user policies. The starter sync also is not designed for simultaneous edits from several people; export CSV backups.

C. PUT THE WEBSITE ONLINE (OPTIONAL)
Supabase hosts the database, not the HTML website. To access the same site on different devices, publish index.html with a static hosting service such as Netlify or GitHub Pages, then open that published website URL on each device. Configure Sync settings with the same Supabase project URL, public key, and room code on each device. Keep index.html and setup.sql as separate files in your own backup folder.
