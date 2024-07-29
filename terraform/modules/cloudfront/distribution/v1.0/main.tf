resource "aws_cloudfront_distribution" "this" {

  enabled = true

  origin {
    origin_id   = format("%s-%s", var.origin_id, "origin")
    domain_name = var.domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {

    target_origin_id = format("%s-%s", var.origin_id, "origin")
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  price_class = "PriceClass_200"

  tags = var.tags

}
