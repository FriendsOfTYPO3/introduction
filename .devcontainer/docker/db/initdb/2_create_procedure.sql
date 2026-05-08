/*!40101 SET COLLATION_CONNECTION=@@COLLATION_DATABASE */;
delimiter //

CREATE PROCEDURE IF NOT EXISTS fixImgInTtContent()
BEGIN
    DECLARE checkuid INT;
    DECLARE checkbodytext LONGTEXT;
    DECLARE checkconfiguration LONGTEXT;
    DECLARE checkidentifier TEXT;
    DECLARE cur1_list_isdone BOOLEAN DEFAULT FALSE;
    DECLARE imgCount INT;

    # first fetch all tt_content having suspicious img elements
    DECLARE cur1 CURSOR FOR SELECT tt_content.uid, tt_content.bodytext
        FROM tt_content
        WHERE ExtractValue(bodytext,'count(//img)')>0 and bodytext like "%data-htmlarea-file-uid%" and bodytext like '%data-htmlarea-file-table="sys_file"%'
        ORDER BY tt_content.uid;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET cur1_list_isdone = TRUE;


    # process all suspicous tt_content
    OPEN cur1;
    content_loop: LOOP
        FETCH FROM cur1 INTO checkuid, checkbodytext;
        IF cur1_list_isdone THEN LEAVE content_loop; END IF;
        SELECT ExtractValue(checkbodytext,'count(//img)') INTO imgCount FROM dual;
        REPEAT
            # process all img elements in this bodytext
            BEGIN
                SELECT ExtractValue(checkbodytext, concat('//img[', imgCount, ']/@data-htmlarea-file-uid' )),
                        ExtractValue(sys_file_storage.configuration,'//field[@index="basePath"]/value'),
                        sys_file.identifier
                # fetch original file uid, storage basePath and file identifier
                into @file_uid, @file_src_fixed, @sys_file_identifier
                FROM sys_file, sys_file_storage
                # only select the current img element and join to sys_file and sys_file_storage
                WHERE ExtractValue(checkbodytext, concat('//img[', imgCount, ']/@data-htmlarea-file-table'))='sys_file'
                    AND ExtractValue(checkbodytext,concat('//img[', imgCount, ']/@data-htmlarea-file-uid'))=sys_file.uid
                    AND sys_file.storage=sys_file_storage.uid;

                # build the correct src value
                SET  @file_src_update = concat("/", @file_src_fixed, @sys_file_identifier);

                # update the current img element in the bodytext
                SET checkbodytext = UpdateXML(checkbodytext, concat('//img[' COLLATE utf8mb4_0900_ai_ci, imgCount, ']/@src'), concat('src="', @file_src_update, '"'));
                SET imgCount = imgCount - 1;
            END;
        UNTIL imgCount = 0 END REPEAT;

        # store the updated bodytext back to the record
        update tt_content set bodytext = checkbodytext where uid=checkuid;
        commit;
    END LOOP;
    CLOSE cur1;
END;
