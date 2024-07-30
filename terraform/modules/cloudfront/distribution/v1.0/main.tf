resource "aws_cloudfront_distribution" "this" {

  enabled = true

  origin {
    origin_id   = format("%s-%s", var.origin_id, "origin")
    domain_name = var.domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = var.origin_protocol_policy
      origin_ssl_protocols   = var.origin_ssl_protocols
    }
  }

  default_cache_behavior {

    target_origin_id = format("%s-%s", var.origin_id, "origin")
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = 0
    default_ttl            = 360
    max_ttl                = 720
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  dynamic "logging_config" {
    for_each = length(var.logging_config) > 0 ? [var.logging_config] : []
    content {
      include_cookies = lookup(logging_config.value, "include_cookies", null)
      bucket          = format("%s.%s", lookup(logging_config.value, "bucket", null), "s3.amazonaws.com")
      prefix          = lookup(logging_config.value, "prefix", null)
    }
  }

  price_class = "PriceClass_200"

  tags = var.tags

}
