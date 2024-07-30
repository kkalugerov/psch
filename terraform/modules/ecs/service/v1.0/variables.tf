variable "region" {
  description = "AWS regio in use"
  type        = string
  default     = "eu-west-1"
}

variable "prefix" {
  description = "Used as resources ownership marker"
  type        = string
  default     = "kkalugeroff"
}

variable "usage" {
  description = "What resource is used for"
  type        = string
  default     = ""
}

variable "target_group_port" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target."
  type        = number
  default     = 0
}

variable "target_group_protocol" {
  description = "Protocol to use for routing traffic to the targets"
  type        = string
  default     = ""
}

variable "target_type" {
  description = "ALB target group type"
  type        = string
  default     = "ip"
}

variable "vpc_id" {
  description = "VPC ID where target group needs to be created"
  type        = string
  default     = ""
}

variable "health_check_enabled" {
  description = "Determines whether health check will be enabled"
  type        = bool
  default     = true
}

variable "health_check_interval" {
  description = "Target Group health check internval"
  type        = number
  default     = 60
}

variable "health_check_path" {
  description = "Target Group health check path"
  type        = string
  default     = "/"
}

variable "health_check_healthy_threshold" {
  description = "Number of consecutive health check successes required before considering a target healthy."
  type        = number
  default     = 3
}

variable "health_check_ubhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering a target unhealthy."
  type        = number
  default     = 3
}

variable "health_check_timeout" {
  description = "Amount of time, in seconds, during which no response from a target means a failed health check"
  type        = number
  default     = 10
}

variable "health_check_protocol" {
  description = "Protocol the load balancer uses when performing health checks on targets."
  type        = string
  default     = "HTTP"
}

variable "health_check_matcher" {
  description = "The HTTP or gRPC codes to use when checking for a successful response from a target."
  type        = string
  default     = "200"
}

variable "load_balancer_arn" {
  description = "ARN of the load balancer being used."
  type        = string
  default     = ""
}

variable "listener_port" {
  description = "Port on which the load balancer is listening."
  type        = number
  default     = 0
}

variable "listener_protocol" {
  description = "Protocol for connections from clients to the load balancer."
  type        = string
  default     = ""
}

variable "listener_certificate_arn" {
  description = "ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
  type        = string
  default     = null
}

variable "listener_defailt_action" {
  description = " Type of routing action."
  type        = string
  default     = "forward"
}

variable "listener_ssl_policy" {
  description = "Name of the SSL Policy for the listener."
  type        = string
  default     = null
}

variable "cluster_id" {
  description = "Id of the cluster where service to be created"
  type        = string
  default     = ""
}

variable "service_name" {
  description = "Name of the service"
  type        = string
  default     = ""
}

variable "ecs_task_desired_count" {
  description = "Number of instances of the task definition to place and keep running. "
  type        = number
  default     = 0
}

variable "ecs_task_deployment_minimum_healthy_percent" {
  description = " Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
  default     = 100
}

variable "ecs_task_deployment_maximum_percent" {
  description = "Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
  type        = number
  default     = 200
}

variable "service_launch_type" {
  description = "Launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL"
  type        = string
  default     = "FARGATE"
}

variable "container_port" {
  description = "Port on the container to associate with the load balancer."
  type        = number
  default     = 0
}

variable "service_security_group_ids" {
  description = "Security groups associated with the task or service."
  type        = list(string)
  default     = []
}

variable "service_subnet_ids" {
  description = "Subnets associated with the task or service."
  type        = list(string)
  default     = []
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI (Fargate launch type only)"
  type        = bool
  default     = false
}

variable "td_network_mode" {
  description = "Docker networking mode to use for the containers in the task."
  type        = string
  default     = "awsvpc"
}

variable "td_requires_compatibilities" {
  description = "Set of launch types required by the task."
  type        = list(string)
  default     = ["FARGATE"]
}

variable "td_execution_role_arn" {
  description = "Task execution role ARN"
  type        = string
  default     = null
}

variable "td_task_role_arn" {
  description = "Task role ARN"
  type        = string
  default     = null
}

variable "td_cpu_units" {
  description = "Number of cpu units used by the task."
  type        = number
  default     = 512
}

variable "td_memory" {
  description = "Amount (in MiB) of memory used by the task."
  type        = number
  default     = 1024
}

variable "repository_url" {
  description = "Image repository url"
  type        = string
}

variable "image_tag" {
  description = "ECR image tag"
  type        = string
  default     = "latest"
}

variable "cd_environmental_variables" {
  description = "Environmental Variables set on task definition level"
  type = list(object({
    name  = string
    value = string
  }))

  default = null
}

variable "cd_port_mappings_container_port" {
  description = "The port number on the container instance to reserve for your container."
  type        = number
  default     = null
}

variable "cd_port_mappings_host_port" {
  description = "The port number on the container instance to reserve for your container."
  type        = number
  default     = null
}

variable "cd_protocol" {
  description = "The protocol used for the port mapping. Valid values are tcp and udp."
  type        = string
  default     = "tcp"
}
