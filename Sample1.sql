SELECT * FROM 
JSON_TABLE('{"ClassId":32000,"Attributes":
    [
        {"Name":"ID","Value":"4548"},
        {"Name":"HREF","Value":"-1"},
        {"Name":"HPRECISION","Value":"5"},
        {"Name":"HMETHOD","Value":"96"},
        {"Name":"GEO-METHOD","Value":"96"},
        {"Name":"GEO-PRECISION","Value":"5"},
        {"Name":"GEO-VISIBILITY","Value":"0"}
    ]
}', '$[*]' COLUMNS 
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
	