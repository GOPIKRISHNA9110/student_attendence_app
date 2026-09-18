I checked it again just now. The GitHub repository page is still showing main, and it shows 2 commits.

So although you changed the default branch to master, the public repository page I'm seeing has not switched to master yet.

Let's verify master directly

Open this:

Your master branch

If that page shows your latest code, then your 20 commits are safely on master and the problem is only the default-branch setting/cache.

If it doesn't show your latest code, run this in VS Code:

git branch

then:

git log --oneline --all --decorate -25

Send me the output. I'll identify exactly where the 20 commits are.

PS C:\Users\vijaya laxmi\OneDrive\Documents\Desktop\student-app> git log --oneline --all --decorate -25
7408f7a (HEAD -> master, origin/master) Final UI & App Structure
3a2a261 Improve attendance display
0852368 Add branch dropdown selection
cad4cf1 Add student search feature
c9d21e6 Add attendance percentage calculation
7dcb00d Add student delete feature
fa5c039 Add student edit feature
28ec104 Implement student registration
f863fc5 Implement student attendance tracking
9c9b93b Add Student data model
:

Perfect! ✅ Now we know exactly what happened.

Your output proves that Commit 20 and the previous commits are on GitHub's master branch:

7408f7a (HEAD -> master, origin/master) Final UI & App Structure
3a2a261 Improve attendance display
0852368 Add branch dropdown selection
cad4cf1 Add student search feature
c9d21e6 Add attendance percentage calculation
7dcb00d Add student delete feature
fa5c039 Add student edit feature
28ec104 Implement student registration
f863fc5 Implement student attendance tracking
9c9b93b Add Student data model
🔥 Most important part
HEAD -> master
origin/master

This means:

Local branch: master ✅
GitHub branch: origin/master ✅
Commit 20: 7408f7a ✅
Commit 20 pushed: ✅
Your commit history is safe. ✅
Now check GitHub

Open your repository and make sure the branch dropdown says:

master

Then click Commits.

You should see:

Final UI & App Structure
Improve attendance display
Add branch dropdown selection
Add student search feature
...

One more thing

Your terminal output only displays the first 10 commits because you haven't reached the bottom of the -25 output yet. The remaining commits are below it.

So don't push anything again. Your Git/GitHub setup is working correctly. 🚀

Next, we can 
create the README.md with all 20 commits and screenshots.

Create the README.md with all 20 commits and screenshots

Done ✅ I created the complete README.md with:

All 20 commits
Description for every commit
Screenshot placeholder for every commit
Features
Technologies used
Project structure
Final feature table
Your author information

Download: 
README.md

Before pushing it to GitHub

Create this folder in your project:

student-app/
├── lib/
├── screenshots/
└── README.md

Put your actual screenshots inside screenshots/ with these names:

commit-01.png
commit-02.png
...
commit-20.png

The README is already configured to display them automatically.

Then push:

git add README.md
git commit -m "Add project README"
git push origin master

That will become Commit 21 — Add project README. 🚀 

README.md
Document

Library
/
README.md
📱 Student Attendance App

A Flutter-based Student Attendance Management application developed to manage student registration, attendance, student records, search, editing, deletion, branch selection, and attendance percentage calculation.

🚀 Project Overview

The Student Attendance App is an educational Flutter project developed step-by-step using Dart and Flutter Material UI. The project was built through 20 incremental Git commits, with each commit adding or improving one part of the application.

✨ Features
Add student
Student registration
Edit student details
Delete student
Search students by name or roll number
Select student branch
Mark student Present / Absent
Track present days and total days
Calculate attendance percentage
Display current attendance status
Form validation
SnackBar confirmation messages
Student data model
Attendance state management
Proper controller disposal
Git and GitHub version control
🛠️ Technologies Used
Flutter
Dart
Material UI
Git
GitHub
VS Code
📂 Project Structure
student-app/
├── lib/
│   └── main.dart
├── screenshots/
│   ├── commit-01.png
│   ├── commit-02.png
│   ├── commit-03.png
│   ├── commit-04.png
│   ├── commit-05.png
│   ├── commit-06.png
│   ├── commit-07.png
│   ├── commit-08.png
│   ├── commit-09.png
│   ├── commit-10.png
│   ├── commit-11.png
│   ├── commit-12.png
│   ├── commit-13.png
│   ├── commit-14.png
│   ├── commit-15.png
│   ├── commit-16.png
│   ├── commit-17.png
│   ├── commit-18.png
│   ├── commit-19.png
│   └── commit-20.png
└── README.md

Screenshot note: The README references one screenshot for each commit. Add your actual screenshots to the screenshots folder using the exact filenames shown above. This keeps the README ready without inventing or replacing screenshots.

📌 Development Commit History
Commit 1 — Text and TextStyle in Flutter

Created the initial Flutter application UI using Text and TextStyle.

Screenshot




Commit 2 — Add Row and Column for student details

Added Row and Column widgets to arrange student information in the UI.

Screenshot




Commit 3 — Add Container and Padding for student layout

Improved the student layout using Container and Padding.

Screenshot




Commit 4 — Add attendance buttons

Added buttons for marking a student's attendance.

Screenshot




Commit 5 — Add student input fields

Added input fields for entering student name and roll number.

Screenshot




Commit 6 — Implement attendance state management

Implemented attendance state management using Flutter's setState().

Screenshot




Commit 7 — Add student list using ListView

Added a student list using Flutter's ListView.

Screenshot




Commit 8 — Add navigation to attendance screen

Added navigation between application screens.

Screenshot




Commit 9 — Add student form validation

Added form validation to ensure required student details are entered.

Screenshot




Commit 10 — Add attendance confirmation messages

Added SnackBar messages to confirm attendance-related actions.

Screenshot




Commit 11 — Add Student data model

Created the Student data model to represent student information and attendance data.

Screenshot




Commit 12 — Implement student attendance tracking

Implemented tracking of present days and total attendance days.

Screenshot




Commit 13 — Implement student registration

Implemented functionality for registering and adding students to the student list.

Screenshot




Commit 14 — Add student edit feature

Added functionality to edit student name, roll number, and branch.

Screenshot




Commit 15 — Add student delete feature

Added functionality to delete students from the student list.

Screenshot




Commit 16 — Add attendance percentage calculation

Added automatic attendance percentage calculation based on present days and total days.

Screenshot




Commit 17 — Add student search feature

Added case-insensitive search functionality using student name or roll number.

Screenshot




Commit 18 — Add branch dropdown selection

Added a branch dropdown with:

CSE
ECE
EEE
MECH
CIVIL
Screenshot




Commit 19 — Improve attendance display

Improved the student attendance display by showing:

Present days
Total days
Attendance percentage
Current Present/Absent status
Green status for Present
Red status for Absent
Screenshot




Commit 20 — Final UI & App Structure

Finalized the application structure and added proper disposal of the text controllers using dispose().

Screenshot




📊 Final Application Capabilities
Feature	Status
Student Registration	✅
Student List	✅
Student Edit	✅
Student Delete	✅
Student Search	✅
Branch Selection	✅
Attendance Marking	✅
Attendance Tracking	✅
Attendance Percentage	✅
Present/Absent Status	✅
Form Validation	✅
Confirmation Messages	✅
GitHub Version History	✅
20 Development Commits	✅
🧑‍💻 Author

Mamidi Gopi Krishna

B.Tech — Computer Science and Engineering

GitHub: GOPIKRISHNA9110

📄 License

This project was created for educational and academic purposes.
