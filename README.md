# SPROuT Day 3 Mini-Project: Apply Version Control to a Messy Project

**Science Powered through Reproducibility, Openness, and Teamwork**

<div align="center">

| **📚 Course Info** | **⚙️ Technical** | **✅ Status** |
|:---:|:---:|:---:|
| ![Semester](https://img.shields.io/badge/Semester-Winter_2025%2F26-blue) | [![License](https://img.shields.io/badge/License-All_Rights_Reserved-red.svg)](LICENSE) | ![Status](https://img.shields.io/badge/Status-Teaching_Exercise-orange) |
| ![Type](https://img.shields.io/badge/Type-Mini_Project-orange) | ![Language](https://img.shields.io/badge/Language-R-blue?logo=r) | ![Difficulty](https://img.shields.io/badge/Difficulty-Intermediate-yellow) |
| ![Related](https://img.shields.io/badge/Related_to-Day_3_SAVE-blue) | ![Duration](https://img.shields.io/badge/Duration-25--30_min-blue) | ![Warning](https://img.shields.io/badge/⚠️-Intentionally_Messy-red) |

</div>

---

A hands-on team exercise to apply Day 3 concepts: Git workflows, branching, pull requests, and merge conflicts.

## About This Exercise

This mini-project is part of the **SPROuT Day 3: SAVE** session, where you learn never to lose your work again through version control. This practical exercise brings together all the concepts from today's course.

**Course Context**: [SPROuT](https://github.com/CUNI-SPROuT) - A 5-day course on reproducible research practices at Charles University.

## 🎯 Objective

Apply everything you learned today to transform a messy forest analysis project into a properly version-controlled, collaborative research project. Work in teams to fix the code while practicing Git workflows including branching, pull requests, code review, and resolving merge conflicts.

## 📋 The Scenario

A research team has collected forest inventory data and started analyzing it, but the project is a disaster! There's no version control, files are disorganized, the code is messy, and multiple team members need to work on different parts simultaneously. Your team must initialize Git, set up proper collaboration workflows, fix the project issues, and practice professional Git/GitHub workflows.

## ⚠️ IMPORTANT: Download, Don't Clone

**DO NOT** clone this repository! You need to practice initializing Git yourself.

**Instead:**

1. **Download** this repository as a ZIP file (or wait for the instructor's release package)
2. Extract it to your computer
3. Follow the tasks below to initialize Git yourself

This is critical practice for starting version control on existing projects!

## 🔍 What's Wrong?

This project has issues spanning all three days of SPROuT:

### Day 1 Issues (Project Organization)

- No `.Rproj` file
- No proper folder structure (`Data/Input/`, `Data/Processed/`, `R/`, `Outputs/`)
- Files scattered everywhere (data, scripts, outputs all mixed)
- Hardcoded absolute paths (`C:/Users/JohnDoe/...`)

### Day 2 Issues (Code Quality)

- Poor naming conventions and code style
- No script structure or documentation
- Violates immutability (overwrites original data)
- No use of pipes or tidyverse best practices
- Functions not documented or sourced properly

### Day 3 Issues (Version Control) - **YOUR MAIN FOCUS**

- **No Git repository initialized**
- No `.gitignore` file (or inadequate one)
- No LICENSE (intentionally missing - you'll add one as part of the exercise!)
- Poor README (needs team coordination to update)
- Generated output files not being ignored
- No collaboration workflow in place

## 📁 Files Provided

### Data Files (scattered in root)

- `forest_inventory_data.csv` - Tree measurements (DBH, height, age, species)
- `environmental_measurements_backup_old.csv` - Plot environmental data (misleading name - it's actually current!)
- `plot_data_processed.csv` - Generated output (shouldn't be tracked!)

### R Scripts (also scattered)

- `analysis.R` - Main analysis (messy, hardcoded paths)
- `data_processing.R` - Data wrangling (poor style, violates immutability)
- `visualization.R` - Plotting code (needs improvement)
- `helper_functions.R` - Utility functions (undocumented, not sourced)

### Other Files

- `IMPORTANT_NOTES_READ_THIS.txt` - Critical information buried in text file
- `project_TODO_list.txt` - Tasks
- `.gitignore` - missing

## 👥 Team Workflow

This is a **team exercise**. Your instructor will assign you to teams of 2-3 people. Each person should work on different parts simultaneously to practice collaborative Git workflows.

### Suggested Division of Work

**Everyone starts together:**

1. One person creates the `.Rproj` file and initializes Git
2. That person makes the initial commit and creates the GitHub repo
3. Add all team members as collaborators
4. Everyone clones the repository

**Then work in parallel on separate branches:**

**Person A**: Fix `analysis.R`

- Create branch `fix-analysis`
- Fix folder structure and file paths
- Improve code style and documentation
- Create pull request when done

**Person B**: Fix `data_processing.R`

- Create branch `fix-data-processing`
- Apply tidyverse principles
- Fix immutability violations
- Create pull request when done

**Person C** (or Person A/B if only 2 people): Fix `visualization.R` and outputs

- Create branch `fix-visualization`
- Improve plot code and organization
- Set up proper `Outputs/Figures/` folder
- Create pull request when done

**Everyone together** (this will create merge conflicts - this is intentional!):

- All team members update the same section of README
- Practice resolving merge conflicts
- Review each other's pull requests
- Merge everything together

## 🎓 Deliverables

After completing the mini-project, **one person per team** posts to [GitHub Discussions](https://github.com/orgs/CUNI-SPRouT/discussions) with:

1. **Repository link** - Your team's public GitHub repository URL

2. **Commit history screenshot** - Showing:
   - Multiple contributors
   - Meaningful commit messages
   - Different branches visible

3. **Pull request process screenshot** - Showing:
   - At least one pull request
   - Code review comments
   - Successful merge

4. **Branching strategy description** - Brief text explaining:
   - What branches you created
   - How you divided the work
   - How you coordinated

5. **Merge conflict resolution** - Screenshot or description of:
   - Where conflicts occurred (likely in README)
   - How you resolved them

## ⏱️ Time Allocation

- **5 minutes**: Download, create project, initialize Git, set up GitHub
- **10 minutes**: Individual work on branches (fix assigned scripts)
- **10 minutes**: Create pull requests, code review, merge
- **5 minutes**: Handle merge conflicts, finalize, prepare deliverables

## 💡 Tips

### Getting Started

**Step 1: Set up the project**

```r
# In RStudio: File > New Project > Existing Directory
# Select the downloaded folder
# This creates the .Rproj file
```

**Step 2: Initialize Git**

```r
usethis::use_git()
```

**Step 3: Create proper .gitignore**

```r
usethis::use_git_ignore(c(
  ".Rproj.user",
  ".Rhistory",
  ".RData",
  ".Ruserdata",
  "*.html",
  "*.png",
  "Data/Processed/*",
  "Outputs/"
))
```

**Step 4: Make initial commit**

- Stage and commit all source files
- Use meaningful message: "Initial commit: Raw project before cleanup"

**Step 5: Create GitHub repository**

```r
usethis::use_github()
```

**Step 6: Add collaborators**

- Go to GitHub repo > Settings > Collaborators
- Add your team members

### Working on Branches

**Create and switch to your branch:**

```r
# Using usethis
usethis::pr_init("fix-analysis")  # or "fix-data-processing", etc.

# Or using RStudio: New Branch button in Git pane
```

**Make your changes, commit frequently:**

- Stage files in Git pane
- Write clear commit messages
- Push regularly

**Create pull request:**

```r
usethis::pr_push()
# This opens your browser to create the PR
```

### Code Review & Merging

- Review each other's pull requests on GitHub
- Leave at least one comment per PR
- Approve when satisfied
- Merge using GitHub interface

### Creating Intentional Merge Conflicts

To practice conflict resolution, **all team members** should:

1. Update the same section of README (e.g., all edit the "About" section)
2. Commit and push from different branches
3. Try to merge - conflicts will occur!
4. Practice resolving them together

### Fixing Day 1 & Day 2 Issues

While your main focus is version control, you should also apply Days 1-2 concepts:

**Project organization:**

- Create proper folder structure
- Move files to appropriate locations
- Use `here::here()` for all paths

**Code quality:**

- Apply consistent naming (`snake_case`)
- Add script structure with headers
- Use pipes and tidyverse functions
- Document functions
- Follow immutability principles

## 🆘 If You Get Stuck

- **Git issues**: Review [Day 3 presentation slides](https://cuni-sprout.github.io/SPROuT-Day3/)
- **Merge conflicts**: Don't panic! They're normal. Read the conflict markers carefully.
- **Team coordination**: Communicate! Use GitHub Issues or team chat.
- **Questions**: Ask in [GitHub Discussions](https://github.com/orgs/CUNI-SPRouT/discussions)

## 📚 Key Git Commands Covered Today

```r
# Initialize Git
usethis::use_git()

# Create GitHub repo
usethis::use_github()

# Working with branches
usethis::pr_init("branch-name")   # Create and switch to branch
usethis::pr_push()                 # Push and create PR
usethis::pr_finish()               # Clean up after merge

# Check status
usethis::git_sitrep()              # Situation report

# Using git directly
gert::git_status()
gert::git_add("file.R")
gert::git_commit("message")
gert::git_push()
```

## 🎯 Learning Outcomes Check

By completing this exercise, you've practiced:

- ✅ Initializing Git on an existing project
- ✅ Creating meaningful commits with good messages
- ✅ Setting up a GitHub remote repository
- ✅ Adding collaborators to a repository
- ✅ Working with branches for parallel development
- ✅ Creating pull requests for code review
- ✅ Reviewing and commenting on pull requests
- ✅ Merging branches on GitHub
- ✅ Resolving merge conflicts
- ✅ Using `{usethis}` helpers for Git workflows
- ✅ Setting up proper `.gitignore` files
- ✅ Applying Days 1-2 concepts while using version control

## 📚 Related Resources

- [SPROuT Day 1](https://github.com/CUNI-SPROuT/SPROuT-Day1): Project organization and structure
- [SPROuT Day 2](https://github.com/CUNI-SPROuT/SPROuT-Day2-Projects): Code hygiene and {tidyverse}
- [SPROuT Day 3](https://github.com/CUNI-SPROuT/SPROuT-Day3-VersionControl): Version control
- [Happy Git with R](https://happygitwithr.com/): Comprehensive Git guide for R users
- [GitHub Guides](https://guides.github.com/): Official GitHub documentation
- [usethis documentation](https://usethis.r-lib.org/): R package for project setup

---

Good luck with your collaborative Git adventure! 🚀

**Remember**: Merge conflicts are a *good* thing - they mean multiple people are actively working together!

**Instructor**: Ondřej Mottl  
**Institution**: Department of Botany, Faculty of Science, Charles University  
**Laboratory**: [Laboratory of Quantitative Ecology](https://ondrejmottl.github.io/lab/about_the_lab.html)
