CREATE OR REPLACE PROCEDURE fixImgInTtContent()
LANGUAGE plpgsql
AS $$
DECLARE
	checkuid INT;
	checkbodytext TEXT;
	checkconfiguration TEXT;
	checkidentifier TEXT;
	imgCount INT;
	file_uid INT;
	file_src_fixed TEXT;
	sys_file_identifier TEXT;
	file_src_update TEXT;
	cur1 CURSOR FOR
		SELECT tt_content.uid, tt_content.bodytext
		FROM tt_content
		WHERE bodytext ~ '<img'
			AND bodytext LIKE '%data-htmlarea-file-uid%'
			AND bodytext LIKE '%data-htmlarea-file-table="sys_file"%'
		ORDER BY tt_content.uid;
BEGIN
    OPEN cur1;
    LOOP
        FETCH cur1 INTO checkuid, checkbodytext;
        EXIT WHEN NOT FOUND;
		imgCount := (regexp_matches(checkbodytext, '<img', 'g'))[1]::TEXT;
		imgCount := array_length(regexp_matches(checkbodytext, '<img', 'g'), 1);

		WHILE imgCount > 0 LOOP
			BEGIN
				SELECT
					(regexp_matches(checkbodytext, 'data-htmlarea-file-uid="(\d+)"', 'g'))[1]::INT,
					(regexp_matches(sys_file_storage.configuration, '<field index="basePath"><value>([^<]+)</value>', 'g'))[1],
					sys_file.identifier
				INTO file_uid, file_src_fixed, sys_file_identifier
				FROM sys_file
				JOIN sys_file_storage ON sys_file.storage = sys_file_storage.uid
				LIMIT 1;

				file_src_update := '/' || file_src_fixed || sys_file_identifier;
				checkbodytext := regexp_replace(checkbodytext, 'src="[^"]*"', 'src="' || file_src_update || '"', 1);
				imgCount := imgCount - 1;
			EXCEPTION WHEN NO_DATA_FOUND THEN
				imgCount := 0;
			END;
		END LOOP;

		UPDATE tt_content SET bodytext = checkbodytext WHERE uid = checkuid;
	END LOOP;
END $$;
