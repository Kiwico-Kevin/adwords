view: email_submitted {
  sql_table_name: javascript.email_submitted ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

#   dimension: context_campaign_ca_20mpaign {
#     type: string
#     sql: ${TABLE}.context_campaign_ca_20mpaign ;;
#   }
#
#   dimension: context_campaign_caampaign {
#     type: string
#     sql: ${TABLE}.context_campaign_caampaign ;;
#   }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.context_campaign_name ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.context_campaign_term ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
  }

#   dimension: context_library_name {
#     type: string
#     sql: ${TABLE}.context_library_name ;;
#   }
#
#   dimension: context_library_version {
#     type: string
#     sql: ${TABLE}.context_library_version ;;
#   }

  dimension: page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  dimension: page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension: page_params {
    type: string
    sql: ${TABLE}.context_page_search ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_source {
    type: string
    sql: ${TABLE}.email_source ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
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

  dimension: newsletter_store {
    type: string
    sql: ${TABLE}.newsletter_store ;;
  }

#   dimension_group: original_timestamp {
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
#     sql: ${TABLE}.original_timestamp ;;
#   }

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
#
#   dimension_group: sent {
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
#     sql: ${TABLE}.sent_at ;;
#   }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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
    drill_fields: [detail*]
  }

  measure: distinct_count {
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.context_campaign_name,
      users.id,
      users.context_library_name,
      users.name
    ]
  }
}