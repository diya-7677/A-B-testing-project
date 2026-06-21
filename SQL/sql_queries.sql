-- Queries
-- 1. Click through rate 
USE ab_testing_project;

SELECT 
    e.experiment_variant,
    COUNT(DISTINCT c.user_id) AS users_clicked,
    COUNT(DISTINCT e.user_id) AS total_users,
    ROUND(
        COUNT(DISTINCT c.user_id) * 100.0 /
        COUNT(DISTINCT e.user_id),
        2
    ) AS ctr_percentage
FROM experiment_group e
LEFT JOIN clicks c 
    ON e.user_id = c.user_id
GROUP BY e.experiment_variant;

-- 2. Conversion Rate
USE ab_testing_project;
SELECT 
    e.experiment_variant,
    COUNT(DISTINCT cv.user_id) AS converted_users,
    COUNT(DISTINCT e.user_id) AS total_users,
    ROUND(
        COUNT(DISTINCT cv.user_id) * 100.0 /
        COUNT(DISTINCT e.user_id),
        2
    ) AS conversion_rate
FROM experiment_group e
LEFT JOIN conversions cv 
    ON e.user_id = cv.user_id
GROUP BY e.experiment_variant;

-- uplift percent
WITH conversion_rates AS (
    SELECT 
        e.experiment_variant,
        ROUND(
            COUNT(DISTINCT cv.user_id) * 100.0 /
            COUNT(DISTINCT e.user_id),
            2
        ) AS conversion_rate
    FROM experiment_group e
    LEFT JOIN conversions cv
        ON e.user_id = cv.user_id
    GROUP BY e.experiment_variant
)

SELECT 
    ROUND(
        (
            MAX(CASE WHEN experiment_variant='B' THEN conversion_rate END)
            -
            MAX(CASE WHEN experiment_variant='A' THEN conversion_rate END)
        )
        /
        MAX(CASE WHEN experiment_variant='A' THEN conversion_rate END)
        * 100,
        2
    ) AS uplift_percentage
FROM conversion_rates;

-- 3. Average sessions
USE ab_testing_project;
SELECT 
    e.experiment_variant,
    ROUND(AVG(s.duration_seconds),2) AS avg_session_duration
FROM sessions s
JOIN experiment_group e
    ON s.user_id = e.user_id
GROUP BY e.experiment_variant;

-- 4. Bounce rate
USE ab_testing_project;
SELECT 
    e.experiment_variant,
    COUNT(
        CASE 
            WHEN s.duration_seconds < 100 THEN 1
        END
    ) AS bounced_sessions,

    COUNT(*) AS total_sessions,

    ROUND(
        COUNT(
            CASE 
                WHEN s.duration_seconds < 100 THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS bounce_rate

FROM sessions s
JOIN experiment_group e
    ON s.user_id = e.user_id

GROUP BY e.experiment_variant;
