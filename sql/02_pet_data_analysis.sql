-- Pet Data Analysis
-- Builds a per-pet profile with owner segmentation (by pet count), age calculation, and common vs. exotic pet classification.
-- Also identifies the oldest and youngest registered pets.
-- Powers the pet data insights (birth date completeness, owner segments).

WITH pets_cte AS (
    SELECT
        p.id AS pet_id,
        p.owner_id,
        p.name,
        p.gender,
        p.birth_date,
        p.created_at,
        p.animal_type_id,

        owner_stats.pets_per_owner,

        CASE
            WHEN owner_stats.pets_per_owner = 1 THEN '1 pet'
            WHEN owner_stats.pets_per_owner = 2 THEN '2 pets'
            WHEN owner_stats.pets_per_owner <= 4 THEN '3–4 pets'
            ELSE '5+ pets'
        END AS owner_type,

        DATE_DIFF(CURRENT_DATE(), p.birth_date, YEAR) AS age_years,
        DATE_DIFF(CURRENT_DATE(), p.birth_date, MONTH) AS age_months,

        DATE(p.created_at) AS registration_date,
        EXTRACT(YEAR FROM p.created_at) AS registration_year,
        EXTRACT(MONTH FROM p.created_at) AS registration_month

    FROM `analytics-prod-499915.analytics.pets` p

    LEFT JOIN (
        SELECT
            owner_id,
            COUNT(*) AS pets_per_owner
        FROM `analytics-prod-499915.analytics.pets`
        GROUP BY owner_id
    ) owner_stats
        ON p.owner_id = owner_stats.owner_id
)

SELECT
    pc.pet_id,
    pc.owner_id,
    pc.pets_per_owner,
    pc.owner_type,
    pc.name,

    ant.name AS animal_type,

    CASE
        WHEN ant.name IN ('Кіт', 'Собака') THEN 'Common pets'
        WHEN ant.name IS NULL THEN 'Unknown'
        ELSE 'Exotic pets'
    END AS pet_group,

    pc.gender,
    pc.birth_date,
    pc.age_years,
    pc.age_months,

    pc.registration_date,
    pc.registration_year,
    pc.registration_month

FROM pets_cte pc
LEFT JOIN `analytics-prod-499915.analytics.animal_types` ant
    ON pc.animal_type_id = ant.id;


-- ============================================================
-- Oldest & Youngest Registered Pets
-- ============================================================

WITH oldest_pet AS (
    SELECT
        p.id AS pet_id,
        p.owner_id,
        p.name,
        ant.name AS animal_type,
        p.gender,
        p.birth_date,
        DATE_DIFF(CURRENT_DATE(), p.birth_date, YEAR) AS age_years,
        DATE_DIFF(CURRENT_DATE(), p.birth_date, MONTH) AS age_months,
        DATE(p.created_at) AS registration_date
    FROM `analytics-prod-499915.analytics.pets` p
    LEFT JOIN `analytics-prod-499915.analytics.animal_types` ant
        ON p.animal_type_id = ant.id
    WHERE p.birth_date IS NOT NULL
    ORDER BY p.birth_date ASC
    LIMIT 1
),

youngest_pet AS (
    SELECT
        p.id AS pet_id,
        p.owner_id,
        p.name,
        ant.name AS animal_type,
        p.gender,
        p.birth_date,
        DATE_DIFF(CURRENT_DATE(), p.birth_date, YEAR) AS age_years,
        DATE_DIFF(CURRENT_DATE(), p.birth_date, MONTH) AS age_months,
        DATE(p.created_at) AS registration_date
    FROM `analytics-prod-499915.analytics.pets` p
    LEFT JOIN `analytics-prod-499915.analytics.animal_types` ant
        ON p.animal_type_id = ant.id
    WHERE p.birth_date IS NOT NULL
    ORDER BY p.birth_date DESC
    LIMIT 1
)

SELECT 'Oldest pet' AS pet_status, pet_id, owner_id, name, animal_type,
       gender, birth_date, age_years, age_months, registration_date
FROM oldest_pet

UNION ALL

SELECT 'Youngest pet' AS pet_status, pet_id, owner_id, name, animal_type,
       gender, birth_date, age_years, age_months, registration_date
FROM youngest_pet;
