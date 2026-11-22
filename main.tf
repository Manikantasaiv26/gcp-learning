module "folder" {
  source          = "./modules/folder"
  folder_name     = var.folder_name
  organization_id = var.organization_id
}

module "dev_project" {
  source       = "./modules/project"
  project_name = "infydev"
  project_id   = "infyme-dev-001"
  folder_id    = module.folder.folder_id
}

module "test_project" {
  source       = "./modules/project"
  project_name = "infytest"
  project_id   = "infyme-test-001"
  folder_id    = module.folder.folder_id
}

module "prod_project" {
  source       = "./modules/project"
  project_name = "infyprod"
  project_id   = "infyme-prod-001"
  folder_id    = module.folder.folder_id
}

resource "google_folder_iam_member" "folder_viewer" {

  folder = module.folder.folder_name

  role = "roles/viewer"

  member = "user:${var.user_email}"

}

module "dev_viewer" {
  source     = "./modules/iam"
  project_id = module.dev_project.project_id
  user_email = var.user_email
  role       = "roles/viewer"
}

module "test_viewer" {
  source     = "./modules/iam"
  project_id = module.test_project.project_id
  user_email = var.user_email
  role       = "roles/viewer"
}

module "prod_viewer" {
  source     = "./modules/iam"
  project_id = module.prod_project.project_id
  user_email = var.user_email
  role       = "roles/viewer"
}

module "prod_viewer_vishnu" {
  source     = "./modules/iam"
  project_id = module.prod_project.project_id
  user_email = var.prod_user_email
  role       = "roles/viewer"
}