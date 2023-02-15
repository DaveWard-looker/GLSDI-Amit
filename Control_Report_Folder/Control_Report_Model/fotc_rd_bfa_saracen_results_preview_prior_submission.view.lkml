# The name of this view in Looker is "Fotc Rd Bfa Saracen Results Preview Prior Submission"
view: fotc_rd_bfa_saracen_results_preview_prior_submission {
  label: "Saracen GRCA Result Preview Prior Submission"
  required_access_grants: [explorer_security_bfa_all]
  sql_table_name:@{server_name_fine}.@{schema_name}.FOTC_RD_BFA_SARACEN_RESULTS_PREVIEW_PRIOR_SUBMISSION
    ;;

  set: SARACEN_GRCA {
    fields: [SARACEN_GRCA_CONTROL_REPORT.code,SARACEN_GRCA_CONTROL_REPORT.description_0,SARACEN_GRCA_CONTROL_REPORT.description_1,SARACEN_GRCA_CONTROL_REPORT.description_2,SARACEN_GRCA_CONTROL_REPORT.description_3,SARACEN_GRCA_CONTROL_REPORT.description_4,SARACEN_GRCA_CONTROL_REPORT.description_5,SARACEN_GRCA_CONTROL_REPORT.description_6,SARACEN_GRCA_CONTROL_REPORT.description_7,SARACEN_GRCA_CONTROL_REPORT.description_8,SARACEN_GRCA_CONTROL_REPORT.description_9,SARACEN_GRCA_CONTROL_REPORT.description_10,SARACEN_GRCA_CONTROL_REPORT.description_11,SARACEN_GRCA_CONTROL_REPORT.description_12,SARACEN_GRCA_CONTROL_REPORT.description_13,SARACEN_GRCA_CONTROL_REPORT.description_14,SARACEN_GRCA_CONTROL_REPORT.description_15]
  }

  set: SARACEN_GRCA_Drill_Report {
    fields: [legal_entity,accounting_treatment, s18_account, global_business, fotc_standardised_gl_detail_amount, final_saracen_extract, difference, entity_inclusion,  data_exclusion, variance]
  }

  set: Entity {
    fields: [fotc_rd_mi_flat_dimension_mi_entity_control.leaf,fotc_rd_mi_flat_dimension_mi_entity_control.level_0,fotc_rd_mi_flat_dimension_mi_entity_control.level_1,fotc_rd_mi_flat_dimension_mi_entity_control.level_2,fotc_rd_mi_flat_dimension_mi_entity_control.level_3,fotc_rd_mi_flat_dimension_mi_entity_control.level_4,fotc_rd_mi_flat_dimension_mi_entity_control.level_5,fotc_rd_mi_flat_dimension_mi_entity_control.level_6,fotc_rd_mi_flat_dimension_mi_entity_control.level_7,fotc_rd_mi_flat_dimension_mi_entity_control.level_8,fotc_rd_mi_flat_dimension_mi_entity_control.level_9,fotc_rd_mi_flat_dimension_mi_entity_control.level_10,fotc_rd_mi_flat_dimension_mi_entity_control.level_11,fotc_rd_mi_flat_dimension_mi_entity_control.level_12,fotc_rd_mi_flat_dimension_mi_entity_control.level_13,fotc_rd_mi_flat_dimension_mi_entity_control.level_14,fotc_rd_mi_flat_dimension_mi_entity_control.level_15]
  }

  parameter: format {
    type: string
    hidden: yes
    allowed_value: {
      label: "Millions"
      value: "M"
    }
    allowed_value: {
      label: "Thousands"
      value: "K"
    }
    allowed_value: {
      label: "Billions"
      value: "B"
    }

    allowed_value: {
      label: "ALL"
      value: "X"
    }
  }

  dimension: accounting_treatment {
    label: "Accounting Treatment"
    description: "This column will show values coming from the column Accounting_regulation_category_code coming from the Standardized GL Detail SDI"
    type: string
    sql: ${TABLE}.Accounting_Treatment ;;
  }

  dimension: legal_entity {
    label: "Legal Entity"
    description: "This column will show value coming from the union of the three columns: grca_entity_identifier, managed_entity,contra_entity coming from the Standardized GL Detail SDI. "
    type: string
    sql: ${TABLE}.Legal_Entity ;;
    drill_fields: [Entity*]
  }

  dimension: global_business {
    label: "Global Business"
    description: "This column will show values coming from s18_custom1 of the Standardized GL Detail SDI."
    type: string
    sql: ${TABLE}.Global_Business ;;
  }

  # C22 V2 to add S18_ICP dimension 9Feb2023
  dimension: s18_icp {
    label: "S18 ICP"
    description: "This column will show values coming from the column S18_ICP coming from the Standardized GL Detail SDI"
    type: string
    sql: ${TABLE}.S18_ICP ;;
  }

  # C22 V2 to add Custom_1 dimension 9Feb2023
  dimension: custom_1 {
    label: "Custom 1"
    description: "This column will show values coming from the column Custom_1 coming from the Standardized GL Detail SDI"
    type: string
    sql: ${TABLE}.Custom_1 ;;
  }

  # C22 V2 to add Fotc_Standardised_GL_Detail_Amount dimension 9Feb2023
  measure: fotc_standardised_gl_detail_amount {
    label: "Fotc Standardised GL Detail Amount"
    description: "This column will show values coming from the column Fotc_Standardised_GL_Detail_Amount coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.Fotc_Standardised_GL_Detail_Amount ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{fotc_standardised_gl_detail_amount_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{fotc_standardised_gl_detail_amount_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{fotc_standardised_gl_detail_amount_b._linked_value}}
          {% else %}
          {{fotc_standardised_gl_detail_amount_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: fotc_standardised_gl_detail_amount_b {
    label: "Total"
    description: "This column will show values coming from the column Fotc_Standardised_GL_Detail_Amount coming from the Standardized GL Detail SDI"
    type: sum
    hidden: yes
    sql: ${TABLE}.Fotc_Standardised_GL_Detail_Amount ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: fotc_standardised_gl_detail_amount_m {
    label: "Total"
    description: "This column will show values coming from the column Fotc_Standardised_GL_Detail_Amount coming from the Standardized GL Detail SDI"
    hidden: yes
    type: sum
    sql: ${TABLE}.Fotc_Standardised_GL_Detail_Amount ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: fotc_standardised_gl_detail_amount_k {
    label: "Total"
    hidden: yes
    description: "This column will show values coming from the column Fotc_Standardised_GL_Detail_Amount coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.Fotc_Standardised_GL_Detail_Amount ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: fotc_standardised_gl_detail_amount_all {
    label: "Total"
    hidden: yes
    description: "This column will show values coming from the column Fotc_Standardised_GL_Detail_Amount coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.Fotc_Standardised_GL_Detail_Amount ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  # C22 V2 to add FINAL_Saracen_Extract dimension 9Feb2023
  measure: final_saracen_extract {
    label: "FINAL Saracen Extract"
    description: "This column will show values coming from the column FINAL_Saracen_Extract coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.FINAL_Saracen_Extract ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{final_saracen_extract_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{final_saracen_extract_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{final_saracen_extract_b._linked_value}}
          {% else %}
          {{final_saracen_extract_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: final_saracen_extract_b {
    label: "Total"
    description: "This column will show values coming from the column FINAL_Saracen_Extract coming from the Standardized GL Detail SDI"
    type: sum
    hidden: yes
    sql: ${TABLE}.FINAL_Saracen_Extract ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: final_saracen_extract_m {
    label: "Total"
    description: "This column will show values coming from the column FINAL_Saracen_Extract coming from the Standardized GL Detail SDI"
    hidden: yes
    type: sum
    sql: ${TABLE}.FINAL_Saracen_Extract ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: final_saracen_extract_k {
    label: "Total"
    hidden: yes
    description: "This column will show values coming from the column FINAL_Saracen_Extract coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.FINAL_Saracen_Extract ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: final_saracen_extract_all {
    label: "Total"
    hidden: yes
    description: "This column will show values coming from the column FINAL_Saracen_Extract coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.FINAL_Saracen_Extract ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  # C22 V2 to add Fotc_Saracen_P3_Extract_Amount dimension 9Feb2023
  measure: fotc_saracen_p3_extract_amount {
    label: "Fotc Saracen P3 Extract Amount"
    description: "This column will show values coming from the column Fotc_Saracen_P3_Extract_Amount coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.Fotc_Saracen_P3_Extract_Amount ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{fotc_saracen_p3_extract_amount_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{fotc_saracen_p3_extract_amount_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{fotc_saracen_p3_extract_amount_b._linked_value}}
          {% else %}
          {{fotc_saracen_p3_extract_amount_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: fotc_saracen_p3_extract_amount_b {
    label: "Total"
    description: "This column will show values coming from the column Fotc_Saracen_P3_Extract_Amount coming from the Standardized GL Detail SDI"
    type: sum
    hidden: yes
    sql: ${TABLE}.Fotc_Saracen_P3_Extract_Amount ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: fotc_saracen_p3_extract_amount_m {
    label: "Total"
    description: "This column will show values coming from the column Fotc_Saracen_P3_Extract_Amount coming from the Standardized GL Detail SDI"
    hidden: yes
    type: sum
    sql: ${TABLE}.Fotc_Saracen_P3_Extract_Amount ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: fotc_saracen_p3_extract_amount_k {
    label: "Total"
    hidden: yes
    description: "This column will show values coming from the column Fotc_Saracen_P3_Extract_Amount coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.Fotc_Saracen_P3_Extract_Amount ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: fotc_saracen_p3_extract_amount_all {
    label: "Total"
    hidden: yes
    description: "This column will show values coming from the column Fotc_Saracen_P3_Extract_Amount coming from the Standardized GL Detail SDI"
    type: sum
    sql: ${TABLE}.Fotc_Saracen_P3_Extract_Amount ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }


  dimension: s18_account {
    label: "GRCA Code"
    description: "This column will show values coming from grca_reconciliation_key of the Standardized GL Detail SDI."
    type: string
    sql: ${TABLE}.s18_account ;;
    drill_fields: [SARACEN_GRCA*]
  }

  measure: difference {
    label: "Difference"
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc SARACEN Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and S18_account. "
    type: sum
    sql: ${TABLE}.Difference  ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{difference_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{difference_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{difference_b._linked_value}}
          {% else %}
          {{difference_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }
  measure: difference_b {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc SARACEN Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and S18_account. "
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: difference_m {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc SARACEN Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and S18_account. "
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }


  measure: difference_k {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc SARACEN Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and S18_account. "
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }
  measure: difference_all {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc SARACEN Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and S18_account. "
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: data_exclusion {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘S18_Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts."
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{data_exclusion_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{data_exclusion_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{data_exclusion_b._linked_value}}
          {% else %}
          {{data_exclusion_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }


  measure: data_exclusion_b {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘S18_Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts."
    type: sum
    hidden: yes
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }


  measure: data_exclusion_m {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘S18_Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }


  measure: data_exclusion_k {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘S18_Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: data_exclusion_all {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘S18_Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: entity_inclusion {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amount in the ‘s18_value,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts. "
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{entity_inclusion_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{entity_inclusion_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{entity_inclusion_b._linked_value}}
          {% else %}
          {{entity_inclusion_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: entity_inclusion_b {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amount in the ‘s18_value,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: entity_inclusion_m {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amount in the ‘s18_value,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: entity_inclusion_k {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amount in the ‘s18_value,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }
  measure: entity_inclusion_all {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amount in the ‘s18_value,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and SARACEN extract tables amounts. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  # C22 V2 to add Variance dimension 9Feb2023
  measure: variance {
    label: "Variance"
    description: "This column will show values coming from the column Variance coming from the Standardized GL Detail SDI "
    type: sum
    sql: ${TABLE}.Variance ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{variance_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{variance_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{variance_b._linked_value}}
          {% else %}
          {{variance_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: variance_b {
    label: "Variance"
    description: "This column will show values coming from the column Variance coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Variance ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: variance_m {
    label: "Variance"
    description: "This column will show values coming from the column Variance coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Variance ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: variance_k {
    label: "Variance"
    description: "This column will show values coming from the column Variance coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Variance ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }
  measure: variance_all {
    label: "Variance"
    description: "This column will show values coming from the column Variance coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Variance ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  # C22 V2 to add Total dimension 9Feb2023
  measure: total {
    label: "Total"
    description: "This column will show values coming from the column Total coming from the Standardized GL Detail SDI "
    type: sum
    sql: ${TABLE}.Total ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{total_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{total_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{total_b._linked_value}}
          {% else %}
          {{total_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: total_b {
    label: "Total"
    description: "This column will show values coming from the column Total coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Total ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: total_m {
    label: "Total"
    description: "This column will show values coming from the column Total coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Total ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

  measure: total_k {
    label: "Total"
    description: "This column will show values coming from the column Total coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Total ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }
  measure: total_all {
    label: "Total"
    description: "This column will show values coming from the column Total coming from the Standardized GL Detail SDI "
    hidden: yes
    type: sum
    sql: ${TABLE}.Total ;;
    value_format: "#,##0.00"
    drill_fields: [SARACEN_GRCA_Drill_Report*]
  }

}
