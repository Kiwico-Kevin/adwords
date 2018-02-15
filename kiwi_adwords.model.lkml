connection: "kiwi_adwords"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: kiwi_adwords_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kiwi_adwords_default_datagroup

# explore: ad_groups {
#   join: campaigns {
#     type: left_outer
#     sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: ad_groups_view {
#   join: campaigns {
#     type: left_outer
#     sql_on: ${ad_groups_view.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }

explore: ad_performance_reports {
  join: ads {
    type: left_outer
    sql_on: ${ad_performance_reports.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: ad_groups {
    type: left_outer
    sql_on: ${ads.ad_group_id} = ${ad_groups.id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer
    sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: pages {
    type:  left_outer
    sql_on:  ${ads.ad_group_id} = ${pages.utm_content} ;;
    relationship:  many_to_many
    required_joins: [ads]
  }
  join: users {
    type: left_outer
    sql_on: ${pages.user_id} = ${users.id} ;;
    relationship: many_to_one
    required_joins: [pages]
  }
  join: completed_order {
    type: left_outer
    sql_on: ${pages.anonymous_id} = ${completed_order.anonymous_id} ;;
    relationship: many_to_many
    required_joins: [pages]
  }
  join: email_submitted {
    type: left_outer
    sql_on: ${pages.anonymous_id} = ${email_submitted.anonymous_id} ;;
    relationship: many_to_many
    required_joins: [pages]
  }
}

# explore: ad_performance_reports_view {
#   join: ads {
#     type: left_outer
#     sql_on: ${ad_performance_reports_view.ad_id} = ${ads.id} ;;
#     relationship: many_to_one
#   }
#
#   join: ad_groups {
#     type: left_outer
#     sql_on: ${ads.ad_group_id} = ${ad_groups.id} ;;
#     relationship: many_to_one
#   }
#
#   join: campaigns {
#     type: left_outer
#     sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ads {
#   join: ad_groups {
#     type: left_outer
#     sql_on: ${ads.ad_group_id} = ${ad_groups.id} ;;
#     relationship: many_to_one
#   }
#
#   join: campaigns {
#     type: left_outer
#     sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: ads_view {
#   join: ad_groups {
#     type: left_outer
#     sql_on: ${ads_view.ad_group_id} = ${ad_groups.id} ;;
#     relationship: many_to_one
#   }
#
#   join: campaigns {
#     type: left_outer
#     sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: campaign_performance_reports {
#   join: campaigns {
#     type: left_outer
#     sql_on: ${campaign_performance_reports.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: campaign_performance_reports_view {
#   join: campaigns {
#     type: left_outer
#     sql_on: ${campaign_performance_reports_view.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: campaigns {}
#
# explore: campaigns_view {}
#
# explore: click_performance_reports {
#   join: ad_groups {
#     type: left_outer
#     sql_on: ${click_performance_reports.ad_group_id} = ${ad_groups.id} ;;
#     relationship: many_to_one
#   }
#
#   join: campaigns {
#     type: left_outer
#     sql_on: ${click_performance_reports.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: click_performance_reports_view {
#   join: ad_groups {
#     type: left_outer
#     sql_on: ${click_performance_reports_view.ad_group_id} = ${ad_groups.id} ;;
#     relationship: many_to_one
#   }
#
#   join: campaigns {
#     type: left_outer
#     sql_on: ${click_performance_reports_view.campaign_id} = ${campaigns.id} ;;
#     relationship: many_to_one
#   }
# }
