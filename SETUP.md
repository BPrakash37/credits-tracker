# Credits Tracker — Complete Setup Guide
# Everything is FREE. No credit card needed.

=======================================================
STEP 1 — SET UP SUPABASE (your database + login system)
=======================================================

1. Go to https://supabase.com and click "Start your project"
2. Sign in with your GitHub account
3. Click "New Project"
   - Name: credits-tracker
   - Database Password: create a strong password (SAVE IT)
   - Region: Southeast Asia (Singapore) — closest to Bangalore
   - Click "Create new project" and wait ~2 minutes

4. Once ready, go to SQL Editor (left sidebar)
5. Click "New Query"
6. Open the file: schema.sql (from this folder)
7. Paste the ENTIRE contents into the editor
8. Click "Run" (green button)
   → You should see "Success. No rows returned"

9. Now get your API keys:
   - Left sidebar → Settings → API
   - Copy "Project URL"  → looks like https://xxxxx.supabase.co
   - Copy "anon public" key → long string starting with eyJ...

=======================================================
STEP 2 — ADD YOUR KEYS TO index.html
=======================================================

Open index.html in any text editor (Notepad, VS Code, etc.)

Find these two lines near the top of the <script> section:

  const SUPABASE_URL = 'YOUR_SUPABASE_URL';
  const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';

Replace with your actual values:

  const SUPABASE_URL = 'https://abcdefgh.supabase.co';
  const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';

Save the file.

=======================================================
STEP 3 — PUSH TO GITHUB
=======================================================

In your terminal:

  cd /path/to/dadcredits

  git init
  git add .
  git commit -m "Credits tracker v1"

  # Go to github.com → New Repository
  # Name: credits-tracker
  # Set to PUBLIC (required for free Vercel)
  # Click Create Repository
  # Then run the commands GitHub shows you:

  git remote add origin https://github.com/YOURUSERNAME/credits-tracker.git
  git branch -M main
  git push -u origin main

=======================================================
STEP 4 — DEPLOY TO VERCEL (free hosting)
=======================================================

1. Go to https://vercel.com
2. Sign in with GitHub
3. Click "Add New Project"
4. Find "credits-tracker" in your repos → Import
5. Leave all settings as default
6. Click "Deploy"
7. Wait ~30 seconds

Your website is now live at:
  https://credits-tracker-YOURNAME.vercel.app

Every time you push changes to GitHub, Vercel auto-deploys. ✓

=======================================================
STEP 5 — CONFIGURE SUPABASE AUTH (allow signups)
=======================================================

In Supabase:
1. Left sidebar → Authentication → Providers
2. Make sure "Email" is enabled (it is by default)

3. Go to Authentication → URL Configuration
4. Set "Site URL" to your Vercel URL:
   https://credits-tracker-YOURNAME.vercel.app

5. Go to Authentication → Email Templates
   - You can customize the confirmation email if you want

That's it! Users can now sign up and get their own account.

=======================================================
HOW YOUR DAD CAN VIEW (read-only)
=======================================================

Option A (easiest): Create an account for him yourself
  - Sign up on the website with his email/password
  - Share the login with him
  - His data will be separate from yours (each account is isolated)
  - He views his own data → you add entries for him

Option B: You share the CSV
  - Log in → click "Download CSV" top right
  - Send him the file on WhatsApp

Option C: Create a shared "family" account
  - One login, both of you use the same email+password
  - All data shared between you both

RECOMMENDED for your use case: Option C
  - Create one account for the whole family
  - Share the email/password with your dad
  - He can see everything, you add entries

=======================================================
SUMMARY — WHAT YOU GET FOR FREE
=======================================================

Supabase Free Tier:
  ✓ 500 MB database storage
  ✓ 50,000 monthly active users
  ✓ Unlimited API calls
  ✓ Built-in authentication

Vercel Free Tier:
  ✓ Unlimited deployments
  ✓ 100 GB bandwidth/month
  ✓ Custom domain support
  ✓ HTTPS included

Total monthly cost: ₹0

=======================================================
FOLDER STRUCTURE
=======================================================

dadcredits/
  public/
    index.html     ← the entire app (edit SUPABASE keys here)
  schema.sql       ← run this once in Supabase SQL editor
  vercel.json      ← tells Vercel how to serve the app
  SETUP.md         ← this file

=======================================================
TROUBLESHOOTING
=======================================================

"Invalid API key" error:
  → Double-check you copied the "anon public" key, not service_role

"Row not found" or data not saving:
  → Make sure you ran schema.sql in Supabase SQL Editor

Auth email not arriving:
  → Check spam folder; Supabase free tier uses a shared email server

Site not loading after Vercel deploy:
  → Check Vercel dashboard for build errors
  → Make sure vercel.json is in the root folder

=======================================================
