# Fixture for plan-parity semantics tests (see .github/workflows/test_parity.yml).
# terraform_data is a built-in resource type, so this runs fully offline with a
# local backend -- no provider downloads and no cloud credentials required.
# A stored plan generated with one `content` value and an apply re-planned with a
# different value produces a deterministic plan-parity mismatch.
terraform {
  required_version = ">= 1.4.0"
}

variable "content" {
  type    = string
  default = "v1"
}

resource "terraform_data" "content" {
  input = var.content
}
