view: embed_url {



  sql_table_name: `cloud-training-demos.looker_flights.flights` ;;

  dimension: carrier {

    sql: ${TABLE}.carrier ;;

  }

  measure: flight_count {

    type: count

  }

  dimension: weather_iframe {

    sql: 'Open Weather' ;;

    html:
    <a href="https://www.timeanddate.com/weather/"

                 target="_blank">

      Open Weather Website
      </a> ;;

  }

}
