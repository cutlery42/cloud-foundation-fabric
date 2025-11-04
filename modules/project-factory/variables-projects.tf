/**
 * Copyright 2025 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "projects" {
  description = "Projects data merged with factory data."
  type = map(object({
    alerts = optional(map(object({
      combiner              = string
      display_name          = optional(string)
      enabled               = optional(bool)
      notification_channels = optional(list(string), [])
      severity              = optional(string)
      user_labels           = optional(map(string))
      alert_strategy = optional(object({
        auto_close           = optional(string)
        notification_prompts = optional(list(string))
        notification_rate_limit = optional(object({
          period = optional(string)
        }))
        notification_channel_strategy = optional(object({
          notification_channel_names = optional(list(string))
          renotify_interval          = optional(string)
        }))
      }))
      conditions = optional(list(object({
        display_name = string
        condition_absent = optional(object({
          duration = string
          filter   = optional(string)
          aggregations = optional(object({
            per_series_aligner   = optional(string)
            group_by_fields      = optional(list(string))
            cross_series_reducer = optional(string)
            alignment_period     = optional(string)
          }))
          trigger = optional(object({
            count   = optional(number)
            percent = optional(number)
          }))
        }))
        condition_matched_log = optional(object({
          filter           = string
          label_extractors = optional(map(string))
        }))
        condition_monitoring_query_language = optional(object({
          duration                = string
          query                   = string
          evaluation_missing_data = optional(string)
          trigger = optional(object({
            count   = optional(number)
            percent = optional(number)
          }))
        }))
        condition_prometheus_query_language = optional(object({
          query                     = string
          alert_rule                = optional(string)
          disable_metric_validation = optional(bool)
          duration                  = optional(string)
          evaluation_interval       = optional(string)
          labels                    = optional(map(string))
          rule_group                = optional(string)
        }))
        condition_threshold = optional(object({
          comparison              = string
          duration                = string
          denominator_filter      = optional(string)
          evaluation_missing_data = optional(string)
          filter                  = optional(string)
          threshold_value         = optional(number)
          aggregations = optional(object({
            per_series_aligner   = optional(string)
            group_by_fields      = optional(list(string))
            cross_series_reducer = optional(string)
            alignment_period     = optional(string)
          }))
          denominator_aggregations = optional(object({
            per_series_aligner   = optional(string)
            group_by_fields      = optional(list(string))
            cross_series_reducer = optional(string)
            alignment_period     = optional(string)
          }))
          forecast_options = optional(object({
            forecast_horizon = string
          }))
          trigger = optional(object({
            count   = optional(number)
            percent = optional(number)
          }))
        }))
      })), [])
      documentation = optional(object({
        content   = optional(string)
        mime_type = optional(string)
        subject   = optional(string)
        links = optional(list(object({
          display_name = optional(string)
          url          = optional(string)
        })))
      }))
    })))
    auto_create_network = optional(bool, false)
    automation = optional(object({
      project = string
      bucket = optional(object({
        location                    = string
        description                 = optional(string)
        force_destroy               = optional(bool)
        prefix                      = optional(string)
        storage_class               = optional(string, "STANDARD")
        uniform_bucket_level_access = optional(bool, true)
        versioning                  = optional(bool)
        iam                         = optional(map(list(string)), {})
        iam_bindings = optional(map(object({
          members = list(string)
          role    = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
        iam_bindings_additive = optional(map(object({
          member = string
          role   = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
        labels = optional(map(string), {})
        managed_folders = optional(map(object({
          force_destroy = optional(bool)
          iam           = optional(map(list(string)), {})
          iam_bindings = optional(map(object({
            members = list(string)
            role    = string
            condition = optional(object({
              expression  = string
              title       = string
              description = optional(string)
            }))
          })), {})
          iam_bindings_additive = optional(map(object({
            member = string
            role   = string
            condition = optional(object({
              expression  = string
              title       = string
              description = optional(string)
            }))
          })), {})
        })), {})
      }))
      service_accounts = optional(map(object({
        description = optional(string)
        iam         = optional(map(list(string)), {})
        iam_bindings = optional(map(object({
          members = list(string)
          role    = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
        iam_bindings_additive = optional(map(object({
          member = string
          role   = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
        iam_billing_roles      = optional(map(list(string)), {})
        iam_folder_roles       = optional(map(list(string)), {})
        iam_organization_roles = optional(map(list(string)), {})
        iam_project_roles      = optional(map(list(string)), {})
        iam_sa_roles           = optional(map(list(string)), {})
        iam_storage_roles      = optional(map(list(string)), {})
      })), {})
    }))
    billing_account = optional(string)
    billing_budgets = optional(list(string), [])
    buckets = optional(map(object({
      location                    = string
      description                 = optional(string)
      force_destroy               = optional(bool)
      prefix                      = optional(string)
      storage_class               = optional(string, "STANDARD")
      uniform_bucket_level_access = optional(bool, true)
      versioning                  = optional(bool)
      iam                         = optional(map(list(string)), {})
      iam_bindings = optional(map(object({
        members = list(string)
        role    = string
        condition = optional(object({
          expression  = string
          title       = string
          description = optional(string)
        }))
      })), {})
      iam_bindings_additive = optional(map(object({
        member = string
        role   = string
        condition = optional(object({
          expression  = string
          title       = string
          description = optional(string)
        }))
      })), {})
      labels = optional(map(string), {})
      managed_folders = optional(map(object({
        force_destroy = optional(bool)
        iam           = optional(map(list(string)), {})
        iam_bindings = optional(map(object({
          members = list(string)
          role    = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
        iam_bindings_additive = optional(map(object({
          member = string
          role   = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
      })), {})
    })), {})
    contacts         = optional(map(list(string)))
    compute_metadata = optional(map(string))

    default_service_account = optional(string, "keep")
    descriptive_name        = optional(string)
    factories_config = optional(object({
      custom_roles  = optional(string)
      observability = optional(string)
      org_policies  = optional(string)
      quotas        = optional(string)
      tags          = optional(string)
    }))

    deletion_policy = optional(string)
    iam             = optional(map(list(string)), {})
    iam_bindings = optional(map(object({
      members = list(string)
      role    = string
      condition = optional(object({
        expression  = string
        title       = string
        description = optional(string)
      }))
    })), {})
    iam_bindings_additive = optional(map(object({
      member = string
      role   = string
      condition = optional(object({
        expression  = string
        title       = string
        description = optional(string)
      }))
    })), {})
    iam_by_principals = optional(map(list(string)), {})
    labels            = optional(map(string), {})
    lien_reason       = optional(string)

    log_buckets = optional(map(object({
      location     = optional(string, "global")
      description  = optional(string)
      kms_key_name = optional(string)
      retention    = optional(any)
      log_analytics = optional(object({
        enable          = optional(bool, false)
        dataset_link_id = optional(string)
        description     = optional(string, "Log Analytics Dataset")
      }))
    })), {})

    metric_scopes = optional(list(string), [])
    name          = optional(string)
    org_policies = optional(map(object({
      inherit_from_parent = optional(bool) # for list policies only.
      reset               = optional(bool)
      rules = optional(list(object({
        allow = optional(object({
          all    = optional(bool)
          values = optional(list(string))
        }))
        deny = optional(object({
          all    = optional(bool)
          values = optional(list(string))
        }))
        enforce = optional(bool) # for boolean policies only.
        condition = optional(object({
          description = optional(string)
          expression  = optional(string)
          location    = optional(string)
          title       = optional(string)
        }), {})
        parameters = optional(string)
      })), [])
    })), {})

    parent = optional(string)
    prefix = optional(string)
    project_reuse = optional(object({
      use_data_source = optional(bool, true)
      attributes = optional(object({
        name             = string
        number           = number
        services_enabled = optional(list(string), [])
      }))
    }))
    quotas = optional(map(object({
      service              = string
      quota_id             = string
      preferred_value      = number
      dimensions           = optional(map(string), {})
      justification        = optional(string)
      contact_email        = optional(string)
      annotations          = optional(map(string))
      ignore_safety_checks = optional(string)
    })), {})
    service_accounts = optional(map(object({
      display_name      = optional(string)
      iam_self_roles    = optional(list(string), [])
      iam_project_roles = optional(map(list(string)), {})
    })), {})
    service_encryption_key_ids = optional(map(list(string)), {})
    services                   = optional(list(string), [])
    shared_vpc_host_config = optional(object({
      enabled          = bool
      service_projects = optional(list(string), [])
    }))
    shared_vpc_service_config = optional(object({
      host_project             = string
      network_users            = optional(list(string), [])
      service_agent_iam        = optional(map(list(string)), {})
      service_agent_subnet_iam = optional(map(list(string)), {})
      service_iam_grants       = optional(list(string), [])
      network_subnet_users     = optional(map(list(string)), {})
    }))
    tag_bindings = optional(map(string), {})
    tags = optional(map(object({
      id          = optional(string)
      description = optional(string, "Managed by the Terraform project module.")
      iam         = optional(map(list(string)), {})
      iam_bindings = optional(map(object({
        members = list(string)
        role    = string
        condition = optional(object({
          expression  = string
          title       = string
          description = optional(string)
        }))
      })), {})
      iam_bindings_additive = optional(map(object({
        member = string
        role   = string
        condition = optional(object({
          expression  = string
          title       = string
          description = optional(string)
        }))
      })), {})
      values = optional(map(object({
        id          = optional(string)
        description = optional(string, "Managed by the Terraform project module.")
        iam         = optional(map(list(string)), {})
        iam_bindings = optional(map(object({
          members = list(string)
          role    = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
        iam_bindings_additive = optional(map(object({
          member = string
          role   = string
          condition = optional(object({
            expression  = string
            title       = string
            description = optional(string)
          }))
        })), {})
      })), {})
    })), {})
    universe = optional(object({
      prefix                         = string
      forced_jit_service_identities  = optional(list(string), [])
      unavailable_services           = optional(list(string), [])
      unavailable_service_identities = optional(list(string), [])
    }), null)
    vpc_sc = optional(object({
      perimeter_name = string
      is_dry_run     = optional(bool, false)
    }))
  }))
  nullable = false
  default  = {}
}
