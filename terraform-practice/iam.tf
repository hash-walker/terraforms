resource "aws_iam_user" "assignment_user" {
    name = "terraform_practice_admin"

    tags = {
        Description = "Admin user for Terraform Practice Project"
    }
}

resource "aws_iam_user_policy_attachment" "admin_attach" {
  user        = aws_iam_user.assignment_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "assignment_key" {
    user = aws_iam_user.assignment_user.name
}
