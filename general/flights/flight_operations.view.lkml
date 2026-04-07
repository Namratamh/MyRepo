
view: flight_operations {

  sql_table_name: `cloud-training-demos.looker_flights.flights` ;;

  dimension: flight_num {
    primary_key: yes
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: origin {
    label: "Origin Airport"
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: destination {
    label: "Destination Airport"
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: route {
    description: "Origin to destination route"
    type: string
    sql: CONCAT(${origin}, ' → ', ${destination}) ;;
  }

  dimension_group: departure_date {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.dep_time ;;
  }

  dimension: flight_status {
    type: string
    sql: ${TABLE}.flight_status ;;
  }

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  dimension: delay_delay {
    type: number
    sql: ${TABLE}.delay_delay ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
    label: "Cancelled Flight"
  }

  dimension: diverted {
    type: yesno
    sql: ${TABLE}.diverted ;;
    label: "Diverted Flight"
  }

  measure: cancelled_flights_count {
    type: count
    filters: [cancelled: "yes"]
    label: "No. of Cancelled Flights"
  }

  measure: total_flights {
    type: count_distinct
    sql: ${flight_num} ;;
    description: "Total number of operated flights"
  }

  measure: total_flights_count {
    type: count
    label: "No. of Total Flights"
  }

  measure: delayed_flights_count {
    type: count
    sql: CASE
           WHEN ${TABLE}.arr_delay > 0
             OR ${TABLE}.dep_delay > 0
           THEN 1
         END ;;
    label: "No. of Delayed Flights"
  }

  measure: delayed_flights_percentage {
    label: "Delayed Flights %"
    type: number
    value_format_name: percent_2
    sql: ${delayed_flights_count} / ${total_flights_count}
      END ;;
    description: "Percentage of delayed flights"
  }

  measure: cancelled_flights_percentage {
    label: "Cancelled Flights %"
    type: number
    value_format_name: percent_2
    sql: ${cancelled_flights_count} / ${total_flights_count}
      END ;;
    description: "Percentage of Cancelled flights"
  }



}
