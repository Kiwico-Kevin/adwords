view: ads {
  sql_table_name: adwords.ads ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ad_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: adwords_customer_id {
    type: string
    sql: ${TABLE}.adwords_customer_id ;;
  }

  dimension: final_mobile_urls {
    type: string
    sql: ${TABLE}.final_mobile_urls ;;
  }

  dimension: final_urls {
    type: string
    sql: ${TABLE}.final_urls ;;
  }

#   dimension_group: loaded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.loaded_at ;;
#   }

  dimension: original_id {
    type: string
    sql: ${TABLE}.original_id ;;
  }

#   dimension_group: received {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.received_at ;;
#   }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

#   dimension_group: uuid_ts {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.uuid_ts ;;
#   }

  measure: count {
    type: count
    drill_fields: [id, ad_groups.name, ad_groups.id, ad_performance_reports.count, ad_performance_reports_view.count]
  }
}
