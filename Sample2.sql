/* 
JSON example: 

{"ClassId":32000,"Attributes":
    [
        {"ID":4548},
        {"HREF":-1},
        {"HPRECISION":5},
        {"HMETHOD":96},
        {"GEO-METHOD":96},
        {"GEO-PRECISION":5},
        {"GEO-VISIBILITY":0}
    ]
}

*/
SELECT CLASSID, ATRB_ID, HREF, HPRECISION, HMETHOD, GEOMETHOD, GEOPRECISION, GEOVISIBILITY
FROM TABLE2 T1
    CROSS JOIN 
    JSON_TABLE(T1.JSON_DATA, '$' COLUMNS 
        (
            CLASSID INTEGER PATH '$.ClassId', 
            ATRB_ID INTEGER PATH '$.Attributes.ID', 
            HREF INTEGER PATH '$.Attributes.HREF', 
            HPRECISION INTEGER PATH '$.Attributes.HPRECISION', 
            HMETHOD INTEGER PATH '$.Attributes.HMETHOD', 
            GEOMETHOD INTEGER PATH '$.Attributes."GEO-METHOD"', 
            GEOPRECISION INTEGER PATH '$.Attributes."GEO-PRECISION"', 
            GEOVISIBILITY INTEGER PATH '$.Attributes."GEO-VISIBILITY"' 
        )
    )


/* 
JSON example: 

{"ClassId":32000,"Attributes":
    [
        {"Name":"ID","Value":"4548"},
        {"Name":"HREF","Value":"-1"},
        {"Name":"HPRECISION","Value":"5"},
        {"Name":"HMETHOD","Value":"96"},
        {"Name":"GEO-METHOD","Value":"96"},
        {"Name":"GEO-PRECISION","Value":"5"},
        {"Name":"GEO-VISIBILITY","Value":"0"}
    ]
}

*/
SELECT CLASSID, ATRB_ID, HREF, HPRECISION, HMETHOD, GEOMETHOD, GEOPRECISION, GEOVISIBILITY
FROM TABLE1 T1
    CROSS JOIN 
    JSON_TABLE(T1.JSON_DATA, '$[*]' COLUMNS 
        (
            CLASSID INTEGER PATH '$.ClassId', 
            ATRB_ID VARCHAR2(100) PATH '$.Attributes[0]."Value"', 
            HREF VARCHAR2(100) PATH '$.Attributes[1]."Value"', 
            HPRECISION VARCHAR2(100) PATH '$.Attributes[2]."Value"', 
            HMETHOD VARCHAR2(100) PATH '$.Attributes[3]."Value"', 
            GEOMETHOD VARCHAR2(100) PATH '$.Attributes[4]."Value"', 
            GEOPRECISION VARCHAR2(100) PATH '$.Attributes[5]."Value"', 
            GEOVISIBILITY VARCHAR2(100) PATH '$.Attributes[6]."Value"' 
        )
    )

	