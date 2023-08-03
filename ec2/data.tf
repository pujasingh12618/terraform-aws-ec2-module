data "template_file" "user_data" {

  count = var.user_data_path == null ? 0 : 1
  
  template = file("${var.user_data_path}")

}