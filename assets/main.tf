module "spark_ingest" {
  source           = "git::ssh://git@git..."
  config           = local.config["core_infrastructure"]
  config_json_path = "configs/spark_ingest.json"
  stepfunction_arn = local.config["step_functions"]["default_parallel_5"]["stepfunction_arn"]
  providers = {
    aws      = aws
    external = external
    null     = null
    random   = random
    template = template
  }
}

module "prepare_pre" {
  source           = "git::ssh://git@git..."
  config           = local.config["core_infrastructure"]
  config_json_path = "configs/prepare_pre.json"
  stepfunction_arn = local.config["step_functions"]["default_parallel_5"]["stepfunction_arn"]
  providers = {
    aws      = aws
    external = external
    null     = null
    random   = random
    template = template
  }
}