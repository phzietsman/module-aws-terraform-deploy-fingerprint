output "output" {
    value = "${trimspace(data.local_file.git_commit_id.content)}"
}