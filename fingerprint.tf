resource "null_resource" "git_commit_id" {
    provisioner "local-exec" {
        command = "git rev-parse --short HEAD > ${var.tmp_file_directory}"
    }
}

data "template_file" "git_commit_id" {
    template = "${var.tmp_file_directory}"
}

data "local_file" "git_commit_id" {
    filename = "${data.template_file.git_commit_id.rendered}"
    depends_on = ["null_resource.git_commit_id"]
}