DECLARE
    string1      VARCHAR2 (100);
    string2      VARCHAR2 (100);
    diff_count   NUMBER := 0;
BEGIN
    SELECT varchar_column
    INTO string1
    FROM schema.table_name_1
    WHERE condition;

    SELECT varchar_column
    INTO string2
    FROM schema.table_name_1
    WHERE condition;

    -- loop through each character in the strings
    FOR i IN 1 .. LEAST (LENGTH (string1), LENGTH (string2))
    LOOP
        -- compare the characters at the current position
        IF SUBSTR (string1, i, 1) <> SUBSTR (string2, i, 1)
        THEN
            diff_count := diff_count + 1;
            -- output the position and the different characters
            DBMS_OUTPUT.put_line (
                   'Difference found at position '
                || i
                || ': '
                || SUBSTR (string1, i, 1)
                || ' vs '
                || SUBSTR (string2, i, 1));
        END IF;
    END LOOP;

    -- output the total number of differences
    DBMS_OUTPUT.put_line ('Total differences: ' || diff_count);
END;
