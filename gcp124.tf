resource "google_storage_bucket" "bucket" {
  name     = "test-bucket"
  location = "US"
  labels = {
    git_commit           = "b311a2fc708b51d2bc906b94c210c5851c3aba8d"
    git_file             = "gcp124_tf"
    git_last_modified_at = "2024-08-28-00-48-52"
    git_last_modified_by = "imtariq"
    git_modifiers        = "imtariq"
    git_org              = "IT-Test-Org"
    git_repo             = "Vuln-Files-Repo"
    yor_name             = "bucket"
    yor_trace            = "b4e1f774-c9c5-4117-aa11-402437f4a0a7"
  }
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./path/to/zip/file/which/contains/code"
}

resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "nodejs16"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "helloGET"
  labels = {
    git_commit           = "b311a2fc708b51d2bc906b94c210c5851c3aba8d"
    git_file             = "gcp124_tf"
    git_last_modified_at = "2024-08-28-00-48-52"
    git_last_modified_by = "imtariq"
    git_modifiers        = "imtariq"
    git_org              = "IT-Test-Org"
    git_repo             = "Vuln-Files-Repo"
    yor_name             = "function"
    yor_trace            = "2ce10e9a-65bd-4366-ab52-e71a61306492"
  }
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
