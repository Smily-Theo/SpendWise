# SpendWise — Supabase connected (build 2026-10-11)

1. Extract this ZIP into a new folder.
2. Open `supabase-config.js` beside `index.html` and replace both placeholders with your actual Supabase Project URL and publishable/anon key.
3. Run all of `supabase_setup.sql` in the SQL Editor of the same Supabase project.
4. In PowerShell, change into this exact extracted `SpendWise` folder and run `py -m http.server 8000`.
5. Open `http://localhost:8000` and press Ctrl+F5. The page title should say “Supabase Build 2026-10-11”.
6. Create an account or sign in.

If you still see the exact old message “Configure supabase-config.js first.”, the browser is serving a different/older `index.html`. Stop old servers with Ctrl+C, open a fresh PowerShell window in this extracted folder, and start the server there. Keep `index.html` and `supabase-config.js` together.

Never use a service-role/secret key in frontend code. The app stores each authenticated user's expenses, goals, subscriptions and plan day in `finance_workspace`, protected by RLS. Risk/health calculations are illustrative estimates.

## Profile update
New accounts ask for a name. After sign-in, My Profile allows editing the display name, which is stored in Supabase Auth user metadata. The welcome greeting and account menu show that name. Existing accounts can set their name in My Profile. No new SQL table is required for this feature.
