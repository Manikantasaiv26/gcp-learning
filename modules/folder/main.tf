resource "google_folder" "folder" {

  display_name = var.folder_name
  parent       = "organizations/${var.organization_id}"

}

output "folder_id" {
  value = google_folder.folder.name
}

output "folder_name" {
  value = google_folder.folder.name
}