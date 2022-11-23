{{ config( 
        materialization = 'table',
        tags = ["gri3033", "datamart", "water", "datavault"]
)}}


select 
    Company,
    PostingMonth,
    fw_surf_withd,
    nfw_surf_withd,
    fw_gr_withd,
    nfw_gr_withd,
    fw_sea_withd,
    nfw_sea_withd,
    fw_prod_withd,
    nfw_prod_withd,
    fw_third_withd,
    nfw_third_withd,
    fw_surf_withd_s,
    nfw_surf_withd_s,
    fw_gr_withd_s,
    nfw_gr_withd_s,
    fw_sea_withd_s,
    nfw_sea_withd_s,
    fw_prod_withd_s,
    nfw_prod_withd_s,
    fw_third_withd_s,
    nfw_third_withd_s,
    fw_surf_withd +
    nfw_surf_withd +
    fw_gr_withd +
    nfw_gr_withd +
    fw_sea_withd +
    nfw_sea_withd +
    fw_prod_withd +
    nfw_prod_withd +
    fw_third_withd +
    nfw_third_withd +
    fw_surf_withd_s +
    nfw_surf_withd_s +
    fw_gr_withd_s +
    nfw_gr_withd_s +
    fw_sea_withd_s +
    nfw_sea_withd_s +
    fw_prod_withd_s +
    nfw_prod_withd_s +
    fw_third_withd_s +
    nfw_third_withd_s as total_withdrawal
FROM
    {{ ref('hub_company') }} hub_company
left JOIN
    {{ ref('sat_company') }} sat_company
    on
        hub_company.company_hk = sat_company.company_hk
left JOIN
    {{ ref('link_company_postingmonth') }} link
    on 
        hub_company.company_hk = link.company_hk
left JOIN
    {{ ref('hub_postingmonth') }} hub_date
    on 
        hub_date.postingmonth_hk = link.postingmonth_hk
left JOIN
    {{ ref('sat_gri3033') }} sat_gri
    on 
        link.gri3033_hk = sat_gri.gri3033_hk