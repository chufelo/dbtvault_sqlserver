{{ config( 
        materialization = 'table',
        tags = ["gri3033", "datamart", "water", "datavault"]
)}}


select 
    sat_company.Company,
    hub_gri.PostingMonth,
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
    {{ ref('hub_gri3033') }} hub_gri
inner join 
    {{ ref('hub_company') }} hub_company
    on
        hub_gri.companyid = hub_company.companyID
inner JOIN
    {{ ref('pit_gri3033') }} pit_gri 
    on 
        hub_gri.gri3033_hk = pit_gri.gri3033_hk
inner JOIN
    {{ ref('sat_company') }} sat_company
    on
        hub_company.company_HK = sat_company.company_hk
inner JOIN
    {{ ref('sat_postingdate') }} sat_date
    on
        hub_gri.postingmonth = sat_date.postingmonth
inner JOIN
    {{ ref('link_company_postingmonth') }} link
    on 
        hub_company.company_hk = link.company_hk
inner JOIN
    {{ ref('hub_postingmonth') }} hub_date
    on 
        hub_date.postingmonth_hk = link.postingmonth_hk
inner JOIN
    {{ ref('sat_gri3033') }} sat_gri
    on 
        link.gri3033_hk = sat_gri.gri3033_hk
where 
    pit_gri.sat_company_ldts = sat_company.LOAD_DATETIME
    and pit_gri.sat_gri3033_ldts = sat_gri.LOAD_DATETIME
    and hub_gri.LOAD_DATETIME = (select max(pit_gri_2.sat_gri3033_ldts) from {{ ref('pit_gri3033') }} pit_gri_2 where hub_gri.gri3033_hk = pit_gri_2.gri3033_hk)
    