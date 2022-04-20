resource "harness_user_group" "app_admin" {
  name        = "${var.prefix}_admin"
  description = "Administrators of the ${var.application_name} application."

  permissions {

    account_permissions = [
      "CREATE_CUSTOM_DASHBOARDS"
    ]

    app_permissions {

      all {
        app_ids = [harness_application.demo.id]
        actions = ["CREATE", "READ", "UPDATE", "DELETE"]
      }

    }
  }
}

resource "harness_user_group" "app_developer" {
  name        = "${var.prefix}_dev"
  description = "Devlopers of the ${var.application_name} application."

  permissions {
    account_permissions = [
      "CREATE_CUSTOM_DASHBOARDS"
    ]

    app_permissions {

      all {
        app_ids = [harness_application.demo.id]
        actions = ["READ"]
      }

      deployment {
        app_ids = [harness_application.demo.id]
        filters = ["NON_PRODUCTION_ENVIRONMENTS"]
        actions = ["READ", "ROLLBACK_WORKFLOW", "EXECUTE_PIPELINE", "EXECUTE_WORKFLOW"]
      }

    }
  }
}
