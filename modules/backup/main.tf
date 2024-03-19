resource "aws_backup_plan" "backup_plan" {
  name          = "web_backup_plan"
  rule {
    rule_name           = "daily_backup"
    target_vault_name   = "web_backup_vault"
    schedule            = "cron(0 12 * * ? *)" # Plan de sauvegarde quotidien à midi UTC
    start_window       = "60"
    completion_window   = "360"
    lifecycle {
      delete_after = "30" # Supprimer les sauvegardes après 30 jours
    }
  }
}

resource "aws_backup_selection" "backup_selection" {
  name            = "web_backup_selection"
  plan_id         = aws_backup_plan.backup_plan.id
  iam_role_arn    = "arn:aws:iam::123456789012:role/backup-role" # Spécifiez le rôle IAM pour les sauvegardes
}
