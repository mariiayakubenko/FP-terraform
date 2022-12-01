#output "account_id" {
#  value = data.aws_caller_identity.current.account_id
#}

output "myip" {
  value = "${chomp(data.http.myip.response_body)}/32"
}

output "latest_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}
