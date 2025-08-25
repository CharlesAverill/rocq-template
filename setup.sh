read -p "Project Name: " PROJECT
read -p "Project Description: " DESCRIPTION
read -p "Project Synopsis: " SYNOPSIS
read -p "Author Name: " NAME
read -p "Author Github Username: " GH_USERNAME
read -p "Author email (for CI): " EMAIL

mv .git "../.git.$PROJECT"

find . -type f -exec sed -i "s/SYNOPSIS/$SYNOPSIS/g; s/DESCRIPTION/$DESCRIPTION/g; s/PROJECT/$PROJECT/g; s/NAME/$NAME/g; s/GH_USERNAME/$GH_USERNAME/g; s/EMAIL/$EMAIL/g" {} +

mv README.md.template README.md
mv project.opam "$PROJECT.opam"

rm setup.sh

echo "Creating gh-pages branch, pushing to origin/gh-pages"
git checkout -b gh-pages
git push origin gh-pages
git checkout main
