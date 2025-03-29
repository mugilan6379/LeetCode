CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    # Write your MySQL query statement below.
    declare nthSalary int;
    IF (SELECT COUNT(DISTINCT salary) FROM Employee) < N or N<0 THEN
        RETURN NULL;  -- If there are fewer than N distinct salaries, return NULL
    END IF;

    SELECT salary
    INTO nthSalary
    FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT N
    ) AS temp
    ORDER BY salary ASC
    LIMIT 1;

    -- If nthSalary is NULL, return NULL
    IF nthSalary IS NULL THEN
        RETURN NULL;
    ELSE
        RETURN nthSalary;
    END IF;

END

